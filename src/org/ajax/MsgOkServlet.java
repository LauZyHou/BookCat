package org.ajax;

import org.dao.imp.UserDAOImp;
import org.model.User;
import org.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//确认(保存收货信息)
@SuppressWarnings("all")
public class MsgOkServlet extends HttpServlet {
    @Autowired
    UserService us;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //响应类型
        resp.setContentType("text/html");
        //输出(返回)流
        PrintWriter out=resp.getWriter();

        //获取Session对象
        HttpSession sssn=req.getSession();
        //尝试从Session对象中获取这个用户,如果为空,说明用户还没有登录
        if(null==sssn.getAttribute("usr")){
            //返回状态码为-1
            out.print(-1);
            out.flush();
            out.close();
            return ;
        }

        //运行至此用户已经登录,取出来
        User usr=(User)sssn.getAttribute("usr");
        //从请求中获取地址和电话号
        String address=req.getParameter("address");
        String tel=req.getParameter("tel");

        //调用更新收货信息的Service
        us.updateAddressAndTel(usr,address,tel);
        //返回一个正值状态码
        out.print(1);
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

}
