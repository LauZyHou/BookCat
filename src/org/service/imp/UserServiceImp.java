package org.service.imp;

import org.dao.UserDAO;
import org.model.User;
import org.service.UserService;

public class UserServiceImp implements UserService {
    // 需要组合用户的UserDAO以使用
    private UserDAO usr_d;

    // 登录业务
    @Override
    public User login(String name, String password) {
        return usr_d.login_B(name, password);
    }

    public UserDAO getUsr_d() {
        return usr_d;
    }

    public void setUsr_d(UserDAO usr_d) {
        this.usr_d = usr_d;
    }
}
