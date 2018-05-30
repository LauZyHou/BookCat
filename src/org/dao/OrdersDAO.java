package org.dao;

import org.model.BkOdr;
import org.model.Orders;
import org.model.User;

import java.sql.Timestamp;
import java.util.List;

public interface OrdersDAO {
    //根据用户id查找所有订单
    List<Orders> getOrdersByUserId(int userid);
    //初次持久化订单(用户,时间,总价)
    Orders saveOrders(User usr, Timestamp time,Short sum);
    //持久化订单和书的关系
    void saveBkOdr(BkOdr bkodr);
}
