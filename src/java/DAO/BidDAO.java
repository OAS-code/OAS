/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Auction;
import Entity.Bid;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.naming.NamingException;
import org.joda.time.DateTime;

/**
 *
 * @author Duc
 */
public class BidDAO {

    private Connection conn = null;
    private Statement state = null;
    private ResultSet rs = null;
    private PreparedStatement pre = null;
    private Session session = null;
    Message message = null;

    public BidDAO() {
        if (this.conn == null) {
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
        }
    }

    private void connection(String string, String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = (Connection) DriverManager.getConnection(string, username, password);
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

    public static void main(String[] args) {
        BidDAO dao = new BidDAO();
    }

    public ArrayList<Bid> getBidFromAuctionId(int auctionId, int top) {
        ArrayList<Bid> bids = new ArrayList<Bid>();
        try {

            String sql = "SELECT bid_id, bidder_id, u.username AS bidder_name, auction_id, a.title AS auction_name, amount, UNIX_TIMESTAMP(date) AS date "
                    + " FROM bid b "
                    + "INNER JOIN user u ON b.bidder_id = u.id "
                    + "INNER JOIN auction a ON b.auction_id = a.auctionid "
                    + "WHERE a.auctionid = ? ORDER BY b.amount DESC LIMIT ?";

            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setInt(1, auctionId);
            pre.setInt(2, top);
            rs = pre.executeQuery();
            while (rs.next()) {
                Bid bid = new Bid();
                bid.setBidId(rs.getInt("bid_id"));
                bid.setBidderId(rs.getInt("bidder_id"));
                bid.setBidderName(rs.getString("bidder_name"));
                bid.setAuctionId(rs.getInt("auction_id"));
                bid.setAuctionName(rs.getString("auction_name"));
                bid.setAmount(rs.getDouble("amount"));
                long dateLong = rs.getLong("date") * 1000;
                DateTime date = new DateTime(dateLong);
                bid.setDate(date);
                bids.add(bid);
            }

            return bids;
        } catch (SQLException ex) {
            Logger.getLogger(BidDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Bid DAO getBidFromAuctionId failed.");
        }
        return bids;
    }

    public String getTopBidderNameFromAuctionId(int auctionId) {
        ArrayList<Bid> bids = getBidFromAuctionId(auctionId, 1);
        if (bids.size() > 0) {
            UserDAO userDao = new UserDAO();
            return userDao.getUser(bids.get(0).getBidderId()).getUsername();
        } else {
            return "No Bids Yet";
        }
    }

    public Double getCurrentBidFromAuctionId(int auctionId) {
        ArrayList<Bid> bids = getBidFromAuctionId(auctionId, 1);
        if (bids.size() > 0) {
            return bids.get(0).getAmount();
        } else {
            AuctionDAO auctionDAO = new AuctionDAO();
            Auction auction = auctionDAO.getAuction(auctionId);
            return auction.getStartPrice();
        }
    }

    public String getCurrentBidFromAuctionIdString(int auctionId) {
        FormatMoney fm = new FormatMoney();
        return fm.showPriceInUSD(this.getCurrentBidFromAuctionId(auctionId), 1);
    }

    public int getTotalBidsOnAuctionId(int auctionId) {
        try {
            String sql = "SELECT COUNT(*) AS totalBids FROM bid WHERE auction_id = ?";
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setInt(1, auctionId);
            rs = pre.executeQuery();
            rs.next();
            return rs.getInt("totalBids");

        } catch (SQLException ex) {
            Logger.getLogger(BidDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public boolean placeBid(Bid bid) {
        try {
            String sql = "";
            PreparedStatement pre = null;
            AuctionDAO auctionDao = new AuctionDAO();
            Auction auction = auctionDao.getAuction(bid.getAuctionId());
            if (bid.getAmount() >= auction.getBuynowPrice()) {
                bid.setAmount(auction.getBuynowPrice());
                sql = "UPDATE auction SET moderate_status=3 WHERE auctionid = ? ";
                pre = conn.prepareStatement(sql);
                pre.setInt(1, bid.getAuctionId());
                pre.executeUpdate();
            }

            sql = "UPDATE user SET balance=balance-? WHERE id = ? ";
            pre = conn.prepareStatement(sql);
            pre.setDouble(1, bid.getAmount());
            pre.setInt(2, bid.getBidderId());
            pre.executeUpdate();

            sql = "INSERT INTO bid (bidder_id, auction_id, amount) VALUES (?, ?, ?) ";
            pre = conn.prepareStatement(sql);
            pre.setInt(1, bid.getBidderId());
            pre.setInt(2, bid.getAuctionId());
            pre.setDouble(3, bid.getAmount());
            pre.executeUpdate();

            sql = "SELECT * FROM bid WHERE auction_id = ? ORDER BY amount DESC";
            pre = conn.prepareStatement(sql);
            pre.setInt(1, bid.getAuctionId());
            ResultSet rs = pre.executeQuery();
            rs.next();
            while (rs.next()) {
                sql = "UPDATE user SET balance = balance + ? WHERE id = ?";
                pre = conn.prepareStatement(sql);
                pre.setDouble(1, rs.getDouble("amount"));
                pre.setInt(2, rs.getInt("bidder_id"));
                pre.executeUpdate();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BidDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Bid DAO, placeBid failed.");
            return false;
        }
    }

}
