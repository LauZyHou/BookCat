package org.ajax;

import org.model.User;
import org.service.AdminService;
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

@SuppressWarnings("all")
public class AdminUpdServlet extends HttpServlet {
    @Autowired
    private AdminService as;

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }
    //通过ID查找用户信息
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //响应类型
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //输出(返回)流
        PrintWriter out=resp.getWriter();
        //从请求中取出id号
        String id_s=req.getParameter("userId");
        String number_s=req.getParameter("number");
        String name_s=req.getParameter("name");
        //如果从请求中没能获得
        if(null==id_s){
            //返回状态码为-1
            out.print(-1);
            out.flush();
            out.close();
            return;
        }
        //获取Session对象
        HttpSession sssn=req.getSession();
        //将请求中获取的id解析成整数
        int id_i=Integer.parseInt(id_s);
        Short number_i=Short.parseShort(number_s);
        //调用service层的方法获得用户Us
        User us=as.updSale(name_s,id_i,number_i);
        sssn.setAttribute("usr",us);
        String s=us.getId()+"$"+us.getName()+"$"+us.getSale1()+"$"+us.getSale2()+"$"+us.getSale3();
        //成功执行,返回给客户端状态码
        out.print(s);
        out.flush();
        out.close();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
