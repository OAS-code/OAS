/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Auction;
import Entity.Digital;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.Date;
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
         connection("jdbc:mysql://" + host + ":" + port + "/" + database +"?useUnicode=true&characterEncoding=UTF-8",username,password);       
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
        String sql = "select * from auction";
        ArrayList<Auction> arr = new ArrayList<Auction>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = state.executeQuery(sql);
            int auctionid, category_id, seller_id;
            String title, description, status;
            Date start_date, end_date;
            double starting_price, reserve_price, buy_now_price;
            while (rs.next()) {
                auctionid = rs.getInt("auctionid");
                category_id = rs.getInt("category_id");
                seller_id = rs.getInt("seller_id");
                title = rs.getString("title");
                description = rs.getString("description");
                start_date = rs.getDate("start_date");
                end_date = rs.getDate("end_date");
                starting_price = rs.getDouble("starting_price");
                reserve_price = rs.getDouble("reserve_price");
                buy_now_price = rs.getDouble("buy_now_price");
                status = rs.getString("status");
                Auction auction = new Auction(auctionid, category_id, seller_id, title, description, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
                arr.add(auction);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    

    public int lastID() {
        int n = 0;
        try {
            state = (Statement) conn.createStatement();
            rs = state.executeQuery("SELECT LAST_INSERT_ID()");
            if (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return n;
    }

    public ArrayList<Auction> searchAuction(String search, String stt) {
        String sql = "SELECT * FROM auction WHERE MATCH(title) AGAINST ('" + search + "') AND status LIKE '" + stt + "%'";
        String sql1 = "SELECT * FROM auction WHERE status LIKE '" + stt + "%'";
        ArrayList<Auction> arr = new ArrayList<>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            if (search.equals("")) {
                rs = state.executeQuery(sql1);
                String title, description, status;
                int auctionid, categoryid, sellerid;
                double starting_price, reserve_price, buy_now_price;
                Date start_date, end_date;
                while (rs.next()) {
                    auctionid = rs.getInt("auctionid");
                    categoryid = rs.getInt("category_id");
                    sellerid = rs.getInt("seller_id");
                    title = rs.getString("title");
                    description = rs.getString("description");
                    start_date = rs.getDate("start_date");
                    end_date = rs.getDate("end_date");
                    starting_price = rs.getDouble("starting_price");
                    reserve_price = rs.getDouble("reserve_price");
                    buy_now_price = rs.getDouble("buy_now_price");
                    status = rs.getString("status");
                    Auction auction = new Auction(auctionid, categoryid, sellerid, title, description, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
                    arr.add(auction);
                }
            } else {
                rs = state.executeQuery(sql);
                String title, description, status;
                int auctionid, categoryid, sellerid;
                double starting_price, reserve_price, buy_now_price;
                Date start_date, end_date;
                while (rs.next()) {
                    auctionid = rs.getInt("auctionid");
                    categoryid = rs.getInt("category_id");
                    sellerid = rs.getInt("seller_id");
                    title = rs.getString("title");
                    description = rs.getString("description");
                    start_date = rs.getDate("start_date");
                    end_date = rs.getDate("end_date");
                    starting_price = rs.getDouble("starting_price");
                    reserve_price = rs.getDouble("reserve_price");
                    buy_now_price = rs.getDouble("buy_now_price");
                    status = rs.getString("status");
                    Auction auction = new Auction(auctionid, categoryid, sellerid, title, description, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
                    arr.add(auction);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public int addDigital(Digital digital) {
        int n;
        try {
            String sql = "INSERT INTO digital (auction_id,image1,image2,image3,image4,image5,video) VALUES (?,?,?,?,?,?,?)";
            pre = conn.prepareStatement(sql);
            pre.setInt(1, digital.getId());
            pre.setString(2, digital.getImage1());
            pre.setString(3, digital.getImage2());
            pre.setString(4, digital.getImage3());
            pre.setString(5, digital.getImage4());
            pre.setString(6, digital.getImage5());
            pre.setString(7, digital.getVideo());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return n;
    }

    public int add(Auction auction) {
        int n;
        try {
            String sql = "INSERT INTO auction (category_id,seller_id,title,description,"
                    + "start_date,end_date,starting_price,"
                    + "reserve_price,buy_now_price,status) VALUES (?,?,?,?,?,?,?,?,?,?)";
            pre = conn.prepareStatement(sql);
            pre.setInt(1, auction.getCategoryid());
            pre.setInt(2, auction.getSellerid());
            pre.setString(3, auction.getTitle());
            pre.setString(4, auction.getDescription());
            pre.setDate(5, new java.sql.Date(auction.getStart_date().getTime()));
            pre.setDate(6, new java.sql.Date(auction.getEnd_date().getTime()));
            pre.setDouble(7, auction.getStarting_price());
            pre.setDouble(8, auction.getReserve_price());
            pre.setDouble(9, auction.getBuy_now_price());
            pre.setString(10, auction.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return n;
    }
     public int delete_auction(int id) {
        int n = 0;
        String sql = "DELETE FROM auction WHERE auctionid = " + id;
        String sql1 = "DELETE FROM digital WHERE auction_id = " + id;
        try {
            state = (Statement) conn.createStatement();
            state.executeUpdate(sql1);
            n = state.executeUpdate(sql);
            state.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int delete(int auctionid){
        int n = 0;
        String sql = "DELETE FROM digital WHERE auction_id = " + auctionid;
        try{
            state = (Statement) conn.createStatement();
            n = state.executeUpdate(sql);
            state.close();
            conn.close();
        }catch(SQLException ex){
             Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int update(Auction auction) {
        int n = 0;
        String sql = "UPDATE auction SET category_id = ?, seller_id = ?, title = ?,description = ?, start_date = ?, end_date = ?"
                + ", starting_price = ?, reserve_price = ?, buy_now_price = ?,status = ? WHERE auctionid = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, auction.getCategoryid());
            pre.setInt(2, auction.getSellerid());
            pre.setString(3, auction.getTitle());
            pre.setString(4, auction.getDescription());
            pre.setDate(5, new java.sql.Date(auction.getStart_date().getTime()));
            pre.setDate(6, new java.sql.Date(auction.getEnd_date().getTime()));
            pre.setDouble(7, auction.getStarting_price());
            pre.setDouble(8, auction.getReserve_price());
            pre.setDouble(9, auction.getBuy_now_price());
            pre.setString(10, auction.getStatus());
            pre.setInt(11, auction.getAuctionid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int updateDigital(Digital digital) {
        int n = 0;
        String sql = "UPDATE digital SET image1 = ?, image2 = ?,image3 = ?, image4 = ?, image5 = ?, video = ? WHERE auction_id = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, digital.getImage1());
            pre.setString(2, digital.getImage2());
            pre.setString(3, digital.getImage3());
            pre.setString(4, digital.getImage4());
            pre.setString(5, digital.getImage5());
            pre.setString(6, digital.getVideo());
            pre.setInt(7, digital.getId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public ResultSet searchDigital(int id) {
        String sql = "SELECT * FROM digital WHERE auction_id = ?";
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

    public static void main(String[] args) {
        AuctionDAO dao = new AuctionDAO();
        int n = dao.lastID();
        System.out.println(n);
    }

}
