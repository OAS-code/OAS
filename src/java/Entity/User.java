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
    int role;
    int status;
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

    public User(int id, String fullname, String username, String password, String phonenumber, String email, String address, int role, int status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.role = role;
        this.status = status;
    }

    public User(String fullname, String username, String password, String phonenumber, String email, String address, int role, int status, String salt) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.status = status;
        this.role = role;
        this.salt = salt;
    }

    public User(int id, String fullname, String username, int role, int status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.role = role;
        this.status = status;
    }

    public User(int id, String fullname, String phonenumber, String address) {
        this.id = id;
        this.fullname = fullname;
        this.phonenumber = phonenumber;
        this.address = address;
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
        if (status == 0) {
            return "Inactive";
        } else if (status == 1) {
            return "Active";
        } else {
            return "Inactive";
        }
    }

    public String getRole() {
        if (role == 2) {
            return "Administrator";
        } else if (role == 1) {
            return "Auction staff";
        } else if (role == 0) {
            return "Customer";
        } else {
            return "Customer";
        }
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
        if (status.equalsIgnoreCase("Active")) {
            this.status = 1;
        }
        else {
            this.status = 0;
        }
    }

    public void setRole(String role) {
        if (role.equalsIgnoreCase("Administrator")) {
            this.role = 2;
        }
        else if (role.equalsIgnoreCase("Auction staff")) {
            this.role = 1;
        }
        else if (role.equalsIgnoreCase("Customer")) {
            this.role = 0;
        }
        else {
            this.role = 0;
        }
    }
}
