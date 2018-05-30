package org.ajax;

import org.model.User;
import org.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@SuppressWarnings("all")
public class GetCarServlet extends HttpServlet {
    @Autowired
    BookService bs;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //响应类型
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //输出(返回)流
        PrintWriter out=resp.getWriter();

        //获取Session
        HttpSession sssn=req.getSession();

        //判断Session中用户是否为空
        if(null==sssn.getAttribute("usr")){
            //返回字符串提示先登录
            out.print("请先登录");
            out.flush();
            out.close();
            return ;
        }

        //从Session中获取用户
        User usr=(User)sssn.getAttribute("usr");

        //获取Application对象
        ServletContext app=this.getServletContext();
        //如果购物车还没建立
        if(null==app.getAttribute("usrid"+usr.getId())){
            out.print("连购物车都没有呢,快去添加点书籍吧~");
            out.flush();
            out.close();
            return ;
        }
        //取出购物车
        HashMap<Integer,Integer> usr_hs= (HashMap<Integer, Integer>) app.getAttribute("usrid"+usr.getId());
        //如果里面还是空的
        if(usr_hs.isEmpty()){
            out.print("购物车里什么都没有呢,快去添加点书籍吧~");
            out.flush();
            out.close();
            return ;
        }
        //返回表格
        out.print("<table style=\"margin: 0 auto; width: 100%;\">");
        //表头
        String[] arry_th={"书号","书名","数目","增加","减少","移除"};
        out.print("<tr>");
        for(String s:arry_th){
            out.print("<th style=\"text-align: center;\">"+s+"</th>");
        }
        out.print("</tr>");
        //循环输出表格每一项 FIXME
        for(Integer key:usr_hs.keySet()){
            out.print("<tr id=\"tr_"+key+"\" style=\"text-align: center;\">");
            //书号,书名,数目
            out.print("<td>"+key+"</td><td>书名</td><td id=\"td_num_"+key+"\">"+usr_hs.get(key)+"</td>");
            //加
            out.print("<td><a href=\"javascript:void(0)\" onclick=\"clkDeal('inc',"+key+")\">+</a></td>");
            //减
            out.print("<td><a href=\"javascript:void(0)\" onclick=\"clkDeal('dec',"+key+")\">-</a></td>");
            //删
            out.print("<td><a href=\"javascript:void(0)\" onclick=\"clkDeal('rmv',"+key+")\">x</a></td>");
            out.print("</tr>");
        }
        //闭合
        out.print("</table>");
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }
}
