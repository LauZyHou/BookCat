package org.service.imp;

import org.dao.OrdersDAO;
import org.model.Orders;
import org.service.HistoryService;

import java.util.List;
//订单历史
public class HistoryServiceImp implements HistoryService {

    private OrdersDAO order_d;

    //查询历史订单业务
    @Override
    public List<Orders> HistoryOrders(int userid) {
        List<Orders> orders_l=order_d.getOrdersByUserId(userid);
        //执行到此,说明没有匹配的书,返回空
        if(null==orders_l)
            return null;//返回空,因为没有这个书,也就没有Book对象
        return orders_l;
    }

    public OrdersDAO getOrder_d() {
        return order_d;
    }

    public void setOrder_d(OrdersDAO order_d) {
        this.order_d = order_d;
    }
}
