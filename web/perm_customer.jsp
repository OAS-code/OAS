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
            int role = Integer.parseInt( (String) session.getAttribute("role"));
            if (role != 0 && role != 1 && role != 2) {
                response.sendRedirect("notification.jsp");
            }
        %>
    </body>
</html>
