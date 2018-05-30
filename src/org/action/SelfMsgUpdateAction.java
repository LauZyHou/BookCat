package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.User;
import com.opensymphony.xwork2.ModelDriven;
import org.service.UserService;

import java.util.Map;

//更新个人信息
public class SelfMsgUpdateAction extends ActionSupport implements ModelDriven<User> {
    private UserService us;
    private User user=null;
    //返回的uri
    private String respVal="/other/failed.jsp";
    @Override
    public String execute() throws Exception{
        //用户名长度不符合要求
        if(user.getName().length()<2 || user.getName().length()>8){
            respVal="/setting/selfmsg.jsp?status=-1";
            return ERROR;
        }
        //读书宣言长度不符合要求
        else if(user.getMotto().length()>40){
            respVal="/setting/selfmsg.jsp?status=-2";
            return ERROR;
        }
        Map sssn=ActionContext.getContext().getSession();
        User newusr= (User) sssn.get("usr");

        //判断是否和其他人重名,如果重名
        if(!us.checkUserNameById(user.getName(),newusr.getId())){
            respVal="/setting/selfmsg.jsp?status=-3";
            return ERROR;
        }

        //更改session里的User
        newusr.setName(user.getName());
        newusr.setSex(user.isSex());
        newusr.setMotto(user.getMotto());

        //调用Service层的方法更新
        newusr=us.updateNoCheck(newusr);

        //更新成功时
        if (null != newusr){
            //将这个User存在Session里
            sssn.put("usr", newusr);
            respVal="/setting/selfmsg.jsp";
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

    public String getRespVal() {
        return respVal;
    }

    public void setRespVal(String respVal) {
        this.respVal = respVal;
    }
}
