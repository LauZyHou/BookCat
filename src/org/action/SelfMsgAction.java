package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Login;
import java.util.Map;

//个人信息
public class SelfMsgAction extends ActionSupport implements ModelDriven<Login> {

    @Override
    public String execute() throws Exception{
        Map sssn=ActionContext.getContext().getSession();
        if(sssn.containsKey("usr")){
            return SUCCESS;
        }
        return ERROR;
    }

    @Override
    public Login getModel() {
        return null;
    }
}
