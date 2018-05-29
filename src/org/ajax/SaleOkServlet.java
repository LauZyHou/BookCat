package org.ajax;

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
public class SaleOkServlet extends HttpServlet {
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
        //尝试从Session对象中获取这个用户,如果为空,说明用户 还没有登录

        if(null==sssn.getAttribute("usr")){
            //返回状态码为-1
            out.print(-1);
            out.flush();
            out.close();
            return ;
        }

        //运行至此用户已经登录,取出来
        User usr=(User)sssn.getAttribute("usr");
        //从请求中获取卡片类型并和数据库比较
        String scard=req.getParameter("card");
        Short card=new Short(scard);

        Short salenumber=(Short)us.getSalenumber(usr,card);

        if(salenumber<=0){
            System.out.println("卡片数量为0");
            out.print(-2);
            out.flush();
            out.close();
            return ;
        }else if(card==3){
            User user=us.updateSales3(usr);
            sssn.setAttribute("usr",user);
            sssn.setAttribute("card",card);
            //返回一个正值状态码
            out.print(1);
            out.flush();
            out.close();
        }
        else{
            //返回一个正值状态码
            sssn.setAttribute("card",card);
            out.print(1);
            out.flush();
            out.close();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

}