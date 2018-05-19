package org.service;

import org.model.User;

//用户业务的接口,提供为用户服务的方法
public interface UserService {
    //用户使用用户名和密码登录,如登录成功将返回用户PO
    User login(String name, String password);
    //用户使用用户名的密码进行注册,如注册成功将返回User对象
    User regist(String name,String password);
}
