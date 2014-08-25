<%-- 
    Document   : index
    Created on : Jul 6, 2014, 10:38:08 PM
    Author     : MrDuc
--%>

<%@page import="Entity.Category"%>
<%@page import="Entity.Auction"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Auction System</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <script language="JavaScript" type="text/javascript" src="JavaScript/permissions.js"></script>
    </head>
    <body>
        <%
            ArrayList[] auctionsArray = (ArrayList[]) request.getAttribute("auctionsArray");

            if (auctionsArray == null) {
                response.sendRedirect("AuctionController?service=index");
            } else {
                String errorCode = request.getParameter("errorCode");
        %>
        <%@ include file="top.jsp" %> 
        <div class="header2">  
            <%
                if (errorCode.equals("0")) {
            %>       
            <ul id="message" class="error_msg">
                <li><p></p></li>
            </ul>
            <%} else if (errorCode.equals("1")) {
            %>
            <ul id="message" class="error_msg">
                <li><p></p>Already in your watchlist.</li>
            </ul>
            <%
            } else if (errorCode.equals("2")) {
            %>
            <ul id="message" class="success_msg">
                <li><p></p>Add to watchlist success.</li>
            </ul>
            <%
            } else if (errorCode.equals("3")) {
            %>
            <ul id="message" class="success_msg">
                <li><p></p>Add to watchlist fail.</li>
            </ul>
            <%
            } else {
            %>
            <%
                }
            %>
            <%@ include file="home.jsp" %>
        </div>
        <jsp:include page="footer.jsp" />
        <%            
            }
        %>
    </body> 

</html>
