<%-- 
    Document   : ListAllAuction
    Created on : Jul 17, 2014, 4:15:07 PM
    Author     : MrTu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Manage Auction</h2> 
                <form name="form1" method="post" action="AuctionController">
                    <br>
                    <td>
                        <input type="button" name="add" id="add" value="Add new auction" onclick="window.location = 'AuctionController?service=addauction';">
                    </td>
                    <p>
                    <td>
                        <label>Keyword</label>
                        <input type="text" name="txtsearch" id="txtsearch">
                        <input type="submit" name="search" id="search" value="Search">
                        <input type="hidden" name="service" id="service" value="search">
                    </td>
                    <p>
                    <td> 

                        <table width="90%" border="1px">
                            <tr>
                                <th>No.</th>
                                <th>Title</th>
                                <th>Image</th>
                                <th>Status</th>
                            </tr>      
                            <jsp:useBean id="arr" class="java.util.ArrayList" scope="request">
                            </jsp:useBean>
                            <c:forEach var="auction" items="${arr}" varStatus="status"> 
                            <tr> 
                                <td>${status.count}</td> 
                                <td><a href="AuctionController?service=viewdetail&auctionid=${auction.auctionid}">${auction.title}</a></td>
                                <td><image src="${auction.image}" alt="img" width="50" height="50"/></td>
                                <td>${auction.status}</td>
                            </tr
                            </c:forEach>
                        </table>
                </form> 
            </div>
        </div>  
    </body>
</html>
