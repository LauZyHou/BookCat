package org.service;



import org.model.Orders;

import java.util.List;
//订单历史
public interface HistoryService {
    List<Orders> HistoryOrders(int userid);
}
