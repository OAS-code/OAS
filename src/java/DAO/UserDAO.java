/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.User;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.security.NoSuchAlgorithmException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
            //System.out.println("Connecting to DB using the following details:");
            javax.naming.Context ctx = new javax.naming.InitialContext();
            String host = (String) ctx.lookup("java:comp/env/db-host");
            //System.out.println(host);
            String port = (String) ctx.lookup("java:comp/env/db-port");
            //System.out.println(port);
            String database = (String) ctx.lookup("java:comp/env/db-database");
            //System.out.println(database);
            String username = (String) ctx.lookup("java:comp/env/db-username");
            //System.out.println(username);
            String password = (String) ctx.lookup("java:comp/env/db-password");
            //System.out.println(password);
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

    public int addUser(User user) {
        int n = 0;
        try {
            String sql = "INSERT INTO user (username, password, fullname, phonenumber, email, address, salt, role, status) VALUES (?,?,?,?,?,?,?,?,?)";
            pre = conn.prepareStatement(sql);

            pre.setString(1, user.getUsername());
            pre.setString(2, user.getPassword());
            pre.setString(3, user.getFullname());
            pre.setString(4, user.getPhonenumber());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getAddress());
            pre.setString(7, user.getSalt());
            pre.setInt(8, user.getRoleId());
            pre.setInt(9, user.getStatusId());

            //System.out.println(user.getUsername()+user.getPassword());
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return n;

    }

    public ArrayList<User> list(String keyword, String rol, String stt) {
        String sql = "SELECT * FROM user WHERE 1=1 ";
        String sqlRole = " AND role = '" + rol + "' ";
        String sqlStatus = " AND status = '" + stt + "' ";
        String sqlKeyword = " AND MATCH(fullname, username) AGAINST ('" + keyword + "')";

        ArrayList<User> arr = new ArrayList<>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            if (!rol.equals("")) {
                sql = sql + sqlRole;
            }
            if (!stt.equals("")) {
                sql = sql + sqlStatus;
            }
            if (!keyword.equals("")) {
                sql = sql + sqlKeyword;
            }
            sql = sql + " ORDER BY role DESC";

            //System.out.println(sql);
            rs = state.executeQuery(sql);
            String fullname, username;
            int id, role, status;
            while (rs.next()) {
                id = rs.getInt("id");
                fullname = rs.getString("fullname");
                username = rs.getString("username");
                status = rs.getInt("status");
                role = rs.getInt("role");
                User user = new User(id, fullname, username, status, role);
                arr.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public ArrayList<User> list() {
        return list("", "", "");
    }

    public User getUser(int userId) {
        String sql = "SELECT * FROM user WHERE id = ? LIMIT 1";
        User user = new User();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setInt(1, userId);
            rs = pre.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                user = new User(username, email, status, role);
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhonenumber(rs.getString("phonenumber"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setSalt(rs.getString("salt"));
                user.setJoinDate(rs.getString("join_date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            //System.out.println(sql);
        }
        return user;
    }

    public User getUser(String username) {
        String sql = "SELECT * FROM user WHERE username = ? LIMIT 1";
        User user = new User();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            rs = pre.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                user = new User(username, email, status, role);
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhonenumber(rs.getString("phonenumber"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setSalt(rs.getString("salt"));
                user.setJoinDate(rs.getString("join_date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            //System.out.println(sql);
        }
        //System.out.println(sql);
        return user;
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
            pre.setInt(6, user.getRoleId());
            pre.setInt(7, user.getStatusId());
            pre.setInt(8, user.getId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int update_profile(User user) {
        int n = 0;
        String sql = "UPDATE user SET fullname = ?, phonenumber = ?, address = ? WHERE id = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFullname());
            pre.setString(2, user.getPhonenumber());
            pre.setString(3, user.getAddress());
            pre.setInt(4, user.getId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public String[] logUserIn(String username, String password) throws SQLException, NoSuchAlgorithmException {
        String[] result = new String[5];
        User user = getUser(username);
        System.out.println(user.getUsername());
        if ((user.getUsername() == null) || (!user.getUsername().equalsIgnoreCase(username))) {
            result[0] = "fail";
            result[1] = "1"; //error code
            return result;
        } else if (user.getStatusId() == 0) {
            result[0] = "fail";
            result[1] = "5";
            return result;
        }
        String dbPassword = user.getPassword();
        String dbSalt = user.getSalt();

        OtherDAO other = new OtherDAO();
        String step1 = other.getMd5FromString(password);
        String step2 = step1 + dbSalt;
        String encryptedPassword = other.getMd5FromString(step2);

        if (!encryptedPassword.equalsIgnoreCase(dbPassword)) {
            result[0] = "fail";
            result[1] = "6";
            return result;
        }

        result[0] = "ok"; //success/fail
        result[1] = "1"; //error code
        result[2] = user.getUsername();
        result[3] = Integer.toString(user.getId()); //
        result[4] = Integer.toString(user.getRoleId());

        return result;
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

    public int getIdFromUsername(String username) throws SQLException {
        int id = 0;
        String sql = "SELECT id FROM user WHERE username = '" + username + "'";
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int change_password(String oldpass, String newpass, int userid) throws SQLException {
        int n = 0;
        String sql = "UPDATE user SET password = ? WHERE id = ? AND password = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, newpass);
            pre.setInt(2, userid);
            pre.setString(3, oldpass);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
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

    public boolean isUserExisted(String username, String email) throws SQLException {
        String sql = "";
        if (username.isEmpty() && email.isEmpty()) {
            return false;
        } else {
            if (!username.isEmpty() && !email.isEmpty()) {
                sql = "SELECT * FROM user WHERE username = ? OR email = ? LIMIT 1";
                state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                pre = conn.prepareStatement(sql);
                pre.setString(1, username);
                pre.setString(2, email);
                if (pre.executeQuery() == null) {
                    return false;
                }
                else {
                    return true;
                }
            } else if (username.isEmpty() && !email.isEmpty()) {
                sql = "SELECT * FROM user WHERE email = ? LIMIT 1";
                state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                pre = conn.prepareStatement(sql);
                pre.setString(1, email);
                if (pre.executeQuery() == null) {
                    return false;
                }
                else {
                    return true;
                }
            } else if (!username.isEmpty() && email.isEmpty()) {
                sql = "SELECT * FROM user WHERE username = ? LIMIT 1";
                state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                pre = conn.prepareStatement(sql);
                pre.setString(1, username);
                if (pre.executeQuery() == null) {
                    return false;
                }
                else {
                    return true;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) throws SQLException {
        UserDAO dao = new UserDAO();
        //dao.SentEmail("tupvse02404@fpt.edu.vn","Auction","successfully","tupvse02404@fpt.edu.vn","vantu1992");
    }

}
