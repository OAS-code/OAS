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
import java.io.PrintWriter;
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
        final String ListAllAuction = "ListAllAuction.jsp";
        final String AddAuction = "AddAuction.jsp";
        final String ViewDetailAuction = "ViewDetailAuction.jsp";
        ResultSet rs = null, rss = null;
        RequestDispatcher rd = null;

        if (service.equalsIgnoreCase("listall")) {
            ArrayList<Auction> arr = dao.view();
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(ListAllAuction);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("addauction")) {
            ArrayList<Category> array = cdao.select();
            request.setAttribute("array", array);
            rd = request.getRequestDispatcher(AddAuction);
            rd.forward(request, response);
        }
        if(service.equals("viewdetail")){
            String auctionid = request.getParameter("auctionid");
            String categoryid = request.getParameter("categoryid");
            rs = dao.search(Integer.parseInt(auctionid));
            rss = cdao.searchCategory(Integer.parseInt(categoryid));
            request.setAttribute("rs", rs);
            request.setAttribute("rss", rss);
            rd = request.getRequestDispatcher(ViewDetailAuction);
            rd.forward(request, response);
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
            Logger.getLogger(AuctionController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AuctionController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AuctionController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AuctionController.class.getName()).log(Level.SEVERE, null, ex);
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
