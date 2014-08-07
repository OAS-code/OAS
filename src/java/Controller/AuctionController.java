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
import Entity.Digital;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
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
        final String AddAuction = "AddAuction.jsp";
        final String ViewDetailAuction = "ViewDetailAuction.jsp";
        final String EditAuction = "EditAuction.jsp";
        final String TableAuction = "table_auction.jsp";
        ResultSet rs, rss, rst;
        RequestDispatcher rd;

        if (service.equalsIgnoreCase("auction_manager")) {
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("listall")) {
            ArrayList<Auction> arr = dao.view();
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("deleteauction")) {
            String id = request.getParameter("no");
            int n = dao.delete(Integer.parseInt(id));
            if (n > 0) {
                rd = request.getRequestDispatcher(auction_manager);
                rd.forward(request, response);
            }
        }
        if (service.equalsIgnoreCase("addauction")) {
            ArrayList<Category> array = cdao.select();
            request.setAttribute("array", array);
            rd = request.getRequestDispatcher(AddAuction);
            rd.forward(request, response);
        }
        if (service.equals("viewdetail")) {
            String auctionid = request.getParameter("auctionid");
            String categoryid = request.getParameter("categoryid");
            rs = dao.search(Integer.parseInt(auctionid));
            rss = cdao.search(Integer.parseInt(categoryid));
            rst = dao.searchDigital(Integer.parseInt(auctionid));
            request.setAttribute("rs", rs);
            request.setAttribute("rss", rss);
            request.setAttribute("rst", rst);
            rd = request.getRequestDispatcher(ViewDetailAuction);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("editauction")) {
            String auctionid = request.getParameter("auctionid");
            String categoryid = request.getParameter("categoryid");
            rs = dao.search(Integer.parseInt(auctionid));
            rss = cdao.search(Integer.parseInt(categoryid));
            rst = dao.searchDigital(Integer.parseInt(auctionid));
            ArrayList<Category> array = cdao.select();
            request.setAttribute("array", array);
            request.setAttribute("rs", rs);
            request.setAttribute("rss", rss);
            request.setAttribute("rst", rst);
            rd = request.getRequestDispatcher(EditAuction);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("search")) {
            String search = request.getParameter("txtsearch");
            String stt = request.getParameter("status_au");
            ArrayList<Auction> arr = dao.searchAuction(search, stt);
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("updateauction")) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String id = request.getParameter("no");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String status = request.getParameter("cb2");
            String categoryid1 = request.getParameter("cb1");
            String start_date1 = request.getParameter("startdate");
            String end_date1 = request.getParameter("enddate");
            String starting_price1 = request.getParameter("startingprice");
            String reserve_price1 = request.getParameter("reserveprice");
            String buy_now_price1 = request.getParameter("buynowprice");
            String image1 = request.getParameter("image1");
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");
            String image4 = request.getParameter("image4");
            String image5 = request.getParameter("image5");
            String video = request.getParameter("video");
            int auctionid = Integer.parseInt(id);
            int seller_id = 1;
            int categoryid = Integer.parseInt(categoryid1);
            Date start_date = (Date) simpleDateFormat.parse(start_date1);
            Date end_date = (Date) simpleDateFormat.parse(end_date1);

            double starting_price = Double.parseDouble(starting_price1);
            double reserve_price = Double.parseDouble(reserve_price1);
            double buy_now_price = Double.parseDouble(buy_now_price1);
            Auction auction = new Auction(auctionid, categoryid, seller_id, title, description, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
            int n = dao.update(auction);
            if (n > 0) {

                Digital digital = new Digital(auctionid, image1, image2, image3, image4, image5, video);
                int m = dao.updateDigital(digital);
                if (m > 0) {
                    rd = request.getRequestDispatcher(auction_manager);
                    rd.forward(request, response);
                }
            }

        }

        if (service.equalsIgnoreCase(
                "addnewauction")) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String status = request.getParameter("cb2");
            String categoryid1 = request.getParameter("cb1");
            String start_date1 = request.getParameter("startdate");
            String end_date1 = request.getParameter("enddate");
            String starting_price1 = request.getParameter("startingprice");
            String reserve_price1 = request.getParameter("reserveprice");
            String buy_now_price1 = request.getParameter("buynowprice");
            String image1 = request.getParameter("image1");
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");
            String image4 = request.getParameter("image4");
            String image5 = request.getParameter("image5");
            String video = request.getParameter("video");
            int seller_id = 1;
            int categoryid = Integer.parseInt(categoryid1);
            Date start_date = (Date) simpleDateFormat.parse(start_date1);
            Date end_date = (Date) simpleDateFormat.parse(end_date1);

            double starting_price = Double.parseDouble(starting_price1);
            double reserve_price = Double.parseDouble(reserve_price1);
            double buy_now_price = Double.parseDouble(buy_now_price1);
            Auction auction = new Auction(categoryid, seller_id, title, description, start_date, end_date, starting_price, reserve_price, buy_now_price, status);
            int n = dao.add(auction);
            if (n > 0) {
                int auctionid = dao.lastID();
                Digital digital = new Digital(auctionid, image1, image2, image3, image4, image5, video);
                int m = dao.addDigital(digital);
                if (m > 0) {
                    rd = request.getRequestDispatcher(auction_manager);
                    rd.forward(request, response);
                }
            }
        }
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
