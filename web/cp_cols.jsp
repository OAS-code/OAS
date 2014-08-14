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
        <%
            String current_page = request.getParameter("current_page");
            int rank = -1;
            if (session.getAttribute("role") != null) {
                rank = Integer.parseInt((String) session.getAttribute("role"));
            }

        %>
    </head>
    <body>
        <div class="banner_left">
            <div class="dash_tops">Control Panel</div>
            <div class="dash_lsd user_panel_list">
                <ul>
                    <%                        if ((current_page != null) && current_page.equalsIgnoreCase("dashboard")) { %>
                    <li class="act_class" id="dashboard_active"><a href="cp.jsp?current_page=dashboard" title="Manage User">Dashboard</a></li>
                        <% } else { %>
                    <li class="" id="edit_profile_active"><a href="cp.jsp?current_page=dashboard" title="Manage User">Dashboard</a></li>
                        <% }
                            if (rank >= 0) {
                                if ((current_page != null) && current_page.equalsIgnoreCase("my_account")) { %>
                    <li class="act_class" id="dashboard_active"><a href="cp_my_account.jsp?current_page=my_account" title="My account">My account</a></li> 
                    <!--
                    <li class="act_class" id="dashboard_active"><a href="cp_change_password.jsp?current_page=change_password" title="Manage Category">Change password</a></li> 
                    -->
                    <% } else { %>
                    <!--
                <li class="" id="edit_profile_active"><a href="cp_change_password.jsp?current_page=change_password" title="Manage Category">Change password</a></li>
                    -->
                    <li class="" id="edit_profile_active"><a href="cp_my_account.jsp?current_page=my_account" title="My account">My account</a></li>
                        <% }
                            }

                            if (rank == 2) {
                                if ((current_page != null) && current_page.equalsIgnoreCase("user_manager")) { %>
                    <li class="act_class" id="dashboard_active"><a href="UserController?service=user_manager" title="Manage User">Manage user</a></li>
                        <% } else { %>
                    <li class="" id="edit_profile_active"><a href="UserController?service=user_manager" title="Manage User">Manage user</a></li>
                        <% }
                            }%>

                    <%
                        if (rank == 1) {
                            if ((current_page != null) && current_page.equalsIgnoreCase("auction_manager")) { %>
                    <li class="act_class" id="dashboard_active"><a href="AuctionController?service=auction_manager" title="Manage Auction">Manage auction</a></li>
                        <% } else { %>
                    <li class="" id="dashboard_active"><a href="AuctionController?service=auction_manager" title="Manage Auction">Manage auction</a></li>
                        <% }
                            }

                            if (rank == 1) {
                                if ((current_page != null) && current_page.equalsIgnoreCase("category_manager")) { %>
                    <li class="act_class" id="dashboard_active"><a href="CategoryController?service=category_manager" title="Manage Category">Manage category</a></li>
                        <% } else { %>
                    <li class="" id="edit_profile_active"><a href="CategoryController?service=category_manager" title="Manage Category">Manage category</a></li>
                        <% }
                            }

                            if (rank >= 0) {
                                if ((current_page != null) && current_page.equalsIgnoreCase("edit_profile")) { %>
                    <!--
                        <li class="act_class" id="dashboard_active"><a href="cp_edit_profile.jsp?current_page=edit_profile" title="Manage Category">Edit profile</a></li>
                    -->
                    <% } else { %>
                    <!--
                <li class="" id="edit_profile_active"><a href="cp_edit_profile.jsp?current_page=edit_profile" title="Manage Category">Edit profile</a></li>
                    -->
                    <% }
                        }%>

                </ul>
            </div>
        </div>
    </body> 

</html>
