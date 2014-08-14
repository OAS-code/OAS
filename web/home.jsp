<%-- 
    Document   : home
    Created on : Jul 19, 2014, 10:37:29 PM
    Author     : Maxime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Auction System</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />

    </head>
    <body>  
        <div class="my_message_right">

            <div class="today_head">
                <div class="today_head_lft">
                    <h2 title="TODAY  AUCTION">Today  Auction</h2>
                </div>
                <div class="arrow_one"></div>
                <div class="today_head_rgt">
                    <p><a href="" title="View All">View All</a></p>
                </div>
            </div>

            <div class="feature_total">
                <%
                    for(int i=0;i<arr.size();i++){  
                %>
                <div id="auction_502" class="auction_item auction_item_content" name="" data-id="502">
                    <div class="auction_type" data-auctiontype="25"></div>
                    <div class="feature_box">
                        <div class="feature_lable"></div>

                        <div class="feature_lft">                        
                                <a href="" title="Monitor">
                                    <img src="<%=arr.get(i).getImage1()%>" width="82" title="Monitor" height="83" alt="Monitor">
                                </a>                           
                        </div>
                        <div class="feature_rgt">
                            <label><a href="" title="Monitor">
                                    <%=arr.get(i).getTitle()%>
                                </a></label>
                            <ul style="width:130px;">  
                                <li>
                                    <b>Bid to beat: </b>
                                    <div style="color: rgb(238, 126, 63); font-weight: bold; display: block;" class="currentprice"><font class="">$</font><%=arr.get(i).getStarting_price()%></div>
                                    <div style="color:#EE7E3F;font-weight:bold;" class="loader502"></div>

                                    <p><span style="display:none;">Price:</span></p><div class="price" style="display:none;"><%=arr.get(i).getStarting_price()%></div><p></p>
                                </li>

                                <li>
                                    <b><span style="color:#000;">Bid : <span><font class="">$</font> 2</span></span></b>

                                    <div class="bid_price fl clr" style="display:none;"><p class="fl clr">Bid: <font class="">$</font> 2</p></div>
                                </li>
                            </ul>
                            <p class="countdown" style="display: block;">4:08:46:43</p>
                        </div>
                        <div class="feature_bott">
                            <div class="feature_bott_lft">
                                <div class="sliders">    
                                    <a><img src="http://www.unieauction.com/platinum-demo/public/white/images/head_top1_bg.png" width="18" height="18" alt="Beginner" title="Beginner"></a>

                                </div>
                                <a title="+ Add to Watchlist" rel="502" class="addwatchlist" name=""><img src="http://www.unieauction.com/platinum-demo/public/white/images/plus_bg.png" width="24" height="25" alt="+ Add to Watchlist"></a>
                            </div>
                            <div class="feature_bott_rgt" style="margin:0 10px 0 0;">
                                <div class="bidme_link">
                                    <div class="bidnow_lft"></div>
                                    <div class="bidnow_mid">
                                        <p>  <a href="AuctionController?service=bidnow" name="" class="bid" title="BID NOW" rel="" id="502" data-auctiontype="25">
                                                BID NOW                                        </a></p>
                                    </div>
                                    <div class="bidnow_rgt"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="notice_nsg fl clr" id="notice_msg502" style="display:none;"></div>
                </div>
                <%}%>
            </div>




            <div class="today_head">
                <div class="today_head_lft">
                    <h2 title="FUTURE AUCTION">FUTURE AUCTION</h2>
                </div>
                <div class="arrow_one"></div>
                <div class="today_head_rgt">
                    <p><a href="" title="View All">View All</a></p>
                </div>
            </div>
            <div class="feature_total">
                <script type="text/javascript">
                    $(document).ready(function() {

                        item_len > 0 ? Auction.getauctionstatus(3) : "";
                    });
                </script>
                <div id="auction_603" class="auction_item auction_item_content" name="">
                    <div class="auction_type" data-auctiontype="25"></div>
                    <div class="feature_left_box"> <div class="auction_lft">

                            <a href="" title="Handbag" class="fl">
                                <img src="http://www.unieauction.com/platinum-demo/public/uploaded_files/products/thumb/53db17687c91adownload_(3).jpg" width="122" height="122" title="Handbag" alt="Handbag">
                            </a>
                        </div>
                        <div class="auction_rgt">
                            <label>  <a href="" title="Handbag">
                                    Handbag                        </a></label>
                            <ul>
                                <li> 
                                    <b>Bid to beat:  <span class="currentprice"><font class="">$</font> 50.00</span></b> 
                                </li>

                                <div class="loader603" style="display:none;"><img src="http://www.unieauction.com/platinum-demo/public/white/images/ajax-loader.gif"></div>

                                <li>  
                                    <b>Bid:<span>  <font class="">$</font> 4</span> </b>
                                </li>
                                <li><div class="futureday mt10">Start on Sep 30, 10:09 AM</div></li>
                            </ul>
                        </div>
                        <div class="auction_bott">

                            <div class="feature_bott_lft" style="width:346px;">
                                <div class="sliders">
                                    <a><img src="http://www.unieauction.com/platinum-demo/public/white/images/head_top1_bg.png" width="18" height="18" alt="Beginner" title="Beginner"></a> 

                                </div>
                                <a title="+ Add to Watchlist" rel="603" class="addwatchlist" name=""><img src="http://www.unieauction.com/platinum-demo/public/white/images/plus_bg.png" width="24" height="25" alt="+ Add to Watchlist"></a>

                                <div class="feature_bott_rgt">
                                    <div class="bidnow_lft"></div>
                                    <div class="bidnow_mid" style="width:89px;">
                                        <p class="countdown countdown_future fl clr">Coming Soon</p>
                                    </div>
                                    <div class="bidnow_rgt"></div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>


                <div class="clear"></div>
                <!--Pagination-->
                <div class="pagination">
                    <p></p>  
                </div>
                <!--End of Pagination-->
            </div>
        </div>
    </body>
</html>
