<%-- 
    Document   : AddProcess
    Created on : Jul 10, 2014, 9:26:56 PM
    Author     : MrTu
--%>

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
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String status1 = request.getParameter("Status");
            if(status1.equals("active")){
                boolean status = true;
                User user = new User(fullname,username,password,phonenumber,email,address,status);
                int n = dao.add(user);
                if(n>0){
                    response.sendRedirect("UserController?service=listall");
                    return;
                }
            }else{
                boolean status = false;
                User user = new User(fullname,username,password,phonenumber,email,address,status);
                int n = dao.add(user);
                if(n>0){
                    response.sendRedirect("UserController?service=listall");
                    return;
                }
            }
        %>
    </body>
</html>
