
<%@page import="Entity.Auction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <title>Car- Detail</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" 
    src="JavaScript/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" 
    src="JavaScript/slides.min.jquery.js"></script>
    <%                    Auction auction = (Auction) request.getAttribute("auction");
    %>
</head>
<body>

    <!-- header start--> 
    <link href="css/slider.css" rel="stylesheet" type="text/css" />
</div>

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
                                        <% if (auction.getImgCover() != null && !auction.getImgCover().isEmpty()) {%>
                                        <li>
                                            <a href="#" title="<%=auction.getTitle()%>"> 
                                                <img src="<%=auction.getImgCover()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                            </a>
                                        </li>
                                        <% }%>

                                        <% if (auction.getImg1() != null && !auction.getImg1().isEmpty()) {%>
                                        <li>
                                            <a href="#" title="<%=auction.getTitle()%>"> 
                                                <img src="<%=auction.getImg1()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                            </a>
                                        </li>
                                        <% }%>

                                        <% if (auction.getImg2() != null && !auction.getImg2().isEmpty()) {%>
                                        <li>
                                            <a href="#" title="<%=auction.getTitle()%>"> 
                                                <img src="<%=auction.getImg2()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                            </a>
                                        </li>
                                        <% }%>

                                        <% if (auction.getImg3() != null && !auction.getImg3().isEmpty()) {%>
                                        <li>
                                            <a href="#" title="<%=auction.getTitle()%>"> 
                                                <img src="<%=auction.getImg3()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                            </a>
                                        </li>
                                        <% }%>

                                        <% if (auction.getImg4() != null && !auction.getImg4().isEmpty()) {%>
                                        <li>
                                            <a href="#" title="<%=auction.getTitle()%>"> 
                                                <img src="<%=auction.getImg4()%>" width="353" height="297" alt="<%=auction.getTitle()%>" />
                                            </a>
                                        </li>
                                        <% }%>

                                        <% if (auction.getImg5() != null && !auction.getImg5().isEmpty()) {%>
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

                        <div class="bid_history" id="http://www.unieauction.com/buy-sell-demo/auctions/bid_history/279" style="" rel="0"  name=""><img src="http://www.unieauction.com/buy-sell-demo/public/white/images/ajax-loader.gif"/></div>

                    </div>
                    <div class="detail_page_top_right">

                        <div class="hb_bg_mid">
                            <ul class="clearfix" style="padding-left: 7px">
                                <li><p><span>Highest Bidder :</span> <strong class="lastbidder">No Bids Yet</strong></p></li>	
                                <li>
                                    <h3 class="countdown">
                                        <script language="JavaScript">
                                            TargetDate = "08/19/2014 04:09 PM ";
                                            CountActive = true;
                                            CountStepper = -1;
                                            LeadingZero = true;
                                            DisplayFormat = "%%D%%:%%H%%:%%M%%:%%S%%";
                                            FinishMessage = "Auction Closed";
                                        </script>
                                        <script language="JavaScript" src="JavaScript/countdown.js"></script>
                                    </h3>
                                    <label style=" float:left;padding-left:72px;display:block;color:#666;"><span class="hrs">Days</span><span class="min">Hrs</span><span class="min">Min</span><span class="sec">Sec</span></label>

                                </li>

                                <li>
                                    <div class="hb_buy_now_left">
                                        <h3 class="currentprice" > <%=auction.getBuynowPriceString()%></h3> 
                                        <span class="price" style="display:none;"></span>
                                    </div>

                                    <div class="hb_buy_now_right">
                                        <div class="hb_buy_now_button">
                                            <div class="hb_buy_now_button_left">
                                            </div>
                                            <div class="hb_buy_now_button_mid">
                                                <p>
                                                    <a href="http://www.unieauction.com/buy-sell-demo/site/buynow/buynow_addcart/279" title="Buy Now">Buy Now</a>

                                                </p>
                                            </div>
                                            <div class="hb_buy_now_button_right">
                                            </div>
                                        </div>
                                    </div>

                                </li>
                                <li>
                                    <div class="bidme_link">
                                        <div class="hb_buy_now_left">

                                        </div>
                                        <div class="hb_buy_now_right">
                                            <div class="hb_place_bid_button">
                                                <div class="hb_place_bid_button_left">
                                                </div>
                                                <div class="hb_place_bid_button_mid">

                                                    <p>                           <a href="javascript:;" name="http://www.unieauction.com/buy-sell-demo/auctions/bid" class="bid" rel="http://www.unieauction.com/buy-sell-demo/users/login/" id="279" data-auctiontype="30" title="Place My Bid">Place My Bid</a>					</p>			
                                                </div>
                                                <div class="hb_place_bid_button_right">
                                                </div>
                                            </div>
                                        </div>
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
                                        <span class="hb_font_size_small"><p  class="bidamount"><font class=''>$</font> 4.00</p></span>
                                    </div>

                                </li>
                                <!--
                                <li class="hb_li_padding_bottom_none">
                                    <div class="hb_buy_now_left">
                                        <p class="hb_font_weight_normal">Retail Price</p>
                                    </div>
                                    <div class="hb_buy_now_right hb_buy_now_right1">
                                        <p class="hb_font_size_small"><font class=''>$</font> 500.00</p>
                                    </div>

                                </li>
                                
                                <li class="hb_li_padding_bottom_none">
                                    <div class="hb_buy_now_left">
                                        <p class="hb_font_weight_normal">Price Paid</p>
                                    </div>
                                    <div class="hb_buy_now_right hb_buy_now_right1">
                                        <span class="hb_font_size_small"><p   class="pricepaid"> <font class=''>$</font> 50.00</p></span>
                                    </div>

                                </li>
                                <li class="border_none">
                                    <p class="save_over_text" style="padding-left:0px;">Save over <span   class="saveover">
                                            <font class=''>$</font> 450.00                                    </span></p>
                                    <p class="hb_font_weight_normal"  style="padding-left:0px;"><b>from the normal retail price!!</b></p>
                                </li>	
                                -->
                            </ul>
                        </div>


                    </div>
                </div>

            </div>
            <div class="notice_nsg2 fl clr" id="notice_msg279" style="display:none;"></div> 
            <div class="detail_bottom_outer">

                <div class="detail_bottom_outer_top">
                    <div class="detail-action_detail">  

                        <h1>Auctions Details</h1>

                        <div class="detail-action_detail_lef"> 
                            <h2>Auction ID :  </h2>

                        </div>

                        <div class="detail-action_detail_rgt">
                            <p>#<%=auction.getId()%>  </p>


                        </div>

                    </div>

                    <div class="detail-action_detail">  

                        <h1>Price Details</h1>

                        <div class="detail-action_detail_lef"> 

                            <h2> Price Starting From :</h2>
                            <h2> Buy now at :</h2>
                            <h2>Start time :</h2>
                            <h2>End time :</h2>
                        </div>

                        <div class="detail-action_detail_rgt">
                            <p><%=auction.getStartPriceString()%>  </p>
                            <p><%=auction.getBuynowPriceString()%></p>
                            <p><%=auction.getFormattedStartDate()%> </p>
                            <p><%=auction.getFormattedEndDate()%> </p>
                        </div>

                    </div>

                    <div class="detail-action_detail detail_last-bgnone">  

                        <h1>Shipping Details</h1>


                        <div class="detail-action_detail_lef"> 
                            <!--<h2>Shipping Fee :</h2>
                            <h2>Shipping information :</h2>-->
                            Not available.
                        </div>
                        <!--
                                                <div class="detail-action_detail_rgt">
                                                    <p><font class=''>$</font> 20  </p>
                                                    <p></p>
                        
                                                </div>
                        -->
                    </div>
                </div>
                <div class="detail_product_description">
                    <h1>Product Description</h1>

                    <p><%=auction.getDescription()%></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
