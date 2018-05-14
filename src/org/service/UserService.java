package org.service;

import org.model.User;

public interface UserService {
    public User login(String username, String password);
}
