package org.ajax;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import org.model.User;
import org.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

@SuppressWarnings("all")
public class AdminFindServlet extends HttpServlet {
    @Autowired
    private AdminService as;

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }
    //通过ID查找用户信息
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //响应类型
        resp.setContentType("text/html");
        //输出(返回)流
        PrintWriter out=resp.getWriter();
        //从请求中取出id号
        String id_s=req.getParameter("userid");
        System.out.println(id_s);
        //如果从请求中没能获得
        if(null==id_s){
            //返回状态码为-1
            out.print(-1);
            out.flush();
            out.close();
            return;
        }
        //获取Session对象
//        Map ssn=ActionContext.getContext().getSession();
        HttpSession sssn=req.getSession();
//        System.out.println("here");
//        //尝试从Session对象中获取这个用户,如果为空,说明用户还没有登录
//        if(null==sssn.getAttribute("admin")){
//            //返回状态码为-2
//            out.print(-2);
//            out.flush();
//            out.close();
//            return;
//        }
        //将请求中获取的id解析成整数
        int id_i=Integer.parseInt(id_s);
        System.out.println(id_i);
        //调用service层的方法获得用户Us
        User us=as.findUser(id_i);


        sssn.setAttribute("usr",us);
        String s=String.valueOf(us.getId())+" "+String.valueOf(us.getName())+" "+String.valueOf(us.getSale1())+" "+String.valueOf(us.getSale2())+" "+String.valueOf(us.getSale3());
        System.out.println(s);
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
