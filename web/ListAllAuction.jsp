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
        <title>Manage Auction</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 700px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
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
                        <label>Auction type:</label>
                        <select name="status_au" id="status_au">
                            <option value="" selected="selected">Select</option>
                            <option value="Active">Active</option>
                            <option value="Deactive">Deactive</option>
                            <option value="Future">Future</option>
                            <option value="Closed">Closed</option>
                        </select> 
                        <input type="submit" name="search" id="search" value="Search">
                        <input type="hidden" name="service" id="service" value="search">
                    </td>
                    <td>
                        <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'AuctionController?service=listall';">
                    </td>
                    <p>                       
                </form> 
            </div>
        </div>  
    </body>
</html>
