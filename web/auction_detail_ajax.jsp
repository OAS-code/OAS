<%-- 
    Document   : placebid
    Created on : Aug 20, 2014, 5:39:00 PM
    Author     : Duc
--%>

<%@page import="Entity.Auction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            int errorCode = 0;
            String errorCodeString = (String) request.getParameter("errorCode");
            if (errorCodeString != null) {
                errorCode = Integer.parseInt(errorCodeString);
            }
            String auctionIdString = (String) request.getParameter("auctionId");
            String userBidValue = (String) request.getParameter("userBidValue");
            String nextBidValue = (String) request.getParameter("nextBidValue");
            String data1 = (String) request.getParameter("data1");
            String data2 = (String) request.getParameter("data2");
            String data3 = (String) request.getParameter("data3");
            String data4 = (String) request.getParameter("data4");
            String data5 = (String) request.getParameter("data5");
            String data6 = (String) request.getParameter("data6");
            String data7 = (String) request.getParameter("data7");
            String data8 = (String) request.getParameter("data8");
            String data9 = (String) request.getParameter("data9");
            String data10 = (String) request.getParameter("data10");
        %>

    </head>
    <body>
        <%
            if (errorCode == 1) { //Not log in;
        %>
        Please login to bid..
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">

            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p><a href="login.jsp" title="LOGIN TO BID" class="fl popup" id="dialog_link" data-rel="box">LOGIN TO BID</a></p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>    
        <% } else if (errorCode == 2) { //Not customer %>
        Your role does not allow you to bid.
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">

            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p>RESTRICTED</p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>
        <% } else if (errorCode == 3) { //Bidding on own auction %>
        You can not bid on your own auction.
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">

            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p>RESTRICTED</p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>
        <% } else if (errorCode == 0) { %>
        <div id="yourbidding_noti">Enter more than current bid:</div>
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">
                <span><font class="">$</font>&nbsp;</span>
                <div class="hb_place_bid_tb">
                    <form method="post" id="reserve_form">
                        <div class="fl">
                            <input type="number" name="bidamount" id="yourbidding" class="savetext" maxlength="10" value="<%=userBidValue%>"></input>
                            <input type="hidden" id="currency" class="savetext" value="<font class=''>$</font>"></input>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p><a href="#" onClick="startBidding('<%=auctionIdString%>', '<%=nextBidValue%>')" title="BID ME" class="fl popup" id="dialog_link" data-rel="box">PLACE MY BID</a></p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>
        <% } else if (errorCode == 4) { %>
        <p>BIDDING FAILED!</p>
        <% } else if (errorCode == 5) { %>
        <p>BID PLACED!</p>
        <% } else if (errorCode == 6) { %>
        You're already the highest bidder!
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">

            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p>ALREADY BID!</p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>
        <% } else if (errorCode == 7) {%>
        <%=data1%>
        <% } else if (errorCode == 8) { %>
        Your account balance is not sufficient!
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">

            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p><a href="UserController?service=start_charing" title="" class="fl popup" id="dialog_link" data-rel="box">CHARGE MONEY</a></p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>   
        <% } else if (errorCode == 9) { %>
        <p>FAILED!</p>
        <% } else if (errorCode == 10) {%>
        <h3 class="currentprice" >Current bid: <%=data1%></h3> 
        <% } else if (errorCode == 11) { %>
        Your have to bid more than that.
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">

            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p>RETURNING..</p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>
        <% } else if (errorCode == 12) { %>
        <p>INVALID BID</p>
        <% } else if (errorCode == 13) {%>
        <p>|<%=data2%>|<%=auctionIdString%>|<%=data1%>|</p>
        <% } else if (errorCode == 14) { %>
        Auction is not available at the moment.
        <div class="hb_buy_now_left">
            <div class="hb_place_bid">

            </div>
        </div>
        <div class="hb_buy_now_right">
            <div class="hb_place_bid_button">
                <div class="hb_place_bid_button_left">
                </div>
                <div class="hb_place_bid_button_mid" id="placebid_btn">
                    <p>RESTRICTED</p>
                </div>
                <div class="hb_place_bid_button_right">
                </div>
            </div>
        </div>   
        <% } else if (errorCode == 15) {
            Auction auction = (Auction) request.getAttribute("auction");
        %>
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
        <% } else { %>
        <p>INTERNAL ERROR!</p>
        <% }%>
    </body>
</html>
