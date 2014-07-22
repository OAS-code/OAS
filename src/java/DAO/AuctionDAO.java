/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Entity.Auction;
import Entity.Category;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.Date;
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
public class AuctionDAO {
    private Connection conn = null;
    private Statement state = null;
    private ResultSet rs = null;
    private PreparedStatement pre = null;
    public AuctionDAO() {
        try {
            System.out.println("Connecting to DB using the following details:");
            javax.naming.Context ctx = new javax.naming.InitialContext();
            String host = (String) ctx.lookup("java:comp/env/db-host"); System.out.println(host);
            String port = (String) ctx.lookup("java:comp/env/db-port"); System.out.println(port);
            String database = (String) ctx.lookup("java:comp/env/db-database"); System.out.println(database);
            String username = (String) ctx.lookup("java:comp/env/db-username"); System.out.println(username);
            String password = (String) ctx.lookup("java:comp/env/db-password"); System.out.println(password);
            connection("jdbc:mysql://" + host + ":" + port + "/" + database,username,password);
            //connection("jdbc:mysql://127.0.0.1:3306/auction", "root", "1234");
        } catch (NamingException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void connection(String ulr, String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = (Connection) DriverManager.getConnection(ulr, username, password);
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Auction> view() throws SQLException {
        String sql = "SELECT * FROM auction";
        ArrayList<Auction> arr = new ArrayList<Auction>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            int auctionid, category_id, seller_id;
            String title, description, image, status;
            Date start_date, end_date;
            double starting_price, reserve_price, buy_now_price;
            while (rs.next()) {
                auctionid = rs.getInt("auctionid");
                category_id =rs.getInt("category_id");
                seller_id = rs.getInt("seller_id");
                title = rs.getString("title");
                description = rs.getString("description");
                image = rs.getString("image");
                start_date = rs.getDate("start_date");
                end_date = rs.getDate("end_date");
                starting_price = rs.getDouble("starting_price");
                reserve_price = rs.getDouble("reserve_price");
                buy_now_price = rs.getDouble("buy_now_price");
                status = rs.getString("status");
                Auction auction = new Auction(auctionid, category_id, seller_id, title, description, image, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
                arr.add(auction);
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
    public ArrayList<Category> select() throws SQLException {
        String sql = "SELECT * FROM category";
        ArrayList<Category> arr = new ArrayList<Category>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            int categoryid;
            String name;
            while (rs.next()) {
                categoryid =rs.getInt("categoryid");
                name = rs.getString("name");
                Category category = new Category(categoryid, name);
                arr.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            state.close();
            conn.close();
        }
        return arr;
    }
    public int add(Auction auction) {
        int n = 0;
        try {
            String sql = "INSERT INTO auction (category_id,seller_id,title,description,"
                        + "image,start_date,end_date,starting_price,"
                        + "reserve_price,buy_now_price,status) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            pre = conn.prepareStatement(sql);
            pre.setInt(1,auction.getCategoryid());
            pre.setInt(2,auction.getSellerid());
            pre.setString(3,auction.getTitle());
            pre.setString(4,auction.getDescription());
            pre.setString(5,auction.getImage());
            pre.setDate(6,  new java.sql.Date(auction.getStart_date().getTime()));
            pre.setDate(7,  new java.sql.Date(auction.getEnd_date().getTime()));
            pre.setDouble(8,auction.getStarting_price());
            pre.setDouble(9,auction.getReserve_price());
            pre.setDouble(10,auction.getBuy_now_price());
            pre.setString(11,auction.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return n;
    }
    public ResultSet search(int id) {
        String sql = "SELECT * FROM auction WHERE auctionid = ?";
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
    public int delete(int id) {
        int n = 0;
        String sql = "DELETE FROM auction WHERE auctionid = " + id;
        try {
            state = (Statement) conn.createStatement();
            n = state.executeUpdate(sql);
            state.close();
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }finally{
            try {
                state.close();
                conn.close();               
            } catch (SQLException ex) {
                Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return n;
    }

}
