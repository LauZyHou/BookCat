package org.service;

import org.model.Orders;
import org.model.User;

import java.util.Map;

//提供订单服务
public interface OrdersService {
    //生成订单(用户,书籍-数目表,优惠券种类)
    Orders gnrtOrder(User usr,Map<Integer,Short> toGnrOdr_hs,Short cardType);
}
