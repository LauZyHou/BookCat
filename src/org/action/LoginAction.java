package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Login;
import org.model.User;
import org.service.UserService;

import java.util.Map;

//用户登录
//实现ModelDriven(模型驱动)的接口,为其泛型指定这个对象的实现类
@SuppressWarnings("all")
public class LoginAction extends ActionSupport implements ModelDriven<Login> {
    // 其内的信息通过Struts2框架属性注入
    // 也需要领域对象,但要做实例化
    // 可以在这里实例化,也可以在getModel方法中实例化
    // 总之getModel必须返回实例化之后的领域对象,因为要往里面写值了
    private Login lgnByForm=null;
    // 组合一个处理用户登录的业务逻辑类的对象,该对象将由Spring单例模式注入
    private UserService us;

    @Override
    public String execute() throws Exception {
        //调用Service层的方法尝试登录以获取User对象
        User usr=us.login(lgnByForm.getName(),lgnByForm.getPassword());
        //登录成功时
        if (null != usr){
            //将这个User存在Session里
            Map sssn=ActionContext.getContext().getSession();
            sssn.put("usr", usr);
            sssn.put("sum",null==sssn.get("sum")?0:sssn.get("sum"));
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

    @Override
    public Login getModel() {
        return lgnByForm == null ? lgnByForm = new Login() : lgnByForm;
    }
}
