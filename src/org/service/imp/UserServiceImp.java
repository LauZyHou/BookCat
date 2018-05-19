package org.service.imp;

import org.dao.UserDAO;
import org.model.Login;
import org.model.User;
import org.service.UserService;

public class UserServiceImp implements UserService {
    // 需要组合用户的UserDAO以使用
    private UserDAO usr_d;

    // 登录业务
    @Override
    public User login(String name, String password) {
        //按传入的用户名查询Login对象
        Login lgn=usr_d.findLoginByName(name);
        //如果查询结果为空
        if(null==lgn)
            return null;//返回空,因为没有这个用户,也就没有User对象
        //如果查询结果中的密码是匹配的
        if(password.equals(lgn.getPassword()))
            return lgn.getUserById();//利用1-1映射获取User对象并返回
        //执行到此,说明密码不匹配,返回空
        return null;
    }

    //注册业务
    @Override
    public User regist(String name, String password) {
        //按传入的用户名查询Login对象,因为login表字段更少,但同时也能标识用户
        Login lgn=usr_d.findLoginByName(name);
        //如果查询结果不为空,说明该用户名已经被占用
        if(null!=lgn)
            return null;//返回的本User就是null
        //运行至此,要对用户进行注册
        usr_d.createUserAndLogin(name,password);
        //返回注册完的User对象
        return usr_d.findUserByName(name);
    }


    public UserDAO getUsr_d() {
        return usr_d;
    }

    public void setUsr_d(UserDAO usr_d) {
        this.usr_d = usr_d;
    }
}
