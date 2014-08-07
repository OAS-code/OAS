<%-- 
    Document   : perm_admin
    Created on : Aug 6, 2014, 3:08:10 PM
    Author     : Maxime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //String userName = (String) session.getAttribute("user");
            String role = (String) session.getAttribute("role");
            if (role != null) {
                if (role.equalsIgnoreCase("Admin")) {
                } else {
                    response.sendRedirect("notification.jsp");
                }
            } else {
                response.sendRedirect("notification.jsp");
            }


        %>  

    </body>
</html>
