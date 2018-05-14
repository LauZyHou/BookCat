package org.dao;

import org.model.User;

public interface UserDAO {
    public User login_A(String name, String password);
    public User login_B(final String name, final String password);
}
