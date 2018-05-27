package org.service;

import org.model.Book;
import org.model.User;

//管理员业务的接口,提供为用户服务的方法
public interface AdminService {
    //根据Id查找用户信息
    User findUser(int id);
    //通过ID删除用户
    void delUser(int id);
    //修改卡券数量
    User updSale(String sl, int id, short number);
    //通过ID获得书籍信息
    Book findBook(int id);
    //根据ID删除book
    void delBook(int id);
    //修改书籍信息
    Book updBook(String sl, int id, String number);

}
