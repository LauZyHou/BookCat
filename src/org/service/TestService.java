package org.service;

import org.model.Orders;
import org.model.User;

//测试Service,请把它直接当做DAO用!
public interface TestService {
    //添加指定名称的书籍
    void addBook(String name);
    //添加留言
    void addLeave();
    //持久化order
    Orders saveOrder(User usr);
}
