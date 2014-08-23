<%-- 
    Document   : placebid
    Created on : Aug 20, 2014, 5:39:00 PM
    Author     : Duc
--%>

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
        <% }else if (errorCode == 5) { %>
        <p>BID PLACED!</p>
        <% }else if (errorCode == 6) { %>
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
        <% } else if (errorCode == 7) { %>
        <%=data1%>
        <% } else { %>
        <p>Internal Error!</p>
        <% } %>
    </body>
</html>
