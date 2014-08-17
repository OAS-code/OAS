/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Auction;
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
import org.joda.time.DateTime;

/**
 *
 * @author Duc
 */
public class AuctionDAO {

    private Connection conn = null;
    private Statement state = null;
    private ResultSet rs = null;
    private PreparedStatement pre = null;

    public AuctionDAO() {
        try {
            //System.out.println("Connecting to DB using the following details:");
            javax.naming.Context ctx = new javax.naming.InitialContext();
            String host = (String) ctx.lookup("java:comp/env/db-host"); //System.out.println(host);
            String port = (String) ctx.lookup("java:comp/env/db-port"); //System.out.println(port);
            String database = (String) ctx.lookup("java:comp/env/db-database"); //System.out.println(database);
            String username = (String) ctx.lookup("java:comp/env/db-username"); //System.out.println(username);
            String password = (String) ctx.lookup("java:comp/env/db-password"); //System.out.println(password);
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
            //System.out.println("connected");
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

    public ArrayList<Auction> list(String keyword, int status, int categoryId) {
        String sql = "SELECT auctionid, category_id, c.name AS category_name, seller_id, username AS seller_name, title, a.description, UNIX_TIMESTAMP(start_date) AS start_date, UNIX_TIMESTAMP(end_date) AS end_date, starting_price, buy_now_price, increase_by, a.moderate_status, v_youtube, img_cover, img_1, img_2, img_3, img_4, img_5 FROM auction a INNER JOIN user u ON a.seller_id = u.id INNER JOIN category c ON a.category_id = c.categoryid WHERE a.title LIKE '%"+keyword+"%' ";
        String sql2 = " AND a.category_id = "+categoryId;
        ArrayList<Auction> arr = new ArrayList<Auction>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
            if (categoryId != -1) {
                sql = sql + sql2;
            } else if (status == -1 && keyword.equals("")){
                sql = sql + " OR 1=1 ";
            }
            sql = sql + " ORDER BY a.title DESC";
          
            pre = conn.prepareStatement(sql);
            //System.out.println(sql);
            //pre.setString(1, "%"+keyword+"%");
            
            
            rs = pre.executeQuery(sql);
            while (rs.next()) {
                Auction auction = new Auction();
                auction.setId(rs.getInt("auctionid"));
                auction.setCategoryId(rs.getInt("category_id"));
                auction.setCategoryName(rs.getString("category_name"));
                auction.setSellerId(rs.getInt("seller_id"));
                auction.setSellerName(rs.getString("seller_name"));
                auction.setTitle(rs.getString("title"));
                auction.setDescription(rs.getString("description"));
                long startDateLong = rs.getLong("start_date")*1000;
                long endDateLong = rs.getLong("end_date")*1000;
                DateTime startDate = new DateTime(startDateLong);
                DateTime endDate = new DateTime(endDateLong);
                auction.setStartDate(startDate);
                auction.setEndDate(endDate);
                auction.setStartPrice(rs.getDouble("starting_price"));
                auction.setBuynowPrice(rs.getDouble("buy_now_price"));
                auction.setIncreaseBy(rs.getDouble("increase_by"));
                auction.setModerateStatus(rs.getInt("moderate_status"));
                auction.setvYoutube(rs.getString("v_youtube"));
                auction.setImgCover(rs.getString("img_cover"));
                auction.setImg1(rs.getString("img_1"));
                auction.setImg1(rs.getString("img_2"));
                auction.setImg1(rs.getString("img_3"));
                auction.setImg1(rs.getString("img_4"));
                auction.setImg1(rs.getString("img_5"));
                if (status == -1 || auction.getStatusId() == status){
                    arr.add(auction);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Auction DAO list failed.");
        }
        return arr;
    }

    public ArrayList<Auction> list() {
        return list("", -1, -1);
    }

    public static void main(String[] args) {
        AuctionDAO dao = new AuctionDAO();
    }

    public boolean add(Auction auction) {
        try {
            String sql = "INSERT INTO auction (category_id, seller_id, title, description, starting_price, buy_now_price, increase_by, img_cover, img_1, img_2, img_3, img_4, img_5, v_youtube, start_date, end_date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,FROM_UNIXTIME(?),FROM_UNIXTIME(?)) ";
            pre = conn.prepareStatement(sql);
            System.out.println(auction.getCategoryId());
            pre.setInt(1, auction.getCategoryId());
            pre.setInt(2, auction.getSellerId());
            pre.setString(3, auction.getTitle());
            pre.setString(4, auction.getDescription());
            pre.setDouble(5, auction.getStartPrice());
            pre.setDouble(6, auction.getBuynowPrice());
            pre.setDouble(7, auction.getIncreaseBy());
            pre.setString(8, auction.getImgCover());
            pre.setString(9, auction.getImg1());
            pre.setString(10, auction.getImg2());
            pre.setString(11, auction.getImg3());
            pre.setString(12, auction.getImg4());
            pre.setString(13, auction.getImg5());
            pre.setString(14, auction.getvYoutube());
            DateTime startDate = auction.getStartDate();
            pre.setLong(15, startDate.getMillis()/1000);
            DateTime endDate = auction.getEndDate();
            pre.setLong(16, endDate.getMillis()/1000);
            pre.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AuctionDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Auction DAO, add failed.");
            return false;
        }
        
    }

}
