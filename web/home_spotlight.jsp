<%-- 
    Document   : home_spotlight
    Created on : Aug 8, 2014, 1:55:35 PM
    Author     : ducfpt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function startTime() {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                var suffix;
                if (h >= 12 && h < 24) {
                    suffix = "PM";
                } else {
                    suffix = "AM";
                }
                document.getElementById('hour').innerHTML = h;
                document.getElementById('min').innerHTML = m;
                document.getElementById('sec').innerHTML = s;
                document.getElementById('suffix').innerHTML = suffix;
                var t = setTimeout(function() {
                    startTime()
                }, 500);
            }

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i
                }
                ;  // add zero in front of numbers < 10
                return i;
            }
        </script>
    </head>
    <body onload="startTime()">
        <div class="banner_left_spotlight">           
            <div class="today_head_spotlight">               
                <div class="today_head_lft">
                    <!--<h2 title="TODAY  AUCTION">SPOTLIGHT</h2>-->
                </div>
                <!-- <div class="arrow_one_spotlight"></div>
                 <div class="today_head_rgt">
                     <p><a href="" title="View All">View All</a></p>
                 </div-->
            </div>

            <div class="feature_total">
                <div class="server_time"> 
                    <span class="server_bg"><img width="33" height="33" alt="img" src="images/time_bg.png"></span>
                    <div class="server_rgt">
                        <p>Server Time</p>
                        <ul>
                            <li><b class="server_time_hrs" id="hour"></b>
                                <label>Hours</label>
                            </li>
                            <li><b class="server_time_mins" id="min"></b>
                                <label>Min</label>
                            </li>
                            <li><b class="server_time_secs" id="sec"></b>
                                <label>Sec</label>
                            </li>
                            <li><b class="server_time_secs" id="suffix"></b>                               
                            </li>
                        </ul>
                    </div>
                </div>
                <!--<div id="auction_502" class="auction_item auction_item_content" name="" data-id="502">
                    <div class="auction_type" data-auctiontype="25"></div>
                    <div class="feature_box">
                        <div class="feature_lable"></div>

                        <div class="feature_lft">


                            <a href="" title="Monitor">
                                <img src="http://www.unieauction.com/platinum-demo/public/uploaded_files/products/thumb/538d4b832e453viewsonic-va2231wa-led-hd-black-led-22-monitor-slim-bezel-1.jpg" width="82" title="Monitor" height="83" alt="Monitor"></a></div>
                        <div class="feature_rgt">
                            <label><a href="" title="Monitor">

                                    Monitor
                                </a></label>
                            <ul style="width:130px;">  
                                <li>
                                    <b>Bid to beat: </b>
                                    <div style="color: rgb(238, 126, 63); font-weight: bold; display: block;" class="currentprice"><font class="">$</font> 50.00</div>
                                    <div style="color:#EE7E3F;font-weight:bold;" class="loader502"></div>

                                    <p><span style="display:none;">Price:</span></p><div class="price" style="display:none;">50.00</div><p></p>
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
                                        <p>  <a href="javascript:;" name="" class="bid" title="BID NOW" rel="" id="502" data-auctiontype="25">
                                                BID NOW                                        </a></p>
                                    </div>
                                    <div class="bidnow_rgt"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="notice_nsg fl clr" id="notice_msg502" style="display:none;"></div>
                </div>-->
            </div>
        </div>
    </body>
</html>
