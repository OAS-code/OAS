/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AuctionDAO;
import DAO.BidDAO;
import Entity.Auction;
import Entity.Bid;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Duc
 */
public class BidController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        final String auction_manager = "cp_auction_manager.jsp?current_page=auction_manager";
        final String bidding_detail = "cp_bidding_detail.jsp";
        final String add_auction = "cp_auction_add.jsp?current_page=auction_manager";
        final String view_detail_auction = "cp_auction_view_detail.jsp?current_page=auction_manager";
        final String edit_auction = "cp_edit_auction.jsp";
        final String add_new_auction = "cp_auction_add.jsp";
        final String view_auction = "auction_detail.jsp";
        ResultSet rs, rss, rst;
        RequestDispatcher rd;

        final String auction_detail_loading = "auction_detail_ajax.jsp";

        if (service.equalsIgnoreCase("auction_detail_loading")) {

            String auctionId = request.getParameter("auctionId");
            HttpSession session = request.getSession(true);
            String roleString = (String) session.getAttribute("role");
            String userId = (String) session.getAttribute("userid");
            if (roleString == null) {
                session.setAttribute("last_page", "AuctionController?service=view&auctionId=" + auctionId);
                rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=1");
                rd.forward(request, response);
                return;
            } else {
                if (Integer.parseInt(roleString) != 0) {
                    //session.setAttribute("last_page", "AuctionController?service=view&auctionId="+auctionId);
                    rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=2");
                    rd.forward(request, response);
                    return;
                } else {
                    AuctionDAO auctionDAO = new AuctionDAO();
                    Auction auction = auctionDAO.getAuction(Integer.parseInt(auctionId));
                    if (auction.getSellerId() == Integer.parseInt(userId)) {
                        rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=3");
                        rd.forward(request, response);
                        return;
                    } else {
                        BidDAO bidDao = new BidDAO();
                        ArrayList<Bid> bids = bidDao.getBidFromAuctionId(Integer.parseInt(auctionId), 1);
                        
                        String userBidValueString = (String) request.getParameter("userBidValue");
                        Double userBidValue = 0.0;
                        if (userBidValueString==null) {
                            if (bids.size() > 0) {
                                userBidValue = bids.get(0).getAmount()+auction.getIncreaseBy();
                            } else {
                                userBidValue = auction.getStartPrice()+auction.getIncreaseBy();
                            }
                        } else {
                           userBidValue = Double.parseDouble(userBidValueString);
                        }
                        if (bids.size() > 0 && bids.get(0).getBidderId() == Integer.parseInt(userId)) {
                            rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=6");
                            rd.forward(request, response);
                            return;
                        } else {
                            rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=0&auctionId=" + auctionId+"&userBidValue="+userBidValue);
                            rd.forward(request, response);
                            return;
                        }
                    }
                }
            }
        } else if (service.equalsIgnoreCase("place_bid")) {
            String auctionId = request.getParameter("auctionId");
            HttpSession session = request.getSession(true);
            String roleString = (String) session.getAttribute("role");
            String userId = (String) session.getAttribute("userid");
            if (roleString == null) {
                rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=4");
                rd.forward(request, response);
                return;
            } else {
                if (Integer.parseInt(roleString) != 0) {
                    rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=4");
                    rd.forward(request, response);
                    return;
                } else {
                    AuctionDAO auctionDAO = new AuctionDAO();
                    Auction auction = auctionDAO.getAuction(Integer.parseInt(auctionId));
                    if (auction.getSellerId() == Integer.parseInt(userId)) {
                        rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=4");
                        rd.forward(request, response);
                        return;
                    } else {

                        rd = request.getRequestDispatcher(auction_detail_loading + "?errorCode=5&auctionId=" + auctionId);
                        rd.forward(request, response);
                        return;
                    }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
