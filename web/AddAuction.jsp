<%-- 
    Document   : AddAuction
    Created on : Jul 17, 2014, 9:11:06 PM
    Author     : MrTu
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Auction"%>
<%@page import="Entity.Category"%>
<%@page import="DAO.AuctionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add auction</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Add new auction</h2> 
                <br>
                <form name="form1" method="post" action="AddAuctionProcess.jsp">
                    <table>
                        <tr>
                            <td style="text-align: right">Title:</td>
                            <td>
                                <input type="text" name="title" id="title">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Category:</td>
                            <td>
                                <select name="cb1" id="cb1"> 
                                    <jsp:useBean id="array" class="java.util.ArrayList" scope="request">                               
                                    </jsp:useBean>              
                                    <c:forEach var="category" items="${array}">                                       
                                        <option value="${category.categoryid}">${category.name}</option> 
                                    </c:forEach>
                                </select> 
                            </td>                                
                        </tr>              
                        <tr>
                            <td style="text-align: right">Description:</td>
                            <td>
                                <textarea name="description" id="description"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Image:</td>
                            <td>
                                <input type="text" name="image" id="image" placeholder="Enter url image...">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Start date:</td>
                        <td>
                            <input type="date" name="startdate" id="startdate">
                        </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">End date:</td>
                        <td>                    
                            <input type="date" name="enddate" id="enddate">
                        </td>
                        </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Starting price:</td>
                            <td>                    
                                <input type="text" name="startingprice" id="startingprice">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Reserve price:</td>
                            <td>                    
                                <input type="text" name="reserveprice" id="reserveprice">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Buy now price:</td>
                            <td>                    
                                <input type="text" name="buynowprice" id="buynowprice">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Status:</td>
                            <td>                    
                                <select name="cb2" id="cb2">
                                    <option value="Active">Active</option>
                                    <option value="Deactive">Deactive</option>
                                    <option value="Future">Future</option>
                                    <option value="Closed">Closed</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="add" id="add" value="Add">
                                <input type="hidden" name="service" id="service" value="addanewauction">
                                <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location = 'AuctionController?service=listall';">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
