<%-- 
    Document   : cp_customer_my_watchlist_home
    Created on : Aug 20, 2014, 12:18:11 AM
    Author     : ducfpt
--%>

<%@page import="Entity.WatchList"%>
<%@page import="Entity.Auction"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />  
        <link type="text/css" href="css/en_style.css" rel="stylesheet" media="screen" />
    </head>
    <body>
        <div class="my_message_right" id="watchlist_page">
            <div class="message_common_border">
                <h1 title="MY WATCHLIST">MY WATCHLIST</h1>
                <p>&nbsp;</p>
            </div>
            <div class="message_common">
                <div class="forms_common">
                    <div class="title_cont_watchilist">
                        <%
                            ArrayList<Auction> auction = (ArrayList<Auction>) request.getAttribute("arraylist");

                            if (auction == null) {
                        %>
                        <h4 class="">No items</h4>

                        <%
                        } else {
                            for (int i=0;i<auction.size();i++) {
                        %>
                        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="table-top">
                            <thead>
                                <tr>
                                    <th width="100" align="center">
                                        <b>Image</b>
                                    </th>
                                    <th width="100" align="center">
                                        <b>Title</b>
                                    </th>
                                    <th width="100" align="center">
                                        <b>End Time</b>
                                    </th>
                                    <th width="100" align="center">
                                        <b>Actions</b>
                                    </th>
                                </tr>
                            </thead>

                            <tbody><tr>
                                    <td width="100" align="center">
                                        <h3><a href="#" title="<%=auction.get(i).getTitle()%>">



                                                <img src="<%=auction.get(i).getImgCover()%>" width="65" height="65" alt="Keyboard"></a></h3>
                                    </td>

                                    <td width="100" align="center">
                                        <a title="<%=auction.get(i).getTitle()%>" href="AuctionController?service=view&auctionId=<%=auction.get(i).getId()%>"><%=auction.get(i).getTitle()%></a>
                                    </td>
                                    <td width="100" align="center">
                                        <%=auction.get(i).getFormattedEndDate()%>		</td>
                                    <td width="100" align="center">
                                        <a href="AuctionController?service=delwatchlist&auction_id=<%=auction.get(i).getId()%>" title="Delete" onclick="return confirm('Are you sure want to delete?')">
                                            <img src="images/delete.png" alt="Delete">
                                        </a>
                                    </td>
                                </tr>

                            </tbody></table>
                            <%
                                    }
                                }
                            %>
                    </div>

                    <div class="user" style="display:none;">344</div>


                </div>
            </div>

        </div>
    </body>
</html>
