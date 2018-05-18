package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.model.User;
import org.service.UserService;

import java.util.Map;

@SuppressWarnings("all")
public class LoginAction extends ActionSupport {
    // 这两个信息通过Struts2框架属性注入
    private String usrname;
    private String password;
    // 这个信息由用户的输入来根据业务逻辑生成
    private String message;
    // 组合一个处理用户登录的业务逻辑类的对象,该对象将由Spring单例模式注入
    private UserService us;
    // 总是返回INDEX视图
    private static final String INDEX = "index";

    @Override
    public String execute() throws Exception {
        //调用Service层的方法尝试登录以获取User对象
        User usr=us.login(usrname,password);
        //登录成功时
        if (null != usr){
            //将这个User存在Session里
            Map sssn=ActionContext.getContext().getSession();
            sssn.put("usr", usr);
            message = "欢迎你" + usrname;
        }
        else
            message = "登录失败";
        return INDEX;
    }

    public String getUsrname() {
        return usrname;
    }

    public void setUsrname(String usrname) {
        this.usrname = usrname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public UserService getUs() {
        return us;
    }

    public void setUs(UserService us) {
        this.us = us;
    }
}
