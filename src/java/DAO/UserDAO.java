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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
    private Session session = null;
     Message message = null;

    public UserDAO() {
        try {
            System.out.println("Connecting to DB using the following details:");
            javax.naming.Context ctx = new javax.naming.InitialContext();
            String host = (String) ctx.lookup("java:comp/env/db-host");
            System.out.println(host);
            String port = (String) ctx.lookup("java:comp/env/db-port");
            System.out.println(port);
            String database = (String) ctx.lookup("java:comp/env/db-database");
            System.out.println(database);
            String username = (String) ctx.lookup("java:comp/env/db-username");
            System.out.println(username);
            String password = (String) ctx.lookup("java:comp/env/db-password");
            System.out.println(password);
            connection("jdbc:mysql://" + host + ":" + port + "/" + database + "?useUnicode=true&characterEncoding=UTF-8", username, password);
        } catch (NamingException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        //connection("jdbc:mysql://127.0.0.1:3306/auction?useUnicode=true&characterEncoding=UTF-8", "root", "1234");
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
            String sql = "INSERT INTO user (fullname,username,password,phonenumber,email,address,role,status,salt) VALUES (?,?,?,?,?,?,?,?,?)";

            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFullname());
            pre.setString(2, user.getUsername());
            pre.setString(3, user.getPassword());
            pre.setString(4, user.getPhonenumber());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getAddress());
            pre.setString(7, user.getRole());
            pre.setString(8, user.getStatus());
            pre.setString(9, user.getSalt());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addUser(User user) {
        int n = 0;
        try {
            String sql = "INSERT INTO user (username,password,fullname,phonenumber,email,address,salt) VALUES (?,?,?,?,?,?,?)";

            pre = conn.prepareStatement(sql);

            pre.setString(1, user.getUsername());
            pre.setString(2, user.getPassword());
            pre.setString(3, user.getFullname());
            pre.setString(4, user.getPhonenumber());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getAddress());
            pre.setString(7, user.getSalt());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    

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

    public String loginAuthenticate(String username, String password, String salt) throws SQLException {
        String role = null;
        String sql = "select role from user where username = '" + username + "' and password = '" + password + "'";
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            while (rs.next()) {
                role = rs.getString("role");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return role;
    }
    public String getSalt(String username) throws SQLException {
        String salt = null;
        String sql = "SELECT salt FROM user WHERE username = '" + username + "'";
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            while (rs.next()) {
                salt = rs.getString("salt");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salt;
    }

    public void SentEmail(String email, String subject, String content, final String username, final String password) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username,
                                password);
                    }
                });
        try {

            message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject(subject);
            message.setText(content);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } 

    }

    public static void main(String[] args) throws SQLException {
        UserDAO dao = new UserDAO();
        //dao.SentEmail("tupvse02404@fpt.edu.vn","Auction","successfully","tupvse02404@fpt.edu.vn","vantu1992");
    }
}
