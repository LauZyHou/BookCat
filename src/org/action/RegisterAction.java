package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Login;
import org.model.User;
import org.service.UserService;

import java.util.Map;

//用户注册
@SuppressWarnings("all")
public class RegisterAction extends ActionSupport implements ModelDriven<Login> {
    //表单注入用户名和密码
    private Login lgn=null;
    private String password2;
    //组合一个处理用户登录的业务逻辑类的对象,该对象将由Spring单例模式注入
    private UserService us;
    //两次密码不一致时的逻辑视图
    public final String PASSWORDUNSAME="passwordunsame";

    @Override
    public String execute() throws Exception {
        //尝试注册并获取User对象
        User usr=us.regist(lgn.getName(),lgn.getPassword());
        //如果注册成功
        if(null!=usr){
            //存到Session里
            Map sssn=ActionContext.getContext().getSession();
            sssn.put("usr", usr);
            return SUCCESS;
        }
        //注册失败
        return ERROR;
    }

    @Override
    public Login getModel() {
        return null==lgn?lgn=new Login():lgn;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public UserService getUs() {
        return us;
    }

    public void setUs(UserService us) {
        this.us = us;
    }
}
