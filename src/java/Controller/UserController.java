/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Entity.User;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MrTu
 */
public class UserController extends HttpServlet {

    final private String errorPage = "fail.jsp";
    final private String homePage = "index.jsp";
    final private String welcomePage = "welcome.jsp";
    final private String registerPage = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO dao = new UserDAO();
        String service = request.getParameter("service");
        final String ListAllUser = "ListAllUser.jsp";
        final String ViewDetail = "ViewDetail.jsp";
        RequestDispatcher rd;
        if (service.equalsIgnoreCase("adduser")) {
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String role = request.getParameter("cb1");
            String status = request.getParameter("cb2");
            User user = new User(fullname, username, password, phonenumber, email, address, role, status);
            int n = dao.add(user);
            if (n > 0) {
                response.sendRedirect(ListAllUser);
            }
        }
        if (service.equalsIgnoreCase("deleteuser")) {
            String id = request.getParameter("no");
            int n = dao.delete(Integer.parseInt(id));
            if (n > 0) {
                rd = request.getRequestDispatcher(ListAllUser);
                rd.forward(request, response);
            }
        }
        if (service.equalsIgnoreCase("edituser")) {
            String id1 = request.getParameter("no");
            int id = Integer.parseInt(id1);
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String status = request.getParameter("cb2");
            String role = request.getParameter("cb1");
            User user = new User(id, fullname, username, password, phonenumber, email, address, role, status);
            int n = dao.update(user);
            if (n > 0) {
                response.sendRedirect(ListAllUser);
            }
        }
        if (service.equalsIgnoreCase("listall")) {
            ArrayList<User> arr = dao.view();
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(ListAllUser);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("viewdetail")) {
            String id = request.getParameter("userid");
            ResultSet rs = dao.search(Integer.parseInt(id));
            request.setAttribute("rs", rs);
            rd = request.getRequestDispatcher(ViewDetail);
            rd.forward(request, response);
        }
        if (service.equalsIgnoreCase("search")) {
            String search = request.getParameter("txtsearch");
            String role = request.getParameter("user_type");
            String status = request.getParameter("status");
            ArrayList<User> arr = dao.searchUser(search, role, status);
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(ListAllUser);
            rd.forward(request, response);
        } 
        if(service.equalsIgnoreCase("login")){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
        }
        /*if (service.equals("Login")) {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPass");
            UserDAO login = new UserDAO();
            boolean result = login.checkLogin(username, password);
            String url = errorPage;
            if (result) {
                HttpSession session = request.getSession(true);
                session.setAttribute("USER", username);
                url = welcomePage;
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (action.equals("tryAgain")) {
            RequestDispatcher rd = request.getRequestDispatcher(homePage);
            rd.forward(request, response);
        } else if (action.equals("register")) {
            RequestDispatcher rd = request.getRequestDispatcher(registerPage);
            rd.forward(request, response);
        }*/
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
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
