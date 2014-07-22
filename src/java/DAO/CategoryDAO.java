/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Entity.Category;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author MrTu
 */
public class CategoryDAO {
    private Connection conn = null;
    private Statement state = null;
    private ResultSet rs = null;
    private PreparedStatement pre = null;

    public CategoryDAO() {
        /*try {
         System.out.println("Connecting to DB using the following details:");
         javax.naming.Context ctx = new javax.naming.InitialContext();
         String host = (String) ctx.lookup("java:comp/env/db-host"); System.out.println(host);
         String port = (String) ctx.lookup("java:comp/env/db-port"); System.out.println(port);
         String database = (String) ctx.lookup("java:comp/env/db-database"); System.out.println(database);
         String username = (String) ctx.lookup("java:comp/env/db-username"); System.out.println(username);
         String password = (String) ctx.lookup("java:comp/env/db-password"); System.out.println(password);
         connection("jdbc:mysql://" + host + ":" + port + "/" + database,username,password);       
         } catch (NamingException ex) {
          Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
         }*/
        connection("jdbc:mysql://127.0.0.1:3306/auction?useUnicode=true&characterEncoding=UTF-8", "root", "1234");
    }

    private void connection(String ulr, String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = (Connection) DriverManager.getConnection(ulr, username, password);
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ResultSet searchCategory(int id) {
        String sql = "SELECT * FROM category WHERE categoryid = ?";
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return rs;
    }
    public ArrayList<Category> select() throws SQLException {
        String sql = "SELECT * FROM category";
        ArrayList<Category> arr = new ArrayList<Category>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            int categoryid;
            String name;
            while (rs.next()) {
                categoryid = rs.getInt("categoryid");
                name = rs.getString("name");
                Category category = new Category(categoryid, name);
                arr.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
    }
}
