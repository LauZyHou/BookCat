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

//处理购物车的方法
@SuppressWarnings("all")
public class DealWithCarServlet extends HttpServlet {

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
            //"已经掉线啦,请重新登录"
            out.print("-1");
            out.flush();
            out.close();
            return ;
        }

        //从Session中获取用户
        User usr=(User)sssn.getAttribute("usr");

        //获取Application对象
        ServletContext app=this.getServletContext();
        //"啊哦,购物车不见了,请重新建立购物车~"
        if(null==app.getAttribute("usrid"+usr.getId())){
            out.print("-2");
            out.flush();
            out.close();
            return ;
        }
        //取出购物车
        HashMap<Integer,Integer> usr_hs= (HashMap<Integer, Integer>) app.getAttribute("usrid"+usr.getId());
        //"啊哦,购物车是空的,请刷新页面后重新添加~"
        if(usr_hs.isEmpty()){
            out.print("-3");
            out.flush();
            out.close();
            return ;
        }

        //-----------------开始操作----------------------

        //处理方式(增、减、删)
        String deal=req.getParameter("deal");
        //处理的那本书的id
        String id=req.getParameter("id");
        //"[!]deal或id未能获得"
        if(null==deal || null==id){
            out.print("-4");
            out.flush();
            out.close();
            return ;
        }

        //从购物车中查找这本书的数目
        Integer bkid=Integer.parseInt(id);
        Integer bknum=usr_hs.get(bkid);
        //"[!]购物车中不存在的书籍号(id)"
        if(null==bknum){
            out.print("-5");
            out.flush();
            out.close();
            return ;
        }

        //Session里缓存的总数
        Integer sum= (Integer) sssn.getAttribute("sum");

        //增加操作
        if("inc".equals(deal)){
            bknum+=1;
            //写回购物车
            usr_hs.put(bkid,bknum);
            //更新总数目
            sum+=1;
            //和书的id拼接后返回,以使其根据这里局部刷新
            out.print(id+" "+bknum);
        }
        //减少操作
        else if("dec".equals(deal)){
            bknum-=1;
            sum-=1;
            usr_hs.put(bkid,bknum);
            //减少后
            if(bknum<=0){
                usr_hs.remove(bkid);
                //将-1拼接给id,以表示要删除该id所在tr标签
                out.print(id+" -1");
            }else {
                out.print(id + " " + bknum);
            }
        }
        //删除操作
        else if("rmv".equals(deal)){
            sum-=usr_hs.get(bkid);
            usr_hs.remove(bkid);
            //将-1拼接给id,以表示要删除该id所在tr标签
            out.print(id+" -1");
        }
        //"[!]不存在的操作方式(deal的值)"
        else {
            out.print("-6");
            out.flush();
            out.close();
            return ;
        }

        //成功操作后,购物车写回Application
        app.setAttribute("usrid"+usr.getId(),usr_hs);

        //Application更新好之后,Session也要更新购物车里的总数目
        sssn.setAttribute("sum",sum);

        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
