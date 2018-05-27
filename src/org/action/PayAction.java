package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.Book;
import org.model.User;
import org.service.BookService;

import java.util.*;

//用户请求pay页面
public class PayAction extends ActionSupport {
    private BookService bs;
    private String valPage;

    public String execute() throws Exception {
        //调用Service层的方法获取当前用户的购物车书籍对象hashmap
        Map session = (Map) ActionContext.getContext().get("session");

        //通过userid从application获取购物车中的书籍
        Map application = (Map) ActionContext.getContext().get("application");
        //获取当前用户ID（为了获取application的map对象usrid+用户id的value值（map对象（bookid，num））
        User user = (User) session.get("usr");
        if(null==user){
            setValPage("/join/login.jsp?status=please");
            return ERROR;
        }
        Map book_m = (Map) application.get("usrid" + user.getId());
        if(null==book_m){
            setValPage("/main/hot.jsp?status=please");
            return ERROR;
        }
        //用迭代器输出购物车里（map对象）的键值对，存在session中，为了获取图书的简介
        Iterator<Map.Entry<Integer, Integer>> entries = book_m.entrySet().iterator();
        List<Book> book_l = new ArrayList<Book>();
        while (entries.hasNext()) {
            Map.Entry<Integer, Integer> entry = entries.next();
            book_l.add((Book) bs.getBookById(entry.getKey()));
        }
        session.put("book_l", book_l);
        return SUCCESS;
    }

    public BookService getBs() {
        return bs;
    }

    public void setBs(BookService bs) {
        this.bs = bs;
    }

    public String getValPage() {
        return valPage;
    }

    public void setValPage(String valPage) {
        this.valPage = valPage;
    }
}
