package org.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.action.RegisterAction;

//注册拦截
public class RegisterInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        //得到RegisterAction类对象
        RegisterAction ra=(RegisterAction)actionInvocation.getAction();
        //如果两次密码不一致,返回自定的逻辑视图
        if(!ra.getPassword2().equals(ra.getModel().getPassword())){
            return ra.PASSWORDUNSAME;
        }
        //否则继续执行其它拦截器或后面的Action
        return actionInvocation.invoke();
    }
}
