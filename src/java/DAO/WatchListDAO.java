/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Entity.WatchList;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.naming.NamingException;

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
            String sql = "INSERT INTO watchlist (user_id,auction_id,date) VALUES (?,?,?)";            
            pre = conn.prepareStatement(sql);
            
            pre.setInt(1, watchlist.getUser_id());
            pre.setInt(2, watchlist.getAuction_id());
            pre.setString(3, watchlist.getDate());
            
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(WatchListDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return n;
    }
}
