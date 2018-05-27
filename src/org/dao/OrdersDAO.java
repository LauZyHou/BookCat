package org.dao;

import org.model.Orders;

import java.util.List;

public interface OrdersDAO {
    List<Orders> getOrdersByUserId(int userid);
}
