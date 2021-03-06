package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Book;
import org.model.Leave;
import org.service.BookService;
import org.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//点击某一本书的图片,将请求该书的详细信息
@SuppressWarnings("all")
public class BookMsgAction extends ActionSupport implements ModelDriven<Book> {
    Book requestBook=null;
    @Autowired
    private BookService bs;
    @Autowired
    private LeaveService ls;
    @Override
    public String execute() throws Exception {
        //查询并返回
        requestBook=bs.getBookById(requestBook.getId());
        //获取request(而不是Session)
        Map reqt=(Map) ActionContext.getContext().get("request");
        //绑定上去
        reqt.put("nowbook",requestBook);
        //获取该书的留言信息
        List<Leave> leaves_l=ls.findComments(requestBook.getId());
        //获取该书的留言用户名
        ArrayList<String> username=new ArrayList<String>();
        int counts=0;
        if(leaves_l!=null){
            for(Leave leave:leaves_l){
                String name=leave.getUserByUserid().getName();
                username.add(counts,name);
                counts++;
            }
        }
        //绑定上去
        reqt.put("nowcomments",leaves_l);
        reqt.put("nowusernames",username);
        return SUCCESS;
    }

    @Override
    public Book getModel() {
        return null==requestBook?requestBook=new Book():requestBook;
    }

    public BookService getBs() {
        return bs;
    }

    public void setBs(BookService bs) {
        this.bs = bs;
    }

    public LeaveService getLs() {
        return ls;
    }

    public void setLs(LeaveService ls) {
        this.ls = ls;
    }
}
