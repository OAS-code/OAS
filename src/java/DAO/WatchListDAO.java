/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Auction;
import Entity.WatchList;
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
import javax.mail.Message;
import javax.mail.Session;
import javax.naming.NamingException;
import org.joda.time.DateTime;

/**
 *
 * @author MrTu
 */
public class WatchListDAO {

    private Connection conn = null;
    private Statement state = null;
    private ResultSet rs = null;
    private PreparedStatement pre = null;
    private Session session = null;
    Message message = null;

    public WatchListDAO() throws SQLException {
        if (this.conn == null) {
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
                Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void connection(String ulr, String username, String password) throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = (Connection) DriverManager.getConnection(ulr, username, password);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int add(WatchList watchlist) {
        int n = 0;
        try {
            String sql = "INSERT INTO watchlist (user_id,auction_id) VALUES (?,?)";
            pre = conn.prepareStatement(sql);

            pre.setInt(1, watchlist.getUser_id());
            pre.setInt(2, watchlist.getAuction_id());

            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return n;
    }

    public int delete(int auctionid) {
        int n = 0;
        String sql = "DELETE FROM watchlist WHERE auction_id = " + auctionid;
        try {
            state = (Statement) conn.createStatement();
            n = state.executeUpdate(sql);
            state.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public boolean getAuctionId(int user_id,int auction_id) throws SQLException {
        boolean existed = false;
        String sql = "SELECT COUNT(*) AS count FROM watchlist WHERE user_id = ? AND auction_id = ?";
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setInt(1, user_id);
            pre.setInt(2, auction_id);
            rs = pre.executeQuery();
            rs.next();
            return rs.getInt("count")>0;
        } catch (SQLException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }       
    }

    public ArrayList<WatchList> list(int userid) {
        String sql = "SELECT * FROM watchlist WHERE user_id = ?";

        ArrayList<WatchList> arr = new ArrayList<WatchList>();
        try {
            state = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pre = conn.prepareStatement(sql);
            pre.setInt(1, userid);
            rs = pre.executeQuery();
            DateTime date;
            int user_id, auction_id;
            while (rs.next()) {
                user_id = rs.getInt("user_id");
                auction_id = rs.getInt("auction_id");
                long endDate = rs.getLong("date") * 1000;
                date = new DateTime(endDate);
                WatchList watchlist = new WatchList(user_id, auction_id, date);
                arr.add(watchlist);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

}
