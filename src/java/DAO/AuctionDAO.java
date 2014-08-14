/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Auction;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
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

    public ArrayList<Auction> list(String keyword, String sta, String cat) throws SQLException {
        String sql = "SELECT * FROM auction WHERE 1=1 ";
        String sqlstatus = "AND status = '"+ sta +"'";
        String sqlcategory = "AND category_id = '"+ cat +"'";
        String sqlkeyword = "AND title LIKE '%"+ keyword+ "%'";
        ArrayList<Auction> arr = new ArrayList<Auction>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            if(!sta.equals("")){
                sql = sql + sqlstatus;
            }
            if(!cat.equals("")){
                sql = sql + sqlcategory;
            }
            if(!keyword.equals("")){
                sql = sql + sqlkeyword;
            }
            sql = sql + " ORDER BY title DESC";           
            
            rs = state.executeQuery(sql);
            int auctionid, category_id, seller_id, status;
            String title, description, video,image1,image2,image3,image4,image5;
            Date start_date, end_date;
            Time start_time,end_time;
            double starting_price, buy_now_price;
            while (rs.next()) {
                auctionid = rs.getInt("auctionid");
                category_id = rs.getInt("category_id");
                seller_id = rs.getInt("seller_id");
                title = rs.getString("title");
                description = rs.getString("description");
                start_date = rs.getDate("start_date");
                start_time = rs.getTime("start_time");
                end_date = rs.getDate("end_date");
                end_time = rs.getTime("end_time");
                starting_price = rs.getDouble("starting_price");
                buy_now_price = rs.getDouble("buy_now_price");
                status = rs.getInt("status");
                video = rs.getString("video");
                image1 = rs.getString("image1");
                image2 = rs.getString("image2");
                image3 = rs.getString("image3");
                image4 = rs.getString("image4");
                image5 = rs.getString("image5");
                Auction auction = new Auction(auctionid, category_id, seller_id, title, description, start_date, start_time, end_date, end_time, starting_price, buy_now_price, status,video,image1,image2,image3,image4,image5);
                arr.add(auction);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    public ArrayList<Auction> list() throws SQLException{
        return list("", "", "");
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
                    //Auction auction = new Auction(auctionid, categoryid, sellerid, title, description, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
                    //arr.add(auction);
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
                    //Auction auction = new Auction(auctionid, categoryid, sellerid, title, description, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
                    //arr.add(auction);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public int add(Auction auction) {
        int n = 0;
        try {
            String sql = "INSERT INTO auction (category_id,seller_id,title,description,start_date,start_time, end_date,end_time, starting_price, buy_now_price,status,video,image1,image2,image3,image4,image5) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pre = conn.prepareStatement(sql);
            pre.setInt(1, auction.getCategoryid());
            pre.setInt(2, auction.getSellerid());
            pre.setString(3, auction.getTitle());
            pre.setString(4, auction.getDescription());  
            pre.setDate(5, new java.sql.Date(auction.getStart_date().getTime()));
            pre.setTime(6, new java.sql.Time(auction.getStart_time().getTime()));
            pre.setDate(7, new java.sql.Date(auction.getEnd_date().getTime()));
            pre.setTime(8, new java.sql.Time(auction.getEnd_time().getTime()));            
            pre.setDouble(9, auction.getStarting_price());
            pre.setDouble(10, auction.getBuy_now_price());
            pre.setInt(11, auction.getStatusId());
            pre.setString(12, auction.getVideo());
            pre.setString(13, auction.getImage1());
            pre.setString(14, auction.getImage2());
            pre.setString(15, auction.getImage3());
            pre.setString(16, auction.getImage4());
            pre.setString(17, auction.getImage5());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
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
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int update(Auction auction) {
        int n = 0;
        String sql = "UPDATE auction SET category_id = ?, seller_id = ?, title = ?,description = ?,"
                + " start_date = ?, start_time = ?, end_date = ?, end_time = ?"
                + ", starting_price = ?, buy_now_price = ?,status = ?,video = ?, image1 = ?, "
                + "image2 = ?, image3 = ?, image4 = ?, image5 = ? WHERE auctionid = ?";
        try {
            pre = conn.prepareStatement(sql);
             pre = conn.prepareStatement(sql);
            pre.setInt(1, auction.getCategoryid());
            pre.setInt(2, auction.getSellerid());
            pre.setString(3, auction.getTitle());
            pre.setString(4, auction.getDescription());  
            pre.setDate(5, new java.sql.Date(auction.getStart_date().getTime()));
            pre.setTime(6, new java.sql.Time(auction.getStart_time().getTime()));
            pre.setDate(7, new java.sql.Date(auction.getEnd_date().getTime()));
            pre.setTime(8, new java.sql.Time(auction.getEnd_time().getTime()));            
            pre.setDouble(9, auction.getStarting_price());
            pre.setDouble(10, auction.getBuy_now_price());
            pre.setInt(11, auction.getStatusId());
            pre.setString(12, auction.getVideo());
            pre.setString(13, auction.getImage1());
            pre.setString(14, auction.getImage2());
            pre.setString(15, auction.getImage3());
            pre.setString(16, auction.getImage4());
            pre.setString(17, auction.getImage5());
            pre.setInt(18, auction.getAuctionid());
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

    public static void main(String[] args) {
        AuctionDAO dao = new AuctionDAO();
    }

}
