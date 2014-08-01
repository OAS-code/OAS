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
    <body>
       <!-- 
            //String current_page = request.getParameter("current_page");
            //String page_class = "";
            //String page_id = "edit_profile_active";
            
            -->
        <div class="banner_left">
            <div class="dash_tops">Control Panel</div>
            <div class="dash_lsd user_panel_list">
                <ul>
                    <!--if current_page == open user-->
                    <li class="act_class" id="dashboard_active"><a href="acp.jsp" title="Manage User">Dashboard</a></li>
                    <li class="" id="edit_profile_active"><a href="UserController?service=open" title="Manage User">Manage User</a></li>
                    <li class="" id="edit_profile_active"><a href="AuctionController?service=open" title="Manage Auction">Manage Auction</a></li>
                </ul>
            </div>
        </div>
    </body> 

</html>
