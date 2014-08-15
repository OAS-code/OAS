<%-- 
    Document   : cp_detail_bidding_home
    Created on : Aug 15, 2014, 10:31:33 AM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
    </head>
    <body>
        <div class="header2"> 
        <div class="detail_page_top">  
            <h1 class="detail_title">Container ship</h1>
            <div class="detail_page_top_left">

                <div id="slide_container">	
                    <div id="slide_content">	
                        <div id="slider" style="width: 353px; height: 297px; overflow: hidden;">
                            <ul style="width: 353px; margin-left: 0px;">			
                                <li style="float: left;"><a title="Container ship" href="#"> <img width="353" height="297" alt="1" src="http://www.unieauction.com/platinum-demo/public/uploaded_files/products/thumb2/53ec8b18638cbflying_cargoship.jpg"></a></li>

                            </ul>
                        </div><p id="controls"> <span id="prevBtn"><a href="javascript:void(0);">Previous</a></span> <span id="nextBtn"><a href="javascript:void(0);">Next</a></span></p>
                    </div>

                </div>
                <div class="detail_left_feature_tag">            
                </div>
                <div class="reserve_product" title="Reserve auction"> </div>           
                <div style="display:none;" class="productDetail">645</div>  

                <div class="detail_feature_bott_lft">
                    <div class="sliders">
                        <div class="reserve_white" title="Reserve auction"></div>

                    </div>
                    <a name="http://www.unieauction.com/platinum-demo/auctions/addwatchlist" class="addwatchlist" rel="645" title="+ Add to Watchlist"><img width="24" height="25" alt="+ Add to Watchlist" src="http://www.unieauction.com/platinum-demo/public/white/images/plus_bg.png"></a>
                </div>

            </div>
            <div class="detail_page_top_mid">

                <div class="detail_big_history"><h1>Bid Histories</h1>  </div>

                <!--Bid history-->
                <div name="334" rel="0" style="float:left; width:250px;" id="" class="bid_history"> 
                    <link type="text/css" rel="stylesheet" href="css/slider.css">
                    <div class="detail_big_history_content"><p>0 Bids Total</p>  </div>

                    <div class="detail_big_history_current_winning"><h1>Current winning Bidders</h1> </div>        
                    <div class="winning_list"> 
                        <ul>
                            <li> <p class="no_data">No Bids Yet</p> </li>
                        </ul>
                    </div>
                </div>
                <!--End of bid history--> 

            </div>
            <div class="detail_page_top_right">

                <div class="hb_bg_mid">
                    <ul class="clearfix">

                        <li>
                            <h3 class="countdown" style="display: block;">10:20:48:21</h3>
                            <label style=" float:left;padding-left:72px;display:block;color:#666;">
                                <span class="hrs">Days</span>
                                <span class="hrs">Hrs</span>
                                <span class="min">Min</span>
                                <span class="sec">Sec</span>
                            </label>

                        </li>                               	
                        <li>
                            <div class="hb_buy_now_left">
                                <h3 class="currentprice" style="display: block;"><font class="">$</font> 100.00</h3>
                                <span style="display:none;" class="price">100.00</span>
                            </div>
                            <div class="hb_buy_now_right">
                                <div class="hb_buy_now_button">
                                    <div class="hb_buy_now_button_left"></div>
                                    <div class="hb_buy_now_button_mid">
                                        <p><a title="Buy Now" href="">Buy Now</a></p>
                                    </div>
                                    <div class="hb_buy_now_button_right"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            Enter more than current amount					
                            <div class="hb_buy_now_left">
                                <div class="hb_place_bid">

                                    <span><font class="">$</font>&nbsp;</span>
                                    <div class="hb_place_bid_tb">
                                        <form id="reserve_form" method="post">
                                            <div class=""><input type="text" value="" maxlength="10" class="savetext" id="yourbidding" name="bidamount" style="border: 1px solid rgb(204, 204, 204);"><input type="hidden" value="&lt;font class=''&gt;$&lt;/font&gt;" class="savetext" id="currency"><p style="font: normal 11px arial;"></p></div>
                                        </form>

                                    </div>
                                    <span>&nbsp;.00</span>
                                </div>
                            </div>
                            <div class="hb_buy_now_right">
                                <div class="hb_place_bid_button">
                                    <div class="hb_place_bid_button_left">
                                    </div>
                                    <div class="hb_place_bid_button_mid">
                                        <p><a data-rel="box" id="dialog_link" class="fl popup" rel="" title="BID ME" href="">BID ME</a></p>
                                    </div>
                                    <div class="hb_place_bid_button_right">
                                    </div>
                                </div>
                            </div>

                        </li>

                    </ul>
                    <div class="increment_block">
                        <a onclick="document.getElementById('fade1').style.display = 'block';
                                document.getElementById('box1').style.display = 'block';" title="Bid Increment" class="popup increment" href="javascript:;">Bid Increment</a>
                        <div id="fade1"></div>
                        <div id="box1" class="popupbox2">
                            <div>
                                <div class="popup_inner">
                                    <div class="popup_content">
                                        <div class="pop_tl">
                                            <div class="pop_tr">
                                                <div class="pop_tm">
                                                    <h2>Bid Increment</h2>
                                                    <a onclick="document.getElementById('box1').style.display = 'none';
                                                        document.getElementById('fade1').style.display = 'none'" class="re_close" title="close" href="javascript:;">Close X</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="popup_content_middle">
                                            <ul class="increment_list">
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><b>Price Range</b></p>
                                                        <p class="re_bid"><b>Increment price </b></p>
                                                    </div>   
                                                </li> 
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>0.01 - <font class="">$</font>0.99</p>
                                                        <p class="re_bid"><font class="">$</font>0.01</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>0.00 - <font class="">$</font>4.99</p>
                                                        <p class="re_bid"><font class="">$</font>0.25</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>5.00 - <font class="">$</font>24.99</p>
                                                        <p class="re_bid"><font class="">$</font>0.50</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>25.00 - <font class="">$</font>99.99</p>
                                                        <p class="re_bid"><font class="">$</font>2.00</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>100.00 - <font class="">$</font>249.99</p>
                                                        <p class="re_bid"><font class="">$</font>2.50</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>250.00 - <font class="">$</font>499.99</p>
                                                        <p class="re_bid"><font class="">$</font>5.00</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>500.00 - <font class="">$</font>999.00</p>
                                                        <p class="re_bid"><font class="">$</font>100.00</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>1000.00 - <font class="">$</font>2499.99</p>
                                                        <p class="re_bid"><font class="">$</font>25.00</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>2500.00 - <font class="">$</font>4999.99</p>
                                                        <p class="re_bid"><font class="">$</font>50.00</p>
                                                    </div> 
                                                </li>
                                                <li>
                                                    <div class="clearfix">
                                                        <p class="re_price"><font class="">$</font>5000.00 - <font class="">$</font>0.00</p>
                                                        <p class="re_bid"><font class="">$</font>100.00</p>
                                                    </div> 
                                                </li>

                                            </ul>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="reserve_how"> <a class="increment" title="How It Works" href="http://www.unieauction.com/platinum-demo/cmspage/page/how-it-works">How It Works</a></div>         
                    </div>
                </div>
            </div>
            <div style="display: none;" id="notice_msg645" class="notice_nsg2 fl clr">Entered amount is less than / Equal to the current price. Please enter the correct amount.</div> 
            <div class="detail_bottom_outer">

                <div class="detail_bottom_outer_top">
                    <div class="detail-action_detail">  

                        <h1>Auctions Details</h1>

                        <div class="detail-action_detail_lef"> 
                            <h2>Auction ID :  </h2>
                            <h2>Auction type(s) :</h2>
                        </div>     
                        <div class="detail-action_detail_rgt">
                            <p>645  </p>
                            <p>Reserve</p>

                        </div>     
                    </div>     
                    <div class="detail-action_detail">  

                        <h1>Price Details</h1>

                        <div class="detail-action_detail_lef"> 

                            <h2> Price Starting From :</h2>
                            <h2>Start time :</h2>
                            <h2>End time :</h2>     
                        </div>

                        <div class="detail-action_detail_rgt">
                            <p><font class="">$</font> 100  </p>
                            <p>Aug 14, 12:52 PM</p>
                            <p>Sep 30, 03:52 PM </p>     
                        </div>     
                    </div>

                    <div class="detail-action_detail detail_last-bgnone">  

                        <h1>Shipping Details</h1>

                        <div class="detail-action_detail_lef"> 

                            <h2>Shipping Fee :</h2>
                            <h2>Shipping information :</h2>


                        </div>

                        <div class="detail-action_detail_rgt">
                            <p><font class="">$</font> 20  </p>
                            <p></p>

                        </div>
                    </div>
                </div>

                <div class="detail_product_description">
                    <h1>Product Description</h1>

                    <p>sadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sadsadsadsad sadasdsad sad sad sadsadsadsad sad</p>    
                </div>        
            </div>
            <!--detail end-->
        </div>
    </div>
    </body>
</html>
