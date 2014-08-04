/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import DAO.CategoryDAO;
import Entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class CategoryController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        CategoryDAO dao = new CategoryDAO();
        String service = request.getParameter("service");
        final String ListAllCategory = "ListAllCategory.jsp";
        final String TableCategory = "table_category.jsp";
        RequestDispatcher rd;
        if (service.equalsIgnoreCase("listall")) {
            ArrayList<Category> arr = dao.view();
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(ListAllCategory);
            rd.forward(request, response);
        }
        if(service.equalsIgnoreCase("addcategory")){
            String name = request.getParameter("name");
            Category category = new Category(name);
            int n = dao.add(category);
            if(n>0){
               response.sendRedirect(ListAllCategory);
            }
        }
        if(service.equalsIgnoreCase("delete")){
            String id = request.getParameter("categoryid");
            int n = dao.delete(Integer.parseInt(id));
            if (n > 0) {
                rd = request.getRequestDispatcher(ListAllCategory);
                rd.forward(request, response);
            }
        }
        if(service.equalsIgnoreCase("edit")){
            String id = request.getParameter("categoryid");
            int categoryid = Integer.parseInt(id);
            String name = request.getParameter("name");
            Category category = new Category(categoryid, name);
            int n = dao.update(category);
            if(n>0){
                response.sendRedirect(ListAllCategory);
            }
        }
        if (service.equalsIgnoreCase("search")) {
            String search = request.getParameter("txtsearch");
            ArrayList<Category> arr = dao.searchUser(search);
            request.setAttribute("arr", arr);
            rd = request.getRequestDispatcher(TableCategory);
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
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
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
