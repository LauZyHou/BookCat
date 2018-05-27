package org.dao;

import org.model.Login;
import org.model.User;

public interface UserDAO {
    //根据给定的name查询用户Login对象
    Login findLoginByName(String name);

    //根据给定的name查询用户User对象
    User findUserByName(String name);

    //根据给定的用户名和密码建立User实体和相应的Login实体
    void createUserAndLogin(String name,String password);

    //更新数据库中的表
    User updateUser(User relusr);

    //修改用户密码
    void updatePsw(int id);

    //根据给定的ID查询用户Login对象
    Login findLoginById(int id);
}
