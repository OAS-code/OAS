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
            String success_page = request.getParameter("success_page");
            if (session != null) {
                session.invalidate();
                if (success_page != null && success_page.equals("1")) {
                    response.sendRedirect("login.jsp?errorCode=4");
                } else if (success_page != null && success_page.equals("2")) {
                    response.sendRedirect("login.jsp?errorCode=3");
                }
            }
        %>
    </body>
</html>
