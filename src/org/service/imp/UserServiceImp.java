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

    //更新业务
    @Override
    public User update(User relusr){
        //按传入的用户名查询Login对象,判断重名
        Login lgn=usr_d.findLoginByName(relusr.getName());
        //如果查询结果不为空,说明该用户名已经被占用
        if(null!=lgn)
            return null;//返回的本User就是null
        usr_d.updateUser(relusr);
        //调用Service层的方法尝试登录以获取User对象
        return relusr;
    }

    //用户更新自己的地址和电话
    @Override
    public User updateAddressAndTel(User usr, String address, String tel) {
        usr.setAddress(address);
        usr.setTel(tel);
        return usr_d.updateUser(usr);
    }

    //重置用户密码为123456
    public void updPsw(int id){
        usr_d.updatePsw(id);
    }

    public UserDAO getUsr_d() {
        return usr_d;
    }

    public void setUsr_d(UserDAO usr_d) {
        this.usr_d = usr_d;
    }
}
