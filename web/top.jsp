<%-- 
    Document   : top
    Created on : Jul 19, 2014, 6:38:42 PM
    Author     : Maxime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <script>
            function startTime() {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('hour').innerHTML = h;
                document.getElementById('min').innerHTML = m;
                document.getElementById('sec').innerHTML = s;
                var t = setTimeout(function() {
                    startTime()}, 500);
            }

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i
                }
                ;
                return i;
            }
        </script>
        <%
            String userName = (String) session.getAttribute("username");
            String role = (String) session.getAttribute("role");
            String balance = (String) request.getAttribute("balance");
        %>
    </head>
    <body onload="startTime()">
        <div id="header">
            <div class="header_inner">
                <div class="header_lft">
                    <ul>
                        <p>Server time:</p>
                        <li><img src="images/time_bg.png" width="18" height="18"></li>
                        <li><a title="Peak Auction" id="hour"></a> <a title="">Hours</a></li>
                        <li><a title="Peak Auction" id="min"></a> <a title="">Minute</a></li>
                        <li><a title="Peak Auction" id="sec"></a> <a title="">Second</a></li>
                    </ul> 
                </div>
                <div class="header_rgt">
                    <div class="header_right">
                        <ul>

                            <%
                                if (userName == null || role == null) {
                            %>

                            <li><a href="login.jsp" title="Sign in">Sign in</a></li>
                            <li class="active"><a href="register.jsp" title="Register">Register</a></li>                           
                                <%} else {%>

                            <li><a href="cp.jsp?current_page=dashboard" title="Customer">Howdy, <%=userName%></a></li>
                            <li class="active"><a href="logout.jsp?success_page=2" title="Signout" onclick="return confirm('Are you sure?')">Sign out</a></li>

                            <%}%>

                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="header2">
            <div class="header2_lft" id="header2_lft">
                <h1 title="Online Auction System">
                    <a href="index.jsp" title="Online Auction System" class="fl">
                        <img src="images/action-logo.png" alt="Online Auction System" title="Online Auction System" border="0" width="145" height="29"> 
                    </a>
                </h1>	
            </div>

            <div class="header2_rgt">
                <div class="dash_rgt">
                    <ul> 
                        <li>

                            <div class="search_total">
                                <div class="search_total_lft"> </div>
                                <div class="search_total_midd">
                                    <div class="search_lft">
                                        <div class="search_icon"></div>


                                        <form action="" id="user_search" name="user_search" method="get">
                                            <input type="text" value="Search Products..." name="search" class="fl" onfocus="if (this.value == 'Search Products...')
                                                        this.value = '';" onblur="if (this.value == '')
                                                                    this.value = 'Search Products...'" id="search" maxlength="300">
                                        </form>
                                    </div>
                                    <div class="search_rgt">
                                        <div class="search_button">
                                            <div class="search_button_lft"></div>
                                            <div class="search_button_mid" style="cursor:pointer;">
                                                <p style="cursor:pointer;"><a class="fl" onclick="document.user_search.submit();" title="SEARCH">SEARCH</a></p>
                                            </div>
                                            <div class="search_button_rgt"></div>
                                        </div>
                                    </div>

                                </div>
                                <div class="search_total_rgt"></div>
                            </div>
                        </li></ul></div>
            </div>

        </div>


        <div id="header_menu">
            <div class="header_menu_inner">
                <ul>
                    <li id="head_cate">
                        <select style="width:auto; height: 31px;padding: 1px; margin: 0px" ONCHANGE="location = this.options[this.selectedIndex].value;">
                            <option value="">Select categories</option>
                            <option value="AuctionController?service=index">All categories</option>
                            <option value="AuctionController?service=index">Smartphone</option>
                            <option value="dantri.com">Automotive</option>
                            <option value="zing.vn">Real Estate</option>
                        </select>
                    </li>


                    <!--
                    <li id="head_cate">

                        <img id="drop_down_cat" src="images/menu_select.png" align="middle" width="8" height="5" alt="" border="0" title="ALL CATEGORIES">


                    </li>
                    -->

                    <li id="home_menu"> <a href="index.jsp" title="Home"> Home</a></li>

                </ul>
            </div>
        </div>
        <br>
        <br>
        <br>
    </body>
</html>
