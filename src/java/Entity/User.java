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
    boolean status;

    public User() {
    }

    public User(int id, String fullname, String username, boolean status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.status = status;
    }

    public User(String fullname, String username, String password, String phonenumber, String email, String address, boolean status) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.status = status;
    }
    
    public User(int id, String fullname, String username, String password, String phonenumber, String email, String address, boolean status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.status = status;
    }

    public User(int id, String fullname, String username, String phonenumber, String email, String address, boolean status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.status = status;
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

    public boolean getStatus() {
        return status;
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

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String StatusToString() {
        if (this.status) {
            return "Active";
        } else {
            return "Deactive";
        }
    }
}
