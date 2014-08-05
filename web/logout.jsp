<%-- 
    Document   : logout
    Created on : Aug 4, 2014, 12:32:40 PM
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
            if(session!=null){
                session.invalidate();
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
