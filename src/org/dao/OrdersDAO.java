package org.dao;

import org.model.Orders;
import org.model.User;

import java.util.List;

public interface OrdersDAO {
    //根据用户id查找所有订单
    List<Orders> getOrdersByUserId(int userid);
//    //初次持久化订单
//    Orders saveOrders(User usr);
}
