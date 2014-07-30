<%-- 
    Document   : EditAuction
    Created on : Jul 25, 2014, 12:20:25 AM
    Author     : MrTu
--%>

<%@page import="Entity.Digital"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Auction"%>
<%@page import="Entity.Category"%>
<%@page import="DAO.AuctionDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Edit auction</h2> 
                <br>
                <form name="form1" method="post" action="AuctionController">
                    <table>
                        <%
                            ResultSet rs = (ResultSet) request.getAttribute("rs");
                            Auction auction = new Auction();
                            if (rs.next()) {
                                auction.setAuctionid(rs.getInt(1));
                                auction.setCategoryid(rs.getInt(2));
                                auction.setSellerid(rs.getInt(3));
                                auction.setTitle(rs.getString(4));
                                auction.setDescription(rs.getString(5));
                                auction.setStart_date(rs.getDate(6));
                                auction.setEnd_date(rs.getDate(7));
                                auction.setStarting_price(rs.getDouble(8));
                                auction.setReserve_price(rs.getDouble(9));
                                auction.setBuy_now_price(rs.getDouble(10));
                                auction.setStatus(rs.getString(11));
                            }
                        %>  
                        <input type="hidden" id="no" name="no" value="<%=auction.getAuctionid()%>" readonly></td>
                        <tr>
                            <td style="text-align: right">Title:</td>
                            <td>
                                <input type="text" name="title" id="title" value="<%=auction.getTitle()%>">
                            </td>
                        </tr>
                        <%
                            ResultSet rss = (ResultSet) request.getAttribute("rss");
                            Category category1 = new Category();
                            if (rss.next()) {
                                category1.setCategoryid(rss.getInt(1));
                                category1.setName(rss.getString(2));
                            }
                        %>
                        <tr>
                            <td style="text-align: right">Category:</td>
                            <td>
                                <select name="cb1" id="cb1"> 
                                    <jsp:useBean id="array" class="java.util.ArrayList" scope="request">                               
                                    </jsp:useBean>              
                                    <c:forEach var="category" items="${array}">                                       
                                        <option value="${category.categoryid}">${category.name}</option>
                                        <script>
                                            document.getElementById('cb1').value = '<%=category1.getCategoryid()%>';
                                        </script>
                                    </c:forEach>
                                </select> 
                            </td>                                
                        </tr>                         
                        <tr>
                            <td style="text-align: right">Description:</td>
                            <td>
                                <textarea name="description" id="description"><%=auction.getDescription()%></textarea>
                            </td>
                        </tr>
                        <%
                            ResultSet rst = (ResultSet) request.getAttribute("rst");
                            Digital digital = new Digital();
                            if (rst.next()) {
                                digital.setId(rst.getInt(1));
                                digital.setImage1(rst.getString(2));
                                digital.setImage2(rst.getString(3));
                                digital.setImage3(rst.getString(4));
                                digital.setImage4(rst.getString(5));
                                digital.setImage5(rst.getString(6));
                                digital.setVideo(rst.getString(7));
                            }
                        %>
                        <tr>
                            <td style="text-align: right">Image:</td>  
                            <td>
                                <input type="text" name="image1" id="image1" value="<%=digital.getImage1()%>">
                            </td>
                        </tr>
                        <tr>
                            <td></td> 
                            <td>
                                <input type="text" name="image2" id="image2" value="<%=digital.getImage2()%>">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="text" name="image3" id="image3" value="<%=digital.getImage3()%>">
                            </td>
                        </tr>
                        <tr>
                            <td></td>  
                            <td>
                                <input type="text" name="image4" id="image4" value="<%=digital.getImage4()%>">
                            </td>
                        </tr>
                        <tr>
                            <td></td>  
                            <td>
                                <input type="text" name="image5" id="image5" value="<%=digital.getImage5()%>">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Video:</td>
                            <td>
                                <input type="text" name="video" id="video" value="<%=digital.getVideo()%>">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Start date:</td>
                            <td>
                                <input type="date" name="startdate" id="startdate" value="<%=auction.getStart_date()%>">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">End date:</td>
                            <td>                    
                                <input type="date" name="enddate" id="enddate" value="<%=auction.getEnd_date()%>">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Starting price:</td>
                            <td>                    
                                <input type="text" name="startingprice" id="startingprice" value="<%=auction.getStarting_price()%>">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Reserve price:</td>
                            <td>                    
                                <input type="text" name="reserveprice" id="reserveprice" value="<%=auction.getReserve_price()%>">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Buy now price:</td>
                            <td>                    
                                <input type="text" name="buynowprice" id="buynowprice" value="<%=auction.getBuy_now_price()%>">
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
                                <script>
                                    document.getElementById('cb2').value = '<%=auction.getStatus()%>';
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="save" id="save" value="Save">
                                <input type="hidden" name="service" id="service" value="updateauction">
                                <input type="reset" name="reset" id="reset" value="Clear">
                                <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location = 'AuctionController?service=listall';">
                            </td>
                        </tr>
                    </table>                
                </form>
            </div>
        </div>
    </body>
</html>
