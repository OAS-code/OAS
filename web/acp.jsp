<%-- 
    Document   : index
    Created on : Jul 6, 2014, 10:38:08 PM
    Author     : MrDuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Control Panel</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
    </head>
     
    <div class="banner_inner">
        <div class="login-part">
            <h2 title="ACP">Admin Control Panel</h2>
        </div>
    <div>
        
        <frameset rows="160,*,30" border="0">
            <frame src="top.jsp" name="top" scrolling="no">
            <frame src="home.jsp" name="mid" scrolling="no">
            <frame src="bottom.jsp" name="bottom" scrolling="yes">
        </frameset>
            
    <div class="banner_left">
        <div class="dash_tops">User Panel</div>
        <div class="dash_lsd user_panel_list">
          <ul>
            <li class="act_class" id="dashboard_active"><a href="http://www.unieauction.com/buy-sell-demo/users/" title="Dash Board">Dash Board</a></li>
			<li class="" id="edit_profile_active"><a href="http://www.unieauction.com/buy-sell-demo/users/user_settings" title="Edit Profile">Edit Profile</a></li>
			<li class="" id="my_message_active"><a href="http://www.unieauction.com/buy-sell-demo/users/my_message" title="My Messages">My Messages (2)</a></li>
			<li class="fl clr" id="change_password_active"><a href="http://www.unieauction.com/buy-sell-demo/users/change_password" title="Change Password">Change Password</a></li>

			<li class="fl clr" id="menu_purchas_active"><a href="http://www.unieauction.com/buy-sell-demo/packages/" title="Buy Packages">Buy Packages</a></li><li class="fl clr "><a href="http://www.unieauction.com/buy-sell-demo/site/buyerseller/myproducts" title="My Products" id="my_products_active">My Products</a></li>
			 
			 
			<li class="fl clr" id="my_watchlist_active"><a href="http://www.unieauction.com/buy-sell-demo/users/watchlist" title="My Watchlist">My Watchlist</a></li>
			<li class="fl clr" id="my_testimonials_active"><a href="http://www.unieauction.com/buy-sell-demo/users/mytestimonials_details" title="My Testimonials">My Testimonials</a></li>
			<li class="fl clr" id="my_addresses_active"><a href="http://www.unieauction.com/buy-sell-demo/users/myaddresses" title="My Addresses">My Addresses</a></li>
			<li class="fl clr" id="my_bids_active"><a href="http://www.unieauction.com/buy-sell-demo/users/mybids" title="My Bids">My Bids</a></li><li class="fl clr "><a href="http://www.unieauction.com/buy-sell-demo/site/highestunique/highest_mybids" title="Placed Highest bid product" id="highestactive">Placed Highest bid product</a></li><li class="fl clr "><a href="http://www.unieauction.com/buy-sell-demo/site/reserve/wonproducts" title="Reserve Won Products" id="reserveactive">Reserve Won Products</a></li><li class="fl clr "><a href="http://www.unieauction.com/buy-sell-demo/site/scratch/scratchlist" title="Scratch Won Products" id="scratchactive">Scratch Won Products</a></li><li class="fl clr "><a href="http://www.unieauction.com/buy-sell-demo/site/lowestunique/lowest_mybids" title="Placed Unique bid product" id="my_bids1_active">Placed Unique bid product</a></li>

			<li class="fl clr" id="my_transactions_active"><a href="http://www.unieauction.com/buy-sell-demo/users/mytransactions" title="My Transactions">My Transactions</a></li>
			<li id="autobid_active" class="fl clr"><a href="http://www.unieauction.com/buy-sell-demo/auctions/setautobid" title="Autobid" class="fl">Autobid</a></li><li class="fl clr "><a href="http://www.unieauction.com/buy-sell-demo/site/buyerseller/seller_transactions" title="Seller transactions" id="highestactive">Seller transactions</a></li><li class="fl clr "><a href="http://www.unieauction.com/buy-sell-demo/site/buyerseller/products_transactions" title="Buyer transactions" id="highestactive">Buyer transactions</a></li>

			<li class="fl clr" id="won_menu"><a href="http://www.unieauction.com/buy-sell-demo/users/won_auctions" title="Won Auction" id="won_auctions_active">Won Auction</a></li>
			<li class="fl clr" id="my_pending_active"><a href="http://www.unieauction.com/buy-sell-demo/users/friends_invite" title="Referrals / Invite">Referrals / Invite</a></li>
			
			
	<li class="fl clr" id="products_transactions_active"><a href="http://www.unieauction.com/buy-sell-demo/site/buynow/products_transactions" title="Buy-Now Transactions">Buy-Now Transactions</a></li>
			<li class="fl clr" id="addtocart_list_active"><a href="http://www.unieauction.com/buy-sell-demo/site/buynow/cart_list" title="Add To Carts">Add To Carts</a></li>
                        
          </ul>
        </div>
      </div>
            
            
            
            
            <!--
            
            <div class="box" style="width: 500px">
                <div class="heading-pro"><h2>Admin Control Panel<h2></div>
                <div class="box-content">
                    <div class="box-category">
                        <div id="register">
                                <div>
                                    <form>
                                        <button type="button" onclick="window.location = 'UserController?service=listall'">Manage User</button>
                                        <br>
                                        <button type="button" onclick="window.location = 'AuctionController?service=listall'">Manage Auction</button>
                                    </form>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            -->
        
    
</html>
