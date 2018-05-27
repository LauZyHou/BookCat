package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.Book;
import org.model.Leave;
import org.model.User;
import org.service.LeaveService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LeaveAction extends ActionSupport {
    private LeaveService ls;
    public String execute() throws Exception {
        //调用Service层的方法获取热门书籍对象列表
        System.out.print("热门查询action");
        List<Leave> uleaves=null;
        //获取存在session里的登陆用户的User对象，并获取User对象的name进行留言查询
        Map sssn=ActionContext.getContext().getSession();
        User usr= (User) sssn.get("usr");
        if(null==usr)
            return ERROR;
        int userid=usr.getId();
        //查询用户留言，获取用户留言List<Leave>
        uleaves=ls.getUserLeaves(userid);
        //将该用户的留言存入session
        System.out.print(uleaves.size());
        sssn.put("uleaves", uleaves);
        return SUCCESS;
    }

    public LeaveService getLs() {
        return ls;
    }

    public void setLs(LeaveService ls) {
        this.ls = ls;
    }
}
