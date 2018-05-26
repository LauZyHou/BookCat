package org.ajax;


import org.model.User;

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
public class AddToCarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //响应类型
        resp.setContentType("text/html");
        //输出(返回)流
        PrintWriter out=resp.getWriter();

        //(购物车HashMap)--------------------------------------------

        //从请求中取出这本书的id号
        String id_s=req.getParameter("bookid");
        //如果从请求中没能获得
        if(null==id_s){
            //返回状态码为-2
            out.print(-2);
            out.flush();
            out.close();
            return;
        }
        //将请求中获取的id解析成整数
        Integer id_i=Integer.parseInt(id_s);

        //获取Session对象
        HttpSession sssn=req.getSession();
        //尝试从Session对象中获取这个用户,如果为空,说明用户还没有登录
        if(null==sssn.getAttribute("usr")){
            //返回状态码为-1
            out.print(-1);
            out.flush();
            out.close();
            return;
        }

        //执行到此,说明用户已经登录了,要为他添加这本书的id到他的购物车
        User usr=(User)sssn.getAttribute("usr");
        //获取Application对象
        ServletContext app=this.getServletContext();
        //HashMap模拟购物车逻辑
        HashMap<Integer,Integer> usr_hs;
        //看看这个用户有没有保存其中,如果没有
        if(null==app.getAttribute("usrid"+usr.getId())){
            //为其创建一个HashMap作为他的购物车
            usr_hs=new HashMap<>();
            //将这个HashMap引用存进Application对象中
            app.setAttribute("usrid"+usr.getId(),usr_hs);
        }
        //执行到此,已经能确保该用户在Application范围内具有购物车了,取出来
        usr_hs= (HashMap<Integer, Integer>) app.getAttribute("usrid"+usr.getId());
        //看看购物车中之前有没有记录过这本书,如果没有
        if(false==usr_hs.containsKey(id_i)){
            //将这本书记录在购物车中,只是目前数值为0
            usr_hs.put(id_i,0);
        }
        //执行到此,已经能确保该用户的购物车中记录了这本书了,将记录值加1
        usr_hs.put(id_i,usr_hs.get(id_i)+1);
        //将记录后的购物车写回Application作用域
        app.setAttribute("usrid"+usr.getId(),usr_hs);
        //成功执行,返回给客户端状态码1
        out.print(1);
        out.flush();
        out.close();

        //(重新统计并记录总数)--------------------------------------------
        //因为Session客户端关闭就没了,所以不妨重新统计
        int sum=0;
        //遍历将每本书数目加起来
        for(Integer key:usr_hs.keySet()){
            sum+=usr_hs.get(key);
        }
        //存进Session里
        sssn.setAttribute("sum",sum);
        System.out.println("添加购物车完成");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
