package org.ajax;

import org.model.Orders;
import org.model.User;
import org.service.BookService;
import org.service.OrdersService;
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
public class GenerateOrderServlet extends HttpServlet {
    @Autowired
    OrdersService odr_s;
    @Autowired
    BookService bk_s;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //响应类型
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
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
            return;
        }
        //执行到此,说明用户已经登录了,取出来
        User usr=(User)sssn.getAttribute("usr");

        //-------------------------------------------------

        //获得传来的要购买的书的id
        String ids_str=req.getParameter("ids_str");
        //参数没获得
        if(null==ids_str || ids_str.length()<=0){
            out.print("-4");
            out.flush();
            out.close();
            return ;
        }

        //-------------------------------------------------

        //切分为数组,并转成Integer数组
        String[] ids_arrys_str=ids_str.split(" ");
        Integer[] ids_arrys_int=new Integer[ids_arrys_str.length];
        for(int i=0;i<ids_arrys_str.length;i++){
            ids_arrys_int[i]=Integer.parseInt(ids_arrys_str[i]);
        }

        //-------------------------------------------------

        //获取Application对象
        ServletContext app=this.getServletContext();
        //HashMap模拟购物车逻辑
        HashMap<Integer,Integer> usr_hs;
        //购物车不存在
        if(null==app.getAttribute("usrid"+usr.getId())){
            out.print("-2");
            out.flush();
            out.close();
            return ;
        }
        //取出购物车
        usr_hs= (HashMap<Integer, Integer>) app.getAttribute("usrid"+usr.getId());
        //购物车为空
        if(usr_hs.isEmpty()){
            out.print("-3");
            out.flush();
            out.close();
            return ;
        }

        //-------------------------------------------------

        //要生成订单的HashMap
        HashMap<Integer,Short> toGnrOdr_hs=new HashMap<>();
        //遍历存进去
        for(int i:ids_arrys_int){
//            System.out.println(i+"~"+usr_hs.get(i));
            toGnrOdr_hs.put(i,usr_hs.get(i).shortValue());
        }
        //检查会不会库存不足
        boolean ok=bk_s.checkBooksNumSufficient(toGnrOdr_hs);
        //如果有书库存不足
        if(!ok){
            out.print("-5");
            out.flush();
            out.close();
            return ;
        }

        //获取选择的是哪个优惠券
        Short cardType= (Short) sssn.getAttribute("card");

        //调用Service保存
        Orders odr=odr_s.gnrtOrder(usr,toGnrOdr_hs,cardType);

        out.print(odr.getId()+",折后总价:"+odr.getSum());
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
