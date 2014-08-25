<%-- 
    Document   : top_ajax
    Created on : Aug 23, 2014, 9:14:08 PM
    Author     : Maxime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String data1 = request.getParameter("data1");
            String data2 = request.getParameter("data2");
        %>
    </head>
    <body>
        
    <li>
        <label>Welcome, <%=data1%>! &nbsp;</label>
    </li>
    <li>
        <p>Your Balance:</p>
        <span><font class=""></font></span><span class="user_balance" title=""><%=data2%></span>
    </li>
</body>
</html>
