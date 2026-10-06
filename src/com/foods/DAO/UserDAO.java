package com.foods.DAO;

import com.foods.model.User;

public interface UserDAO {
    boolean registerUser(User u);
    User loginUser(String phone, String password);
    boolean phoneExists(String phone);
}
