<%-- 
    Document   : ViewDetailAuction
    Created on : Jul 17, 2014, 11:58:55 PM
    Author     : MrTu
--%>

<%@page import="Entity.Category"%>
<%@page import="Entity.Auction"%>
<%@page import="java.sql.ResultSet"%>
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
                <h2 style="margin: auto;margin-left: 10px">View detail auction</h2>  
                <form name="form1" method="post" action="" style="width: 350px;margin: auto;margin-top: 10px;margin-bottom: 20px;">
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
                    <table>    
                        <input type="hidden" id="no" value="" readonly></td>
                        <tr>
                            <td style="text-align: right">Title:</td>
                            <td><input type="text" value="<%=auction.getTitle()%>" readonly></td>
                        </tr>
                        <%
                            ResultSet rss = (ResultSet) request.getAttribute("rss");
                            Category category = new Category();
                            if (rss.next()) {
                                category.setCategoryid(rss.getInt(1));
                                category.setName(rss.getString(2));
                            }
                        %>
                        <tr>
                            <td style="text-align: right">Category:</td>
                            <td>
                                <select name="cb1" id="cb1">
                                    <option value="<%=category.getCategoryid()%>" disabsled="disabled"><%=category.getName()%></option>
                                </select>
                                
                            </td>
                        </tr>                
                        <tr>
                            <td style="text-align: right">Description:</td>
                            <td><textarea name="description" id="description"><%=auction.getDescription()%></textarea></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Start date:</td>
                            <td><input type="text" value="<%=auction.getStart_date()%>" readonly></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">End date:</td>
                            <td><input type="text" value="<%=auction.getEnd_date()%>" readonly></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Starting price:</td>
                            <td><input type="text" value="<%=auction.getStarting_price()%>" readonly></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Reserve price:</td>
                            <td><input type="text" value="<%=auction.getReserve_price()%>" readonly></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Buy now price:</td>
                            <td><input type="text" value="<%=auction.getBuy_now_price()%>" readonly></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Status:</td>
                            <td>
                                <select name="cb2" id="cb2">
                                    <option value="<%=auction.getStatus()%>"><%=auction.getStatus()%></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="button" name="Edit" id="Edit" value="Edit" onclick="window.location = '';">
                                <input type="submit" name="delete" id="delete" value="Delete" onclick="return confirm('Are you sure?')">     
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
