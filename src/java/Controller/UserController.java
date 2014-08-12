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
        final String change_pass = "cp_change_password.jsp?error_code=1";
        final String user_view_detail = "cp_user_view_detail.jsp";
        final String controller_view_detail = "UserController?service=view_detail";
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
            String id1 = request.getParameter("no");
            int id = Integer.parseInt(id1);
            String fullname = request.getParameter("fullname");
            String phonenumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            User user = new User(id, fullname, phonenumber, address);
            int n = dao.update_profile(user);
            if (n > 0) {
                response.sendRedirect(cp);
            }
        } else if (service.equalsIgnoreCase("change_password")) {
            String id1 = request.getParameter("no");
            int id = Integer.parseInt(id1);
            String oldpass = request.getParameter("old_password");
            String newpass = request.getParameter("new_password");
            String confirmpass = request.getParameter("confirm_password");
            if (oldpass == null || newpass == null || confirmpass == null) {
                rd = request.getRequestDispatcher(change_pass);
                rd.forward(request, response);
            } else {
                if (!newpass.equals(confirmpass)) {
                    rd = request.getRequestDispatcher("cp_change_password.jsp?error_code=2");
                    rd.forward(request, response);
                } else if (oldpass.equals(newpass)) {
                    rd = request.getRequestDispatcher("cp_change_password.jsp?error_code=3");
                    rd.forward(request, response);
                } else {
                    int n = dao.change_password(oldpass, newpass, id);
                    if (n > 0) {
                        rd = request.getRequestDispatcher("logout.jsp?success_page=1");
                        rd.forward(request, response);
                    } else {
                        rd = request.getRequestDispatcher("cp_change_password.jsp?error_code=5");
                        rd.forward(request, response);
                    }
                }
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
            System.out.print(userId);
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

            user.makePassword();

            if (dao.addUser(user) > 0) {
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
            String salt = dao.getSalt(username);
            int id = dao.getId(username);
            String userid = Integer.toString(id);
            String role = dao.loginAuthenticate(username, password, salt);
            if (role != null && userid != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("role", role);
                session.setAttribute("user", username);
                session.setAttribute("userid", userid);
                rd = request.getRequestDispatcher("cp.jsp?current_page=dashboard&errorCode=1");
                rd.forward(request, response);
            } else {
                rd = request.getRequestDispatcher("login.jsp?errorCode=1");
                rd.forward(request, response);
            }
            /*switch (role) {
             case "Admin":
             HttpSession session = request.getSession(true);
             session.setAttribute("user", username);
             session.setAttribute("role", role);
             rd = request.getRequestDispatcher("welcome.jsp");
             rd.forward(request, response);
             break;
             case "Staff":
             break;
             case "Customer":
             break;
             default:
             rd = request.getRequestDispatcher("login.jsp");
             rd.forward(request, response);
             break;
             }*/
        } else if (service.equals("registerUser")) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String salt = otherDAO.makeRandomString(10, 10);
            User user = new User(fullname, username, password, phonenumber, email, address, salt);
            int n = dao.addUserFromRegister(user);
            if (n > 0) {
                rd = request.getRequestDispatcher(loginPage);
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
