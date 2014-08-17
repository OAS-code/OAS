/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AuctionDAO;
import DAO.CategoryDAO;
import DAO.OtherDAO;
import Entity.Auction;
import Entity.Category;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

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
            request.setAttribute("categories", array);
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        else if (service.equalsIgnoreCase("bidnow")) {
            rd = request.getRequestDispatcher(bidding_detail);
            rd.forward(request, response);
        }
        else if (service.equalsIgnoreCase("listall")) {
            ArrayList<Category> categories = (ArrayList<Category>) cdao.view();
            request.setAttribute("categories", categories);
            ArrayList<Auction> auctions = dao.list();
            request.setAttribute("auctions", auctions);
            
            rd = request.getRequestDispatcher(auction_manager);
            rd.forward(request, response);
        }
        else if (service.equalsIgnoreCase("index")) {
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
        else if (service.equalsIgnoreCase("add_auction")) {
            ArrayList<Category> categories = (ArrayList<Category>) cdao.view();
            request.setAttribute("categories", categories);
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
        else if (service.equalsIgnoreCase("search")) {
            ArrayList<Category> categories = (ArrayList<Category>) cdao.view();
            request.setAttribute("categories", categories);
            String keyword = request.getParameter("keyword");
            String statusString = request.getParameter("status");
            int status = -1;
            String categoryString = request.getParameter("category");
            int category = -1;
            if (keyword==null) {
                keyword = "";
            }
            if (statusString!=null) {
                status = Integer.parseInt(statusString);
            }
            if (categoryString!=null) {
                category = Integer.parseInt(categoryString);
            }
            //System.out.println(category);
            ArrayList<Auction> auctions = dao.list(keyword, status, category);
            request.setAttribute("auctions", auctions);
            rd = request.getRequestDispatcher(auction_manager+"&keyword="+keyword+"&status="+status+"&category="+category);
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
        
        else if (service.equalsIgnoreCase("add_new_auction")) {
            String title = request.getParameter("title");
            if (title==null || title.isEmpty() || title.length() < 3) {
                System.out.println("Title must contains at least 3 characters.");
                return;
            }
            String description = request.getParameter("description");
            if (description==null){
                description = "";
            }
            String categoryIdString = request.getParameter("categoryId");
            int categoryId = 0;
            if (categoryIdString == null){
                System.out.println("Invalid category.");
                return;
            } else {
                categoryId = Integer.parseInt(categoryIdString);
            }
            String userid = request.getParameter("userid");
            int seller_id = Integer.parseInt(userid);
            
            OtherDAO other = new OtherDAO();
           
            double startPrice = other.getValidPrice(request.getParameter("startingPrice"));
            double buynowPrice = other.getValidPrice(request.getParameter("buynowPrice"));
            
            if (startPrice == -1 || buynowPrice == -1 || startPrice >= buynowPrice) {
                System.out.println("Invalid starting price or buy now price. Buy now price must be greater than starting price.");
                return;
            }
            
            double increaseBy = other.getValidPrice(request.getParameter("increaseBy"));
            if (increaseBy == -1 ) {
                System.out.println("Invalid increment price.");
                return;
            }
            
            String startDateString = request.getParameter("startDate");
            String endDateString = request.getParameter("endDate");
            DateTime startDate = other.getDateTimeFromString(startDateString);
            //System.out.println(startDate.toString());
            DateTime endDate = other.getDateTimeFromString(endDateString);
            
            
            String img_cover = request.getParameter("img_cover");
            if (img_cover==null || img_cover.isEmpty()) {
                System.out.println("Cover image is mandatory.");
                return;
            }
            String img_1 = request.getParameter("img_1");
            String img_2 = request.getParameter("img_2");
            String img_3 = request.getParameter("img_3");
            String img_4 = request.getParameter("img_4");
            String img_5 = request.getParameter("img_5");
            String v_youtube = request.getParameter("v_youtube");
            if (img_1==null) {
                img_1 = "";
            }
            if (img_2==null) {
                img_2 = "";
            }
            if (img_3==null) {
                img_3 = "";
            }
            if (img_4==null) {
                img_4 = "";
            }
            if (img_5==null) {
                img_5 = "";
            }
            if (v_youtube==null) {
                v_youtube = "";
            }
            
            if (v_youtube.length()>0) {
                v_youtube = other.getValidYoutubeUrl(v_youtube);
                if (v_youtube.equalsIgnoreCase("invalid")) {
                    System.out.println("Youtube link is broken.");
                    return;
                }
            }
            
            Auction auction = new Auction();
            auction.setCategoryId(categoryId);
            auction.setSellerId(seller_id);
            auction.setTitle(title);
            auction.setDescription(description);
            auction.setStartPrice(startPrice);
            auction.setBuynowPrice(buynowPrice);
            auction.setIncreaseBy(increaseBy);
            auction.setImgCover(img_cover);
            auction.setImg1(img_1);
            auction.setImg2(img_2);
            auction.setImg3(img_3);
            auction.setImg4(img_4);
            auction.setImg5(img_5);
            auction.setvYoutube(v_youtube);
            auction.setStartDate(startDate);
            auction.setEndDate(endDate);
            
            if (dao.add(auction)) {
                ArrayList<Category> categories = (ArrayList<Category>) cdao.view();
                request.setAttribute("categories", categories);
                rd = request.getRequestDispatcher(auction_manager);
                rd.forward(request, response);
                
            } else {
                
            }
        }
        
        else {
            response.sendRedirect("notification.jsp?errorCode=2");
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
