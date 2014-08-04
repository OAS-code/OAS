/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author MrTu
 */
public class User {

    int id;
    String fullname;
    String username;
    String password;
    String phonenumber;
    String email;
    String address;
    String role;
    String status; 
    String salt;
    public User() {
    }

    public User(String fullname, String username, String password, String phonenumber, String email, String address, String salt) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.salt = salt;
    }

    public User(String fullname, String username, String password, String phonenumber, String email, String address) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
    }

    public User(int id, String fullname, String username, String password, String phonenumber, String email, String address, String role, String status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.status = status;
        this.role = role;
    }

    public User(String fullname, String username, String password, String phonenumber, String email, String address, String role, String status) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.status = status;
        this.role = role;
    }

    public User(int id, String fullname, String username, String role, String status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.status = status;
        this.role = role;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }
    
    public int getId() {
        return id;
    }

    public String getFullname() {
        return fullname;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getStatus() {
        return status;
    }

    public String getRole() {
        return role;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setRole(String role) {
        this.role = role;
    }  
}
