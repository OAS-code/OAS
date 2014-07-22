/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.User;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author MrTu
 */
public class UserDAO {

    private Connection conn = null;
    private Statement state = null;
    private ResultSet rs = null;
    private PreparedStatement pre = null;

    public UserDAO() {
        try {
         System.out.println("Connecting to DB using the following details:");
         javax.naming.Context ctx = new javax.naming.InitialContext();
         String host = (String) ctx.lookup("java:comp/env/db-host"); System.out.println(host);
         String port = (String) ctx.lookup("java:comp/env/db-port"); System.out.println(port);
         String database = (String) ctx.lookup("java:comp/env/db-database"); System.out.println(database);
         String username = (String) ctx.lookup("java:comp/env/db-username"); System.out.println(username);
         String password = (String) ctx.lookup("java:comp/env/db-password"); System.out.println(password);
         connection("jdbc:mysql://" + host + ":" + port + "/" + database,username,password);
        //connection("jdbc:mysql://127.0.0.1:3306/auction?useUnicode=true&characterEncoding=UTF-8", "root", "1234");
         } catch (NamingException ex) {
          Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
    }

    private void connection(String ulr, String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = (Connection) DriverManager.getConnection(ulr, username, password);
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int add(User user) {
        int n = 0;
        try {
            String sql = "INSERT INTO user (fullname,username,password,phonenumber,email,address,role,status) VALUES (?,?,?,?,?,?,?,?)";

            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFullname());
            pre.setString(2, user.getUsername());
            pre.setString(3, user.getPassword());
            pre.setString(4, user.getPhonenumber());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getAddress());
            pre.setString(7, user.getRole());
            pre.setString(8, user.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
public int addUser(User user) {
        int n = 0;
        try {
            String sql = "INSERT INTO user (username,password,fullname,phonenumber,email,address) VALUES (?,?,?,?,?,?)";

            pre = conn.prepareStatement(sql);
           
            pre.setString(1, user.getUsername());
            pre.setString(2, user.getPassword());
            pre.setString(3, user.getFullname());
            pre.setString(4, user.getPhonenumber());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getAddress());
           
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    /* public ArrayList<User> list(String sql) {
     ArrayList<User> arr = new ArrayList<User>();

     try {
     state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
     rs = state.executeQuery(sql);
     String fullname = null, username = null, password = null, phonenumber = null, email = null, address = null;
     boolean status = true;
     int id = 0;
     while (rs.next()) {
     id = rs.getInt("id");
     fullname = rs.getString("fullname");
     username = rs.getString("username");
     password = rs.getString("password");
     phonenumber = rs.getString("phonenumber");
     email = rs.getString("email");
     address = rs.getString("address");
     status = rs.getBoolean("status");
     User user = new User(id, fullname, username, password, phonenumber, email, address, status);
     arr.add(user);
     }
     } catch (SQLException ex) {
     Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
     }
     return arr;
     }*/
    public ArrayList<User> view() throws SQLException {
        String sql = "SELECT * FROM user";
        ArrayList<User> arr = new ArrayList<User>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            String fullname, username, role, status;
            int id;
            while (rs.next()) {
                id = rs.getInt("id");
                fullname = rs.getString("fullname");
                username = rs.getString("username");
                status = rs.getString("status");
                role = rs.getString("role");
                User user = new User(id, fullname, username, status, role);
                arr.add(user);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            state.close();
            conn.close();
        }
        return arr;
    }

    public ArrayList<User> searchUser(String search, String rol, String stt) {
        String sql = "SELECT * FROM user WHERE MATCH(fullname, username) AGAINST ('" + search + "') AND role LIKE '%" + rol + "%' AND status LIKE '" + stt + "%'";
        String sql1 = "SELECT * FROM user WHERE role LIKE '%" + rol + "%' AND status LIKE '" + stt + "%'";
        ArrayList<User> arr = new ArrayList<>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            if (search.equals("")) {
                rs = state.executeQuery(sql1);
                String fullname, username, role, status;
                int id;
                while (rs.next()) {
                    id = rs.getInt("id");
                    fullname = rs.getString("fullname");
                    username = rs.getString("username");
                    status = rs.getString("status");
                    role = rs.getString("role");
                    User user = new User(id, fullname, username, status, role);
                    arr.add(user);
                }
            } else {
                rs = state.executeQuery(sql);
                String fullname, username, role, status;
                int id;
                while (rs.next()) {
                    id = rs.getInt("id");
                    fullname = rs.getString("fullname");
                    username = rs.getString("username");
                    status = rs.getString("status");
                    role = rs.getString("role");
                    User user = new User(id, fullname, username, status, role);
                    arr.add(user);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public ResultSet search(int id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int delete(int id) {
        int n = 0;
        String sql = "DELETE FROM user WHERE id = " + id;
        try {
            state = (Statement) conn.createStatement();
            n = state.executeUpdate(sql);
            state.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int update(User user) {
        int n = 0;
        String sql = "UPDATE user SET fullname = ?, username = ?, phonenumber = ?, email = ?, address = ?, role = ?, status = ? WHERE id = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFullname());
            pre.setString(2, user.getUsername());
            pre.setString(3, user.getPhonenumber());
            pre.setString(4, user.getEmail());
            pre.setString(5, user.getAddress());
            pre.setString(6, user.getRole());
            pre.setString(7, user.getStatus());
            pre.setInt(8, user.getId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

     public boolean checkLogin(String username, String password) {
        try {
            String sql = "Select * From user Where username = ? and password = ?";
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            
            rs = pre.executeQuery();
            boolean result = rs.next();
            rs.close();
            pre.close();
            conn.close();
            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
    }
}
