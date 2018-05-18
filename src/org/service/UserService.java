package org.service;

import org.model.User;

public interface UserService {
    User login(String username, String password);
}
