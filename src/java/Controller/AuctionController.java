/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AuctionDAO;
import DAO.CategoryDAO;
import Entity.Auction;
import Entity.Category;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MrTu
 */
public class AuctionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        AuctionDAO dao = new AuctionDAO();
        CategoryDAO cdao = new CategoryDAO();
        String service = request.getParameter("service");
        final String auction_manager = "cp_auction_manager.jsp?current_page=auction_manager";
        final String bidding_detail = "cp_bidding_detail.jsp";
        final String add_auction = "cp_auction_add.jsp";
        final String view_detail_auction = "cp_view_detail_auction.jsp";
        final String edit_auction = "cp_edit_auction.jsp";
        final String add_new_auction = "cp_auction_add.jsp";

        ResultSet rs, rss, rst;
        RequestDispatcher rd;

        if (service.equalsIgnoreCase("auction_manager")) {
            ArrayList<Category> array = (ArrayList<Category>) cdao.view();
            request.setAttribute("array", array);
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("bidnow")) {
            rd = request.getRequestDispatcher(bidding_detail);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("listall")) {
            ArrayList<Category> array = (ArrayList<Category>) cdao.view();
            request.setAttribute("array", array);
            ArrayList<Auction> arr = dao.list();
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("index")) {
            ArrayList<Auction> arr = dao.list();
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        /*
        if (service.equalsIgnoreCase("deleteAuction")) {
            String id = request.getParameter("auctionid");
            int auctionid = Integer.parseInt(id);
            int n = dao.delete(auctionid);
            if (n > 0) {
                ArrayList<Category> array = (ArrayList<Category>) cdao.view();
                request.setAttribute("array", array);
                rd = request.getRequestDispatcher(auction_manager);
                rd.forward(request, response);
            }
        }*/
        if (service.equalsIgnoreCase("add_auction")) {
            ArrayList<Category> array = (ArrayList<Category>) cdao.view();
            request.setAttribute("array", array);
            rd = request.getRequestDispatcher(add_auction);
            rd.forward(request, response);
        }/*
        if (service.equals("viewdetailauction")) {
            String auctionid = request.getParameter("auctionid");
            String categoryid = request.getParameter("categoryid");
            rs = dao.search(Integer.parseInt(auctionid));
            rss = cdao.search(Integer.parseInt(categoryid));
            request.setAttribute("rs", rs);
            request.setAttribute("rss", rss);
            rd = request.getRequestDispatcher(view_detail_auction);
            rd.forward(request, response);
        }*/
/*
        if (service.equalsIgnoreCase("editauction")) {
            String auctionid = request.getParameter("auctionid");
            String categoryid = request.getParameter("categoryid");
            rs = dao.search(Integer.parseInt(auctionid));
            rss = cdao.search(Integer.parseInt(categoryid));
            ArrayList<Category> array = cdao.view();
            request.setAttribute("array", array);
            request.setAttribute("rs", rs);
            request.setAttribute("rss", rss);
            rd = request.getRequestDispatcher(edit_auction);
            rd.forward(request, response);
        }*/
        if (service.equalsIgnoreCase("search")) {
            ArrayList<Category> array = (ArrayList<Category>) cdao.view();
            request.setAttribute("array", array);
            String keyword = request.getParameter("txtsearch");
            String status = request.getParameter("auction_status");
            System.out.println(status);
            String category = request.getParameter("category");
            System.out.println(category);
            ArrayList<Auction> arr = dao.list(keyword, -1, -1);
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        /*
        if (service.equalsIgnoreCase("updateauction")) {
            SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat hDateFormat = new SimpleDateFormat("HH:mm");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String sta = request.getParameter("cb2");
            int status = Integer.parseInt(sta);
            String categoryid1 = request.getParameter("cb1");
            String start_date1 = request.getParameter("startdate");
            String start_time1 = request.getParameter("starttime");
            String end_date1 = request.getParameter("enddate");
            String end_time1 = request.getParameter("endtime");
            String starting_price1 = request.getParameter("startingprice");
            String buy_now_price1 = request.getParameter("buynowprice");
            String image1 = request.getParameter("image1");
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");
            String image4 = request.getParameter("image4");
            String image5 = request.getParameter("image5");
            String video1 = request.getParameter("video");
            int start = video1.indexOf('=');
            String video = video1.substring(start + 1);
            String userid = request.getParameter("userid");
            int seller_id = Integer.parseInt(userid);
            String auction_id = request.getParameter("auctionid");
            int auctionid_ = Integer.parseInt(auction_id);
            int categoryid = Integer.parseInt(categoryid1);
            Date start_date = (Date) DateFormat.parse(start_date1);
            Date start_time = (Date) hDateFormat.parse(start_time1);
            Date end_date = (Date) DateFormat.parse(end_date1);
            Date end_time = (Date) hDateFormat.parse(end_time1);
            double starting_price = Double.parseDouble(starting_price1);
            double buy_now_price = Double.parseDouble(buy_now_price1);
            Auction auction = new Auction(auctionid_, categoryid, seller_id, title, description, start_date, start_time, end_date, end_time, starting_price, buy_now_price, status, video, image1, image2, image3, image4, image5);
            int n = dao.update(auction);
            if (n > 0) {
                ArrayList<Category> array = (ArrayList<Category>) cdao.view();
                request.setAttribute("array", array);
                //response.sendRedirect(auction_manager);
                rd = request.getRequestDispatcher(auction_manager);
                rd.forward(request, response);
            }
        }
        */
        /*
        if (service.equalsIgnoreCase("addnewauction")) {
            SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat hDateFormat = new SimpleDateFormat("HH:mm");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String sta = request.getParameter("cb2");
            int status = Integer.parseInt(sta);
            String categoryid1 = request.getParameter("cb1");
            String start_date1 = request.getParameter("startdate");
            String start_time1 = request.getParameter("starttime");
            String end_date1 = request.getParameter("enddate");
            String end_time1 = request.getParameter("endtime");
            System.out.println(end_time1);
            String starting_price1 = request.getParameter("startingprice");
            String buy_now_price1 = request.getParameter("buynowprice");
            String image1 = request.getParameter("image1");
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");
            String image4 = request.getParameter("image4");
            String image5 = request.getParameter("image5");
            String video1 = request.getParameter("video");
            int start = video1.indexOf('=');
            String video = video1.substring(start + 1);
            String id = request.getParameter("userid");
            int seller_id = Integer.parseInt(id);
            int categoryid = Integer.parseInt(categoryid1);
            Date start_date = (Date) DateFormat.parse(start_date1);
            Date start_time = (Date) hDateFormat.parse(start_time1);
            Date end_date = (Date) DateFormat.parse(end_date1);
            Date end_time = (Date) hDateFormat.parse(end_time1);
            double starting_price = Double.parseDouble(starting_price1);
            double buy_now_price = Double.parseDouble(buy_now_price1);
            Auction auction = new Auction(categoryid, seller_id, title, description, start_date, start_time, end_date, end_time, starting_price, buy_now_price, status, video, image1, image2, image3, image4, image5);
            int n = dao.add(auction);
            if (n > 0) {
                ArrayList<Category> array = (ArrayList<Category>) cdao.view();
                request.setAttribute("array", array);
                rd = request.getRequestDispatcher(auction_manager);
                rd.forward(request, response);
                //response.sendRedirect(auction_manager);
            } else {

            }
        }
        */
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(AuctionController.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AuctionController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(AuctionController.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AuctionController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
