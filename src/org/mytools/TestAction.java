package org.mytools;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.Orders;
import org.model.User;
import org.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

//测试Action,直接调用测试Service中的方法
public class TestAction extends ActionSupport {
    @Autowired
    TestService ts;

    @Override
    public String execute() throws Exception {
        //在这里测试
        Map sssn=(Map) ActionContext.getContext().getSession();
        User usr= (User) sssn.get("usr");
        Orders odr=ts.saveOrder(usr);
        System.out.println(odr.getId());
        return SUCCESS;
    }

    public TestService getTs() {
        return ts;
    }

    public void setTs(TestService ts) {
        this.ts = ts;
    }
}
