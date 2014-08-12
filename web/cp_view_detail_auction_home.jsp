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
        <title>Auction information</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/table.css"/>
    </head>
    <body>
        <div id="edit_profile_page" class="my_message_right">
            <div class="message_common_border">
                <h1 title="EDIT PROFILE">Auction information</h1>
                <p>&nbsp;</p>
            </div>       
            <form name="form1" method="post" action="AuctionController">
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
                <div class="message_common">					 
                    <div class="login_middle_common_profil">
                        <input type="hidden" id="no" name="no" value="<%=auction.getAuctionid()%>">
                        <table border="1"  cellpadding="20" id="viewInfoTable">                            
                            <tr>
                                <td>Title:</td>
                                <td><%=auction.getTitle()%></td>
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
                                <td>Category:</td>
                                <td>
                                    <select name="cb1" id="cb1">
                                        <option value="<%=category.getCategoryid()%>"><%=category.getName()%></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td >Description:</td>
                                <td><%=auction.getDescription()%></td>
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
                            <input type="hidden" id="no1" name="no1" value="<%=digital.getId()%>">
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
                                <td>Image:</td>
                                <td><img SRC="<%=digital.getImage1()%>" NAME="theImage" HEIGHT="320" WIDTH="420"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <table border="0" width="100%">
                                        <tr>
                                            <td>
                                                <div class="profil_butoon" style="width:auto;">
                                                    <div class="res_left"></div>
                                                    <div class="res_mid" style="width:auto;">
                                                        <a style="width:auto;">
                                                            <input type="button" value="&lt;&lt; Previous" name="previous" onClick="Backer()">
                                                        </a>
                                                    </div>
                                                    <div class="res_right"></div>
                                                </div>
                                            </td>
                                            <td>
                                                <span id="sp1"></span>
                                            </td>
                                            <td>
                                                <div class="profil_butoon" style="width:auto;">
                                                    <div class="res_left"></div>
                                                    <div class="res_mid" style="width:auto;">
                                                        <a style="width:auto;">
                                                            <input type="button" value="Next &gt;&gt;" name="next" onClick="Nexter()">
                                                        </a>
                                                    </div>
                                                    <div class="res_right"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                </td>

                            </tr>
                            <tr>
                                <td>Video:</td>
                                <td>
                                    <iframe width="530" height="315" src="//www.youtube.com/embed/<%=digital.getVideo()%>" frameborder="0" allowfullscreen></iframe>
                                </td>
                            </tr>
                            </tr>
                            <tr>
                                <td >Start date:</td>
                                <td><%=auction.getStart_date()%></td>
                            </tr>
                            <tr>
                                <td>End date:</td>
                                <td><%=auction.getEnd_date()%></td>
                            </tr>
                            <tr>
                                <td >Starting price:</td>
                                <td><%=auction.getStarting_price()%></td>
                            </tr>
                            <tr>
                                <td>Reserve price:</td>
                                <td><%=auction.getReserve_price()%></td>
                            </tr>
                            <tr>
                                <td>Buy now price:</td>
                                <td><%=auction.getBuy_now_price()%></td>
                            </tr>
                            <tr>
                                <td>Status:</td>
                                <td>
                                    <select name="cb2" id="cb2">
                                        <option value="<%=auction.getStatus()%>"><%=auction.getStatus()%></option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div class="no_img">
                            <div class="buton_green">
                                <div class="profil_butoon">
                                    <div class="res_left"></div>
                                    <div class="res_mid"><a title="Edit">
                                            <input type="button" value="Edit" name="Edit" onclick="window.location = 'AuctionController?service=editauction&auctionid=<%=auction.getAuctionid()%>&categoryid=<%=category.getCategoryid()%>';"></a>
                                    </div>                  
                                    <div class="res_right"></div>
                                </div>
                                <span></span>				
                                <div class="grand_total_btn_cp">
                                    <div class="save_left"></div>
                                    <div class="save_mid">
                                        <a title="Delete">
                                            <input type="submit" value="Delete" name="Delete" onclick="return confirm('Are you sure?');">  
                                            <input type="hidden" id="service" name="service" value="viewauctiondetail">
                                        </a>
                                    </div>
                                    <div class="save_right"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>