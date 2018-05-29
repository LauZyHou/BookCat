package org.service;

import org.model.User;

import java.util.List;

//用户业务的接口,提供为用户服务的方法
public interface UserService {
    //用户使用用户名和密码登录,如登录成功将返回用户PO
    User login(String name, String password);
    //用户使用用户名的密码进行注册,如注册成功将返回User对象
    User regist(String name,String password);
    //用户个人信息更新
    User update(User relusr);
    //用户更新自己的地址和电话
    User updateAddressAndTel(User usr,String address,String tel);
    //重置用户密码为123456
    void updPsw(int id);
    //根据充值价格顺序查询用户
    List<User> findallusersByMoney();
    //根据卡片类型获取用户优惠卡数量
    Short getSalenumber(User usr,Short sale);
    //使用优惠卡3用户更新自己的优惠卡数量
    User updateSales3(User usr);
    //检查某id使用某name是否合法
    boolean checkUserNameById(String name,Integer id);
    //无检查更新
    User updateNoCheck(User usr);
    //1合成2
    boolean oneToTwo(User usr);
    //2合成3
    boolean twoToThree(User usr);
}
