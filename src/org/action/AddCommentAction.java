package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Book;
import org.model.Leave;
import org.model.User;
import org.service.BookService;
import org.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
public class AddCommentAction extends ActionSupport implements ModelDriven<Leave> {
    Leave comments=null;
    String bokid;

    @Autowired
    private BookService bs;
    @Autowired
    private LeaveService ls;

    @Override
    public String execute() throws Exception {
        User user=new User();
        Book nbook=new Book();
        //request来存放评论
        Map reqt= (Map) ActionContext.getContext().get("request");
        //session来获取书
        Map sssn=  ActionContext.getContext().getSession();
        int id=Integer.parseInt(bokid);
        nbook=bs.getBookById(id);
        //绑定上去
        reqt.put("nowbook",nbook);
        if(!sssn.containsKey("usr"))
            return ERROR;
        user=(User) sssn.get("usr");
        int userid=user.getId();
        int bookid=nbook.getId();
        String comment=comments.getComments();
        ls.addComments(userid,bookid,comment);
        //获取该书的留言信息
        List<Leave> leaves_l=ls.findComments(nbook.getId());
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
    public Leave getModel() {
        return null==comments?comments=new Leave():comments;
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

    public String getBokid() {
        return bokid;
    }

    public void setBokid(String bokid) {
        this.bokid = bokid;
    }
}
