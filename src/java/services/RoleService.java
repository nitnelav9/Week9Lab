/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.RoleDBUtil;
import java.util.List;
import static jdk.nashorn.internal.runtime.Debug.id;
import models.Role;
import models.User;

/**
 *
 * @author valentinmorales
 */
public class RoleService {
    
    public Role get(User user) throws Exception {
        RoleDBUtil roleDB = new RoleDBUtil();
        Role role = roleDB.get(user);
        return role;
    }
    
    public List<Role> getAll() throws Exception {
        RoleDBUtil roleDB = new RoleDBUtil();
        List<Role> roles = roleDB.getAll();
        return roles;
    }
    
}
