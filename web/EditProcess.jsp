<%-- 
    Document   : EditProcess
    Created on : Jul 10, 2014, 2:57:00 PM
    Author     : MrTu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entity.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDAO dao = new UserDAO();
            String id1 = request.getParameter("no");
            int id = Integer.parseInt(id1);
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String status1 = request.getParameter("Status");
            if(status1.equals("active")){
                boolean status = true;
                User user = new User(id,fullname,username,password,phonenumber,email,address,status);
                int n = dao.update(user);
                if(n>0){
                    response.sendRedirect("UserController?service=listall");
                }
            }else{
                boolean status = false;
                User user = new User(id,fullname,username,phonenumber,email,address,status);
                int n = dao.update(user);
                if(n>0){
                    response.sendRedirect("UserController?service=listall");
                }
            }
        %>
    </body>
</html>
