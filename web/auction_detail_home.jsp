<html>
    <%@page import="Entity.Auction"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <head>
        <title>Car- Detail</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="JavaScript/jquery-1.5.1.min.js"></script>
        <script type="text/javascript" src="JavaScript/slides.min.jquery.js"></script>
        <script type="text/javascript" src="JavaScript/ajax_auction_detail.js"></script>
        <script language="JavaScript" src="JavaScript/countdown_details.js"></script>
        <%                    Auction auction = (Auction) request.getAttribute("auction");
        %>
    </head>
    <body>

        <!-- header start--> 
        <link href="css/slider.css" rel="stylesheet" type="text/css" />


        <div class="banner_inner">


            <link href="css/slider.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="JavaScript/easy_jquery.js"></script>
            <script type="text/javascript" src="JavaScript/easySlider1.5.js"></script>
            <script type="text/javascript">
                $.noConflict();
                jQuery(document).ready(function(j) {
                    j(document).ready(function() {
                        j("#slider").easySlider({
                            controlsBefore: '<p id="controls">',
                            controlsAfter: '</p>',
                            auto: true,
                            continuous: true
                        });
                    });
                });</script>
            <div class="container_inner element279">
                <div class="auction_item" id="auction_279" name="">
                    <div class="auction_type" data-auctiontype="30"></div>
                    <div class="banner_inner" id="detail_page">
                        <!--detail page start-->

                        <div class="detail_page_top">  

                            <h1 class="detail_title"><%=auction.getTitle()%></h1>
                            <div class="detail_page_top_left">

                                <!---slide_show-->
                                <div id="slide_container">


                                    <div id="slide_content">

                                        <div id="slider">
                                            <ul>							
                                                <% if (auction.getImgCover() != null && !auction.getImgCover().isEmpty() && auction.getImgCover().length()>0) {%>
                                                <li>
                                                    <a href="#" title="<%=auction.getTitle()%>"> 
                                                        <img src="<%=auction.getImgCover()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                                    </a>
                                                </li>
                                                <% }%>

                                                <% if (auction.getImg1() != null && !auction.getImg1().isEmpty()&& auction.getImg1().length()>0) {%>
                                                <li>
                                                    <a href="#" title="<%=auction.getTitle()%>"> 
                                                        <img src="<%=auction.getImg1()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                                    </a>
                                                </li>
                                                <% }%>

                                                <% if (auction.getImg2() != null && !auction.getImg2().isEmpty()&& auction.getImg2().length()>0) {%>
                                                <li>
                                                    <a href="#" title="<%=auction.getTitle()%>"> 
                                                        <img src="<%=auction.getImg2()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                                    </a>
                                                </li>
                                                <% }%>

                                                <% if (auction.getImg3() != null && !auction.getImg3().isEmpty() && auction.getImg3().length()>0) {%>
                                                <li>
                                                    <a href="#" title="<%=auction.getTitle()%>"> 
                                                        <img src="<%=auction.getImg3()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                                    </a>
                                                </li>
                                                <% }%>

                                                <% if (auction.getImg4() != null && !auction.getImg4().isEmpty() && auction.getImg4().length()>0) {%>
                                                <li>
                                                    <a href="#" title="<%=auction.getTitle()%>"> 
                                                        <img src="<%=auction.getImg4()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                                    </a>
                                                </li>
                                                <% }%>

                                                <% if (auction.getImg5() != null && !auction.getImg5().isEmpty() && auction.getImg5().length()>0) {%>
                                                <li>
                                                    <a href="#" title="<%=auction.getTitle()%>"> 
                                                        <img src="<%=auction.getImg5()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                                    </a>
                                                </li>
                                                <% }%>
                                            </ul>

                                        </div>

                                    </div>
                                </div>
                                <!--slide_show-->
                                <div class="detail_left_feature_tag">

                                </div>
                                <div class="productDetail" style="display:none;">279</div>  

                                <div class="detail_feature_bott_lft" style="padding-top: 2px">
                                    <div class="sliders">
                                        <!--<span class="penny_white"></span>-->

                                    </div>
                                    <a title="+ Add to Watchlist" rel="279" class="addwatchlist" name="http://www.unieauction.com/buy-sell-demo/auctions/addwatchlist"><img src="http://www.unieauction.com/buy-sell-demo/public/white/images/plus_bg.png" width="24" height="25" alt="+ Add to Watchlist" /></a>
                                </div>
                                <!--
                                                        <div class="detail_left_social_link">
                                                            <div class="social_sec">
                                                                <p>Share :</p>
                                                                <g:plusone size="medium" annotation="none"></g:plusone>
                                
                                                            </div>
                                                        </div>
                                -->
                            </div>
                            <div class="detail_page_top_mid">
                                <div class="detail_big_history"><h1>Bid Histories</h1>  </div>
                                <div class="bid_history" id="" style="float:left; width:250px;" rel="1" name=""> <link href="css/slider.css" rel="stylesheet" type="text/css">
                                        <div class="detail_big_history_content"><p>1 Bids Total</p>  </div>

                                        <div class="detail_big_history_current_winning"><h1>Current winning Bidders</h1> </div>        
                                        <div class="winning_list"> 
                                            <ul>
                                                <li> <div class="winning_list_left"><h1>n**am</h1> <p>2014-08-17 18:06:29</p>  </div> <div class="winning_list_right"><p><font class="">$</font> 50.01</p>  </div>  </li>
                                                <div> <a class="detail_winner_down_list" title="Arrow" href="">  </a>  </div>
                                            </ul>
                                        </div>
                                </div> 
                            </div>
                            <div class="detail_page_top_right">

                                <div class="hb_bg_mid">
                                    <ul class="clearfix" style="padding-left: 7px">
                                        <li><p><span>Highest Bidder :</span> <strong class="lastbidder" id="ajax_load_top_bidder"><img src="images/ajax-loader.gif" align="center"></img></strong></p></li>	
                                        <li>
                                            <h3 class="countdown">
                                                <script>
                                                    document.write("<span id='ajax_load_countdown' style='background-color:#F7F7F7" +
                                                            "; color:black; border-bottom-color: rgb(52, 52, 52);border-bottom-style: none;border-bottom-width: 0px;border-image-outset: 0px;"
                                                            + "border-image-repeat: stretch;border-image-slice: 100%;border-image-source: none;border-image-width: 1;border-left-color: rgb(52, 52, 52);"
                                                            + "border-left-style: none;border-left-width: 0px;border-right-color: rgb(52, 52, 52);border-right-style: none;border-right-width: 0px;"
                                                            + "border-top-color: rgb(52, 52, 52);border-top-style: none;border-top-width: 0px;color: rgb(52, 52, 52);display: block;float: left;font-family: arial;"
                                                            + "font-size: 24px;font-style: normal;font-variant: normal;font-weight: bold;height: 24px;line-height: 24px;list-style-image: none;list-style-position: outside;"
                                                            + "list-style-type: none;margin-bottom: 0px;margin-left: 0px;margin-right: 0px;margin-top: 0px;outline-color: rgb(52, 52, 52);outline-style: none;outline-width: 0px;"
                                                            + "padding-bottom: 0px;padding-left: 0px;padding-right: 0px;padding-top: 0px;text-align: center;width: 271px;zoom: 1;'><img src='images/ajax-loader.gif' align='center'></img></span>");
                                                </script>
                                            </h3>
                                            <label style=" float:left;padding-left:72px;display:block;color:#666;"><span class="hrs">Days</span><span class="min">Hrs</span><span class="min">Min</span><span class="sec">Sec</span></label>

                                        </li>

                                        <li>
                                            <div class="hb_buy_now_left" id="ajax_load_current_bid">
                                                <h3 class="currentprice" >Current bid: <img src='images/ajax-loader.gif' align='center'></img></h3> 
                                            </div>
                                        </li>

                                        <li>
                                            <div id="ajax_place_bid_area"> 
                                                <center><img src="images/ajax-loader.gif" align="center"></img></center>
                                            </div>
                                        </li>


                                        <li class="border_none">
                                            <div class="hb_auction_header">
                                                <p>With each bid, the auction will..</p>
                                            </div>
                                        </li>
                                        <li class="hb_li_padding_bottom_none">
                                            <div class="hb_buy_now_left">
                                                <p class="hb_font_weight_normal">Price Increases by</p>
                                            </div>
                                            <div class="hb_buy_now_right hb_buy_now_right1">
                                                <span class="hb_font_size_small"><p  class="bidamount"><%=auction.getIncreaseByString()%></p></span>
                                            </div>

                                        </li>

                                        <li class="hb_li_padding_bottom_none">
                                            <div class="hb_buy_now_left">
                                                <p class="hb_font_weight_normal">&nbsp;</p>
                                            </div>
                                            <div class="hb_buy_now_right hb_buy_now_right1">
                                                <span class="hb_font_size_small"><p  class="bidamount">&nbsp;</p></span>
                                            </div>

                                        </li>
                                        <li>
                                            <div class="hb_buy_now_left">
                                                <h3 class="currentprice" > </h3> 
                                                <span class="price" style="display:none;"></span>
                                            </div>

                                            <div class="hb_buy_now_right">
                                                <div class="hb_buy_now_button">
                                                    <div class="hb_buy_now_button_left">
                                                    </div>
                                                    <div class="hb_buy_now_button_mid">
                                                        <p>
                                                            <a href="" title="Buy Now">Buy Now at <%=auction.getBuynowPriceString()%></a>
                                                        </p>
                                                    </div>
                                                    <div class="hb_buy_now_button_right">
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>


                            </div>
                        </div>

                    </div>
                    <div class="notice_nsg2 fl clr" id="notice_msg279" style="display:none;"></div> 
                    <div class="detail_bottom_outer">
                        <div class="detail_bottom_outer_top">
                            <div class="detail-action_detail">  
                                <h1>Auction Details</h1>
                                <div class="detail-action_detail_lef"> 
                                    <h2>Auction ID :  </h2>
                                </div>
                                <div class="detail-action_detail_rgt">
                                    <p>#<%=auction.getId()%>  </p>
                                </div>
                                <div class="detail-action_detail_lef"> 
                                    <h2>Auction Status :  </h2>
                                </div>
                                <div class="detail-action_detail_rgt">
                                    <p><%=auction.getStatus()%></p>
                                </div>
                                <div class="detail-action_detail_lef"> 
                                    <h2>Auction's owner :  </h2>
                                </div>
                                <div class="detail-action_detail_rgt">
                                    <p><%=auction.getSellerName()%></p>
                                </div>
                            </div>
                            <div class="detail-action_detail">  
                                <h1>Price Details</h1>
                                <div class="detail-action_detail_lef"> 
                                    <h2> Price Starting From :</h2>
                                    <h2> Bidding step: </h2>
                                    <h2> Reserved price :</h2>
                                </div>
                                <div class="detail-action_detail_rgt">
                                    <p><%=auction.getStartPriceString()%>  </p>
                                    <p><%=auction.getIncreaseByString()%></p>
                                    <p><%=auction.getBuynowPriceString()%></p>
                                </div>
                            </div>
                            <div class="detail-action_detail detail_last-bgnone">  
                                <h1>Timing Details</h1>
                                <div class="detail-action_detail_lef"> 
                                    <h2>Start time :</h2>
                                    <h2>End time :</h2>
                                </div>
                                <div class="detail-action_detail_rgt">
                                    <p><%=auction.getFormattedStartDate()%> </p>
                                    <p><%=auction.getFormattedEndDate()%> </p>
                                </div>
                            </div>
                        </div>
                        <div class="detail_product_description">
                            <h1>Product Description</h1>
                            <% if (!auction.getvYoutube().isEmpty()) {%>
                            <p><iframe width="530" height="315" src="//www.youtube.com/embed/<%=auction.getvYoutube()%>" frameborder="0" allowfullscreen></iframe></p>
                            <% }%>
                            <p><%=auction.getDescription()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        //ajax_place_bid_area('<%=auction.getId()%>');
        //ajax_load_top_bidder('<%=auction.getId()%>');
        //ajax_load_current_bid('<%=auction.getId()%>');
        //ajax_load_countdown(<%=auction.getId()%>);
        window.setInterval(function() {
            var obj = document.getElementById("yourbidding");
            var obj2 = document.getElementById("placebid_btn");
            if (document.activeElement === obj || document.activeElement === obj2) {
                //do nothing
            } else {
                ajax_place_bid_area('<%=auction.getId()%>');
            }
            ajax_load_top_bidder('<%=auction.getId()%>');
            ajax_load_current_bid('<%=auction.getId()%>');
            ajax_load_countdown(<%=auction.getId()%>);
        }, 3000);
        

    </script>
</html>
