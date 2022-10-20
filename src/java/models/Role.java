/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;


public class Role {
    private int role_id;
    private String sole_name;

    public Role(int role_id, String sole_name) {
        this.role_id = role_id;
        this.sole_name = sole_name;
    }
    /**
     * Creates a new instance of Role
     */
    public Role() {
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getSole_name() {
        return sole_name;
    }

    public void setSole_name(String sole_name) {
        this.sole_name = sole_name;
    }
    
    
    
    
}
