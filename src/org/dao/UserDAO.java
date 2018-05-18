package org.dao;

import org.model.Login;
import org.model.User;

public interface UserDAO {
    User login_A(String name, String password);

    User login_B(final String name, final String password);

    //根据给定的name查询用户Login对象
    Login findLoginByName(String name);
}
