/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.OtherDAO;
import DAO.UserDAO;
import Entity.User;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO dao = new UserDAO();
        OtherDAO otherDAO = new OtherDAO();
        ResultSet rs = null;
        String service = request.getParameter("service");
        if (service == null) {
            service = "-1";
        }
        final String userManager = "cp_user_manager.jsp?current_page=user_manager";
        final String view_detail_user = "cp_user_view_detail.jsp?current_page=user_manager";
        final String TableUser = "table_user.jsp";
        final String loginPage = "login.jsp";
        final String cp = "cp.jsp&current_page=dashboard";
        final String edit_user = "cp_user_edit.jsp?current_page=user_manager";
        final String change_pass = "cp_change_password.jsp?current_page=my_account";
        final String user_view_detail = "cp_user_view_detail.jsp";
        final String controller_view_detail = "UserController?service=view_detail";
        final String user_register = "register.jsp";
        final String edit_profile = "cp_edit_profile.jsp?current_page=my_account";

        RequestDispatcher rd;
        if (service.equalsIgnoreCase("user_manager")) {
            rd = request.getRequestDispatcher(userManager);
            rd.forward(request, response);
        } else if (service.equalsIgnoreCase("delete")) {
            String id = request.getParameter("no");
            int n = dao.delete(Integer.parseInt(id));
            if (n > 0) {
                rd = request.getRequestDispatcher(userManager + "&errorCode=1");
                rd.forward(request, response);
            } else {
                rd = request.getRequestDispatcher(userManager + "&errorCode=2");
                rd.forward(request, response);
            }

        } else if (service.equalsIgnoreCase("edit_profile")) {
            HttpSession session = request.getSession(true);
            String userIdString = (String) session.getAttribute("userid");
            int userId = Integer.parseInt(userIdString);
            User user = dao.getUser(userId);
            request.setAttribute("requestedUser", user);
            rd = request.getRequestDispatcher(edit_profile);
            rd.forward(request, response);
            
        } else if (service.equalsIgnoreCase("update_profile")) {
            HttpSession session = request.getSession(true);
            String userIdString = (String) session.getAttribute("userid");
            int userId = Integer.parseInt(userIdString);
            
            User user = dao.getUser(userId);
            user.setFullname(request.getParameter("fullname"));
            user.setPhonenumber(request.getParameter("phonenumber"));
            user.setAddress(request.getParameter("address"));
            int n = dao.update(user);
            request.setAttribute("requestedUser", user);
            if (n > 0) {
                rd = request.getRequestDispatcher(edit_profile + "&errorCode=0");
            } else {
                rd = request.getRequestDispatcher(edit_profile + "&errorCode=1");
            }
            rd.forward(request, response);
        } else if (service.equalsIgnoreCase("change_password")) {
            int userId = Integer.parseInt(request.getParameter("userid"));
            String oldPass = request.getParameter("old_password");
            String newPass = request.getParameter("new_password");
            String confirmPass = request.getParameter("confirm_password");
            if (oldPass == null || newPass == null || confirmPass == null || oldPass.isEmpty() || newPass.isEmpty() || confirmPass.isEmpty() || newPass.length() < 6 || confirmPass.length() < 6) {
                rd = request.getRequestDispatcher(change_pass + "&errorCode=1");
                rd.forward(request, response);
            } else if (!newPass.equals(confirmPass)) {
                rd = request.getRequestDispatcher(change_pass + "&errorCode=2");
                rd.forward(request, response);
            } else if (oldPass.equals(newPass)) {
                rd = request.getRequestDispatcher(change_pass + "&errorCode=3");
                rd.forward(request, response);
            } else {
                String errorCode = dao.changePassword(oldPass, newPass, userId);
                rd = request.getRequestDispatcher(change_pass + "&errorCode=" + errorCode);
                rd.forward(request, response);
            }

        } else if (service.equalsIgnoreCase("listall")) {
            ArrayList<User> arr = dao.list();
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(userManager);
            rd.forward(request, response);
        } else if (service.equalsIgnoreCase("view_detail")) {
            String userId = request.getParameter("userid");
            String username = request.getParameter("username");
            if (userId == null) {
                request.setAttribute("requestedUser", dao.getUser(username));
            } else {
                request.setAttribute("requestedUser", dao.getUser(Integer.parseInt(userId)));
            }
            rd = request.getRequestDispatcher(user_view_detail);
            rd.forward(request, response);
        } else if (service.equalsIgnoreCase("edit_user")) {
            String userId = request.getParameter("userid");
            request.setAttribute("requestedUser", dao.getUser(Integer.parseInt(userId)));
            rd = request.getRequestDispatcher(edit_user);
            rd.forward(request, response);
        } else if (service.equalsIgnoreCase("update_user")) {
            int userId = Integer.parseInt(request.getParameter("userid"));
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            int status = Integer.parseInt(request.getParameter("cb2"));
            int role = Integer.parseInt(request.getParameter("cb1"));

            User user = new User(username, email, status, role);
            user.setId(userId);
            user.setFullname(fullname);
            user.setPhonenumber(phonenumber);
            user.setAddress(address);

            int n = dao.update(user);
            if (n > 0) {
                response.sendRedirect(controller_view_detail + "&errorCode=1&username=" + username);
            } else {
                response.sendRedirect("notification.jsp?errorCode=3");
            }
        } else if (service.equalsIgnoreCase("add_user")) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            int status = Integer.parseInt(request.getParameter("cb2"));
            int role = Integer.parseInt(request.getParameter("cb1"));

            User user = new User(username, email, status, role);

            user.setFullname(request.getParameter("fullname"));
            user.setPhonenumber(request.getParameter("phonenumber"));
            user.setAddress(request.getParameter("address"));

            String madeRawPassword = user.makePassword();

            if (dao.addUser(user) > 0) {
                //Start sending email to user.
                String subject = "Online Auction System - Account Information";
                String body = "Dear " + username + ",\n"
                        + "\n"
                        + "Thank you for using OAS! Your account has been successfully created, you can now log into our system with the following details:\n"
                        + "Username: " + username + "\n"
                        + "Password: " + madeRawPassword + "\n"
                        + "\n"
                        + "Happy bidding,\n"
                        + "Your friends at OAS.";
                OtherDAO other = new OtherDAO();
                other.sendMail(email, subject, body);
                //Finish sending email
                response.sendRedirect(controller_view_detail + "&errorCode=2&username=" + username);
            } else {
                response.sendRedirect("notification.jsp?errorCode=1");
            }
        } else if (service.equalsIgnoreCase("search")) {
            String search = request.getParameter("txtsearch");
            String role = request.getParameter("cb1");
            String status = request.getParameter("cb2");
            ArrayList<User> arr = dao.list(search, role, status);
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(userManager + "&keyword=" + search + "&role=" + role + "&status=" + status);
            rd.forward(request, response);
        } else if (service.equalsIgnoreCase("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String[] result = dao.logUserIn(username, password);

            if (result[0].equalsIgnoreCase("ok")) {
                HttpSession session = request.getSession(true);
                session.setAttribute("role", result[4]);
                session.setAttribute("username", result[2]);
                session.setAttribute("userid", result[3]);
                rd = request.getRequestDispatcher("cp.jsp?current_page=dashboard&errorCode=1");
            } else {
                rd = request.getRequestDispatcher("login.jsp?errorCode=" + result[1]);
            }
            rd.forward(request, response);
        } else if (service.equals("register")) {
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String url = user_register + "?username=" + username + "&fullname=" + fullname + "&phonenumber=" + phonenumber + "&email=" + email + "&address=" + address + "&errorCode=";
            if (username.isEmpty() || username.length() < 3) {
                url = url + "1";
                rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (email.isEmpty() || email.length() < 3 || !email.contains("@") || !email.contains(".")) {
                url = url + "2";
                rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                if (dao.isUserExisted(username, email)) {
                    url = url + "3";
                    rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                }
            }

            User user = new User(username, email, 1, 0);
            user.setAddress(address);
            user.setFullname(fullname);
            user.setPhonenumber(phonenumber);
            String madePassword = user.makePassword();

            int n = dao.addUser(user);
            if (n > 0) {
                //Start sending email to user.
                String subject = "Online Auction System - Account Information";
                String body = "Dear " + username + ",\n"
                        + "\n"
                        + "Thank you for using OAS! Your account has been successfully created, you can now log into our system with the following details:\n"
                        + "Username: " + username + "\n"
                        + "Password: " + madePassword + "\n"
                        + "\n"
                        + "Happy bidding,\n"
                        + "Your friends at OAS.";
                OtherDAO other = new OtherDAO();
                other.sendMail(email, subject, body);
                //Finish sending email
                rd = request.getRequestDispatcher(loginPage + "?errorCode=7&username=" + username);
                rd.forward(request, response);
            } else {
                url = url + "4";
                rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }

        } else {
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
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
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
        } catch (NoSuchAlgorithmException ex) {
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
