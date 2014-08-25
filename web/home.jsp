<%-- 
    Document   : home
    Created on : Jul 19, 2014, 10:37:29 PM
    Author     : Maxime
--%>

<%@page import="Entity.Auction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Auction System</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <%
            ArrayList<Auction> auctions = (ArrayList<Auction>) request.getAttribute("auctions");
        %>
        <script language="JavaScript" src="JavaScript/countdown.js"></script>
    </head>
    <body>  
        <!--
        <div class="my_message_right">
        -->

            <%
                for (int j = 0; j < auctionsArray.length; j++) {
                    ArrayList<Auction> subAuctions = auctionsArray[j];
                    String categoryName = subAuctions.get(0).getCategoryName();
            %>

            <div class="today_head">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                    <tr>
                        <td>
                            <div class="today_head_lft">
                                <h2 title="Camera"><%=categoryName%></h2>
                            </div>
                        </td>
                        <td>
                            <div class="arrow_one"></div>
                        </td>
                        <td>
                            <div class="today_head_rgt">
                                <p><a href="" title="View All">View All</a></p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="feature_total">

                <%
                    for (int i = 0; i < subAuctions.size(); i++) {
                %>
                <div id="auction_502" class="auction_item auction_item_content" data-id="502">
                    <div class="auction_type" data-auctiontype="25"></div>
                    <div class="feature_box">
                        <div class="feature_lable"></div>
                        <div class="feature_lft">                        
                            <a href="AuctionController?service=view&auctionId=<%=subAuctions.get(i).getId()%>" title="<%=subAuctions.get(i).getTitle()%>">
                                <img src="<%=subAuctions.get(i).getImgCover()%>" width="82" title="" height="83" alt="Monitor">
                            </a>                           
                        </div>
                        <div class="feature_rgt">
                            <label><a href="AuctionController?service=view&auctionId=<%=subAuctions.get(i).getId()%>" title="<%=subAuctions.get(i).getTitle()%>">
                                    <%=subAuctions.get(i).getTitle()%>
                                </a></label>
                            <ul style="width:130px;">  
                                <li>
                                    <b>Bid to beat: </b><br>
                                    <div style="color: rgb(238, 126, 63); font-weight: bold; display: block;" class="currentprice"><font class=""></font><%=subAuctions.get(i).getBidToBeatString()%></div>
                                    <div style="color:#EE7E3F;font-weight:bold;" class="loader502"></div>

                                    <p></p>
                                </li>

                                <li>
                                    <b><span style="color:#000;">Buy now: <br><span><font class=""></font><%=subAuctions.get(i).getBuynowPriceString()%></span></span></b>

                                    <div class="bid_price fl clr" style="display:none;"><p class="fl clr">Bid increment: <font class="">$</font> 2</p></div>
                                </li>
                            </ul>
                            <p class="countdown" style="display: block;">
                                
                                <script>
                                    startCountdown('<%=subAuctions.get(i).getFormattedEndDate(1)%>', <%=subAuctions.get(i).getId()%>, "countdown_auction_home");
                                </script>
                            </p>
                        </div>
                        <div class="feature_bott">
                            <div class="feature_bott_lft">
                                <div class="sliders">    


                                </div>
                                <a title="+ Add to Watchlist" rel="502" class="addwatchlist"><img src="images/plus_bg.png" width="24" height="25" alt="+ Add to Watchlist"></a>
                            </div>
                            <div class="feature_bott_rgt" style="margin:0 10px 0 0;">
                                <div class="bidme_link">
                                    <div class="bidnow_lft"></div>
                                    <div class="bidnow_mid">
                                        <p>  <a href="AuctionController?service=view&auctionId=<%=subAuctions.get(i).getId()%>" class="bid" title="BID NOW" rel="" id="502" data-auctiontype="25">
                                                BID NOW                                        </a></p>
                                    </div>
                                    <div class="bidnow_rgt"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="notice_nsg fl clr" id="notice_msg502" style="display:none;"></div>
                </div>
                <% } %>
                    </div>
                    
                    <% }%>
            
        <!--
        </div>
        -->
</body>
</html>
