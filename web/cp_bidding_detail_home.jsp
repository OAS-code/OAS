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
                    <a name="" class="addwatchlist" rel="645" title="+ Add to Watchlist"><img width="24" height="25" alt="+ Add to Watchlist" src="images/plus_bg.png"></a>
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
                            <li> <p class="no_data">No Bid Yet</p> </li>
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
                                            <div class="fl"><input type="text" value="" maxlength="10" class="savetext" id="yourbidding" name="bidamount" style="border: 1px solid rgb(204, 204, 204);">
                                                <input type="hidden" value="&lt;font class=''&gt;$&lt;/font&gt;" class="savetext" id="currency">
                                                <p style="font: normal 11px arial;"></p>
                                            </div>
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
                        <div id="fade1"></div>
                        <div id="box1" class="popupbox2">
                            <div>
                                <div class="popup_inner">
                                    <div class="popup_content">
                                        <div class="pop_tl">
                                            <div class="pop_tr">
                                                
                                            </div>
                                        </div>
                                        <div class="popup_content_middle">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
            <div style="display: none;" id="notice_msg645" class="notice_nsg2 fl clr">Entered amount is less than / Equal to the current price. Please enter the correct amount.</div> 
            <div class="detail_bottom_outer">

                <div class="detail_bottom_outer_top">
                    <div class="detail-action_detail">  

                        <h1>Auctions Details</h1>

                        <div class="detail-action_detail_lef"> 
                            <h2>Start time : </h2>
                            <h2>End time :</h2>
                        </div>     
                        <div class="detail-action_detail_rgt">
                            <p>Aug 14, 12:52 PM</p>
                            <p>Sep 30, 03:52 PM</p>   

                        </div>     
                    </div>     
                    <div class="detail-action_detail">  

                        <h1>Price Details</h1>

                        <div class="detail-action_detail_lef"> 

                            <h2> Price Starting From :</h2>   
                        </div>

                        <div class="detail-action_detail_rgt">
                            <p><font class="">$</font> 100  </p>                              
                        </div>     
                    </div>

                    <div class="detail-action_detail detail_last-bgnone">  

                        <h1>Shipping Details</h1>

                        <div class="detail-action_detail_lef"> 

                            <h2>Shipping Fee :</h2>
                            <h2>Shipping information :</h2>


                        </div>

                        <div class="detail-action_detail_rgt">
                            <p><font class=""></font></p>
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
