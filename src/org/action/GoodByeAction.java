package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

//注销
public class GoodByeAction extends ActionSupport {

    @Override
    public String execute() throws Exception {
        Map sssn=ActionContext.getContext().getSession();
        if(sssn.containsKey("usr")){
            sssn.remove("usr");
            sssn.remove("sum");
        }
        return SUCCESS;
    }
}
