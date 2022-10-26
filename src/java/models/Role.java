/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;


public class Role {
    private int role_id;
    private String role_name;

    public Role(int role_id, String role_name) {
        this.role_id = role_id;
        this.role_name = role_name;
    }
    /**
     * Creates a new instance of Role
     */
    public Role(int role_id){
        this.role_id = role_id;
        if(role_id==1)
        {
            this.role_name = "system admin";
        }
        if(role_id==2)
        {
            this.role_name = "regular user";
        }
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setSole_name(String sole_name) {
        this.role_name = role_name;
    }
    
    
    
    
}
