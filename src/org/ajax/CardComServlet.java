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


//卡牌合成
@SuppressWarnings("all")
public class CardComServlet extends HttpServlet {
    @Autowired
    UserService us;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //响应类型
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //输出(返回)流
        PrintWriter out = resp.getWriter();

        //获取Session对象
        HttpSession sssn = req.getSession();
        //尝试从Session对象中获取这个用户,如果为空,说明用户 还没有登录

        if (null == sssn.getAttribute("usr")) {
            //返回状态码为-1
            out.print(-1);
            out.flush();
            out.close();
            return;
        }

        //运行至此用户已经登录,取出来
        User usr = (User) sssn.getAttribute("usr");
        String flag= req.getParameter("flag");
        if("0".equals(flag)){
            sssn.setAttribute("usr",usr);
        }
        else if("1".equals(flag)){
            if(usr.getSale1()<4){
                out.print(-2);
                out.flush();
                out.close();
                return;
            }

            out.print(true==us.oneToTwo(usr)?(
                    1+" "+usr.getSale1()+" "+usr.getSale2()+" "+usr.getSale3()):(-3+" "+usr.getSale1()+" "+usr.getSale2()+" "+usr.getSale3()));
            sssn.setAttribute("usr",usr);
        }else if("2".equals(flag)){
            if(usr.getSale2()<4){
                out.print(-2);
                out.flush();
                out.close();
                return;
            }
            out.print(true==us.twoToThree(usr)?(
                    1+" "+usr.getSale1()+" "+usr.getSale2()+" "+usr.getSale3()):(-3+" "+usr.getSale1()+" "+usr.getSale2()+" "+usr.getSale3()));
            sssn.setAttribute("usr",usr);
        }else{
            out.print("ERROR");
        }
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

}
