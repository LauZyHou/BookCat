package org.mytools;

import com.opensymphony.xwork2.ActionSupport;
import org.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;

//测试Action,直接调用测试Service中的方法
public class TestAction extends ActionSupport {
    @Autowired
    TestService ts;

    @Override
    public String execute() throws Exception {
        //在这里测试
        ts.addLeave();
        return SUCCESS;
    }

    public TestService getTs() {
        return ts;
    }

    public void setTs(TestService ts) {
        this.ts = ts;
    }
}
