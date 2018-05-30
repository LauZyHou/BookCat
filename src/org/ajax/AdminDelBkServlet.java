package org.ajax;

import org.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.tools.BookCatTools;
import org.tools.ConstObj;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@SuppressWarnings("all")
public class AdminDelBkServlet  extends HttpServlet {
    @Autowired
    private AdminService as;

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //响应类型
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //输出(返回)流
        PrintWriter out=resp.getWriter();
        //从请求中取出id号
        String id_s=req.getParameter("bookId");
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
        //删除书籍
        as.delBook(id_i);
        //将对应的图片移动到回收站
        BookCatTools.moveTotherFolders(ConstObj.picUri+"Exhibition",id_s+".jpg",ConstObj.picUri+"BookRecy");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
