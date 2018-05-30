package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.Leave;
import org.model.User;
import org.service.LeaveService;

import java.util.List;
import java.util.Map;

//获取留言
public class LeaveAction extends ActionSupport {
    private LeaveService ls;
    public String execute() throws Exception {
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
