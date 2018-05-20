package org.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Login;

//管理员登录
public class AdminLoginAction extends ActionSupport implements ModelDriven<Login> {
    private Login lgn;//普通Login对象伪装成管理员对象

    @Override
    public String execute() throws Exception {
        //方便开发
        if(0==lgn.getName().length() && 0==lgn.getPassword().length())
            return SUCCESS;
        if(lgn.getName().equals("lzh") && lgn.getPassword().equals("3838438"))
            return SUCCESS;
        return ERROR;
    }

    @Override
    public Login getModel() {
        return null==lgn?lgn=new Login():lgn;
    }
}
