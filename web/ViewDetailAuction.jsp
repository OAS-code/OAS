<%-- 
    Document   : ViewDetailAuction
    Created on : Jul 17, 2014, 11:58:55 PM
    Author     : MrTu
--%>

<%@page import="Entity.Digital"%>
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
                <h2 style="margin: auto;margin-left: 10px">Auction information</h2>  
                <form name="form1" method="post" action="AuctionController" style="width: 350px;margin: auto;margin-top: 10px;margin-bottom: 20px;">
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
                        <input type="hidden" id="no" name="no" value="<%=auction.getAuctionid()%>" readonly></td>
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
                        <script>
                            currentIndx = 0;
                            MyImages = new Array();
                            MyImages[0] = "<%=digital.getImage1()%>";
                            MyImages[1] = "<%=digital.getImage2()%>";
                            MyImages[2] = "<%=digital.getImage3()%>";
                            MyImages[3] = "<%=digital.getImage4()%>";
                            MyImages[4] = "<%=digital.getImage5()%>";
                            imagesPreloaded = new Array(5);
                            for (var i = 0; i < MyImages.length; i++)
                            {
                                imagesPreloaded[i] = new Image(220, 220);
                                imagesPreloaded[i].src = MyImages[i];
                            }
                            function writeImageNumber()
                            {
                                oSpan = document.getElementById("sp1");
                                oSpan.innerHTML = "Image " + eval(currentIndx + 1) + " of " + MyImages.length;
                            }
                            function Nexter() {
                                if (currentIndx < imagesPreloaded.length - 1) {
                                    currentIndx = currentIndx + 1;
                                    document.theImage.src = imagesPreloaded[currentIndx].src;
                                }
                                else {
                                    currentIndx = 0;
                                    document.theImage.src = imagesPreloaded[currentIndx].src;
                                }
                                writeImageNumber();
                            }
                            function Backer() {
                                if (currentIndx > 0) {
                                    currentIndx = currentIndx - 1;
                                    document.theImage.src = imagesPreloaded[currentIndx].src;
                                    ;
                                }
                                else {
                                    currentIndx = 3;
                                    document.theImage.src = imagesPreloaded[currentIndx].src;
                                }
                                writeImageNumber();
                            }
                            function setCurrentIndex()
                            {
                                currentIndx = 0;
                                document.theImage.src = MyImages[0];
                                writeImageNumber();
                            }
                        </script>
                        <tr>
                            <td style="text-align: right">Image:</td>
                            <td><img SRC="<%=digital.getImage1()%>" NAME="theImage" HEIGHT="220" WIDTH="220"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="button" value="&lt;&lt; Previous" name="previous" onClick="Backer()">
                                <input type="button" value="Next &gt;&gt;" name="next" onClick="Nexter()">&nbsp;<span id="sp1"></span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Video:</td>
                            <td>
                                <!-- <embed width="300" height="250" 
                                        src="" 
                                        type="application/x-shockwave-flash">-->
                                <iframe width="560" height="315" src="//www.youtube.com/embed/<%=digital.getVideo()%>" frameborder="0" allowfullscreen></iframe>
                            </td>

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
                                <input type="button" name="Edit" id="Edit" value="Edit" onclick="window.location = 'AuctionController?service=editauction&auctionid=<%=auction.getAuctionid()%>&categoryid=<%=category.getCategoryid()%>';">
                                <input type="submit" name="delete" id="delete" value="Delete" onclick="return confirm('Are you sure?')"> 
                                <input type="hidden" name="service" id="service" value="deleteauction">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
