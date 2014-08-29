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
            String roleString = (String) session.getAttribute("role");
            int role = -1;
            if (roleString != null){
                role = Integer.parseInt(roleString);
            }
            if (role!=1) {
                response.sendRedirect("notification.jsp");
            }
        %>

    </body>
</html>
