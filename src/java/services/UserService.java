/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.UserDBUtil;
import java.util.List;
import models.Role;
import models.User;

/**
 *
 * @author valentinmorales
 */
public class UserService {
    
    public User get(String email) throws Exception {
        UserDBUtil userDB = new UserDBUtil();
        User user = userDB.get(email);
        return user;
    }
    
    public List<User> getAll() throws Exception {
        UserDBUtil userDB = new UserDBUtil();
        List<User> users = userDB.getAll();
        return users;
    }
    
    public void insert(String email, String fname, String lname, String password, int role_id) throws Exception {
        Role role = new Role(role_id);
        User user = new User(email, fname, lname, password);
        user.setRole(role);
        UserDBUtil userDB = new UserDBUtil();
        userDB.insert(user);
    }
    
    public void update(String email, String fname, String lname, String password, int role_id) throws Exception {
        Role role = new Role(role_id);
        User user = new User(email,fname,lname,password);
        user.setRole(role);
        UserDBUtil userDB = new UserDBUtil();
        userDB.update(user);
    }
    
    public void delete(String email) throws Exception {
        User user = new User();
        user.setEmail(email);
        UserDBUtil userDB = new UserDBUtil();
        userDB.delete(user);
    }
    
}
