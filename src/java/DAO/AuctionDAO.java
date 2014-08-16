/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Auction;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
//import java.sql.Date;
import java.util.Date;
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

    public ArrayList<Auction> list(String keyword, int type, int categoryId) {
        String sql = "SELECT auctionid, category_id, c.name AS category_name, seller_id, username AS seller_name, title, a.description, start_date, end_date, starting_price, buy_now_price, increase_by, a.moderate_status, v_youtube, img_cover, img_1, img_2, img_3, img_4, img_5 FROM auction a INNER JOIN user u ON a.seller_id = u.id INNER JOIN category c ON a.category_id = c.categoryid WHERE 1=1  ";
        //String sqlstatus = " AND a.status = ?";
        String sqlcategory = " AND a.category_id = ?";
        String sqlkeyword = " AND a.title LIKE '%?%'";
        ArrayList<Auction> arr = new ArrayList<Auction>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            if (categoryId != -1) {
                sql = sql + sqlcategory;
            }
            if (!keyword.equals("")) {
                sql = sql + sqlkeyword;
            }
            sql = sql + " ORDER BY a.title DESC";
          
            pre = conn.prepareStatement(sql);

            int index = 0;
           
            if (categoryId != -1) {
                index++;
                pre.setInt(index, categoryId);
            }
            if (!keyword.equals("")) {
                index++;
                pre.setString(index, keyword);
            }

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
                auction.setStartDate(rs.getDate("start_date"));
                auction.setEndDate(rs.getDate("end_date"));
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
                if (type == -1 || auction.getStatus() == type){
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
    /*
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
     */

    public static void main(String[] args) {
        AuctionDAO dao = new AuctionDAO();
    }

}
