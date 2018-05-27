package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.User;
import com.opensymphony.xwork2.ModelDriven;
import org.service.UserService;

import java.util.Map;

public class SelfMsgUpdateAction extends ActionSupport implements ModelDriven<User> {

    private UserService us;
    private User user=null;
    @Override
    public String execute() throws Exception{
        //判断用户名是否为空，过长，座右铭是否过长
        System.out.println(user.getName());
        System.out.println(user.isSex());
        if(user.getName()==""){
            return ERROR;
        }
        Map sssn=ActionContext.getContext().getSession();
        User relusr= (User) sssn.get("usr");
        relusr.setName(user.getName());
        relusr.setSex(user.isSex());
        relusr.setMotto(user.getMotto());

        //调用Service层的方法尝试登录以获取User对象
        relusr=us.update(relusr);
        //更新成功时
        if (null != relusr){
            //将这个User存在Session里
            sssn.put("usr", relusr);
            return SUCCESS;
        }
        return ERROR;
    }

    public UserService getUs() {
        return us;
    }

    public void setUs(UserService us) {
        this.us = us;
    }

    public User getModel(){
        return user == null ? user = new User() : user;
    }
}

