package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Orders;
import org.model.User;
import org.service.HistoryService;

import java.util.List;
import java.util.Map;

public class HistoryAction extends ActionSupport implements ModelDriven<Orders> {
    //查看历史订单记录
    //实现ModelDriven(模型驱动)的接口,为其泛型指定这个对象的实现类
    private Orders historyByharf;

    // 组合一个处理用户登录的业务逻辑类的对象,该对象将由Spring单例模式注入
    private HistoryService hs;

    @Override
    public String execute() throws Exception {
        //先获取当前用户id，如果用户没有登陆返回公用的failed界面
        Map sssn=ActionContext.getContext().getSession();
        if(sssn.containsKey("usr")){
            User user=(User) sssn.get("usr");
            //调用service层的服务来进行查询历史订单
            List<Orders> orders=hs.HistoryOrders(user.getId());
            //将获取到的历史订单存放到session中
            sssn.put("hisorders",orders);
            return SUCCESS;
        }
        return ERROR;
    }

    public HistoryService getHs() {
        return hs;
    }

    public void setHs(HistoryService hs) {
        this.hs = hs;
    }

    @Override
    public Orders getModel() {
        return historyByharf == null ? historyByharf = new Orders() : historyByharf;
    }
}
