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
        <%
            String userName = (String) session.getAttribute("username");
            String role = (String) session.getAttribute("role");
            String balance = (String) request.getAttribute("balance");
        %>
    </head>
    <body>
        <!--select_box_top-->
        <link rel="stylesheet" type="text/css" href="http://www.unieauction.com/buy-sell-demo/public/white/css/stylish-select.css" />
        <!--<script type="text/javascript" src="http://www.unieauction.com/buy-sell-demo/public/js/plugin.js"></script>-->
        <script src="http://www.unieauction.com/buy-sell-demo/public/js/jquery.stylish-select.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(document).ready(function() {

                $('#drop_down_cat').click(function() {


                    if ($('#div_category').css('display') == 'none') {
                        $('#div_category').show();
                    } else {
                        $('#div_category').hide();
                    }

                });



                $('#my-dropdown, #my-dropdown2, #my-dropdown3, #my-dropdown4, #my-dropdown5, #my-dropdown6').sSelect();

                //set max height
                $('#my-dropdownCountries').sSelect({ddMaxHeight: '300px'});

                //set value on click
                $('#setVal').click(function() {
                    $('#my-dropdown5').getSetSSValue('4');
                });

                //get value on click
                $('#getVal').click(function() {
                    alert('The value is: ' + $('#my-dropdown5').getSetSSValue());
                });

                //alert change event
                $('#my-dropdownChange').sSelect().change(function() {
                    alert('changed')
                });


                return false;

            });
        </script>
        <div id="header">
            <div class="header_inner">
                <div class="header_lft">
                    <p>Bidding Type   :</p>
                    <ul>
                        <li style="background:none;"><img src="images/head_top1_bg.png" width="18" height="18" alt="Beginner"><a title="Beginner">Beginner</a></li>
                        <li><img src="images/head_top2_bg.png" width="18" height="18" alt="Penny auction"><a title="Penny Auction">Penny Auction</a></li>
                        <li><img src="images/head_top3_bg.png" width="18" height="18" alt="Peak auction"><a title="Peak Auction">Peak Auction</a></li>
                        <li><img src="images/reserve_icon1.png" width="17" height="17" alt="Reserve auction"><a title="Reserve auction">Reserve auction</a></li>
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
            <div class="header2_lft">
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
                        <select style="width:auto; height: 31px;padding: 1px; margin: 0px">
                            <option value="volvo">All categories</option>
                            <option value="saab">Smartphone</option>
                            <option value="opel">Automotive</option>
                            <option value="audi">Real Estate</option>
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
