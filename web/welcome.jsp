<%-- 
    Document   : welcome
    Created on : Jul 22, 2014, 12:23:27 AM
    Author     : NamNV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            String userName = (String) session.getAttribute("user");
        %>
        <%
            if (userName == null) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("cp.jsp");
        %>
        <%}%>
    </body>
</html>
