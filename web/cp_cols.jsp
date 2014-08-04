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
        %>
    </head>
    <body>
        <div class="banner_left">
            <div class="dash_tops">Control Panel</div>
            <div class="dash_lsd user_panel_list">
                <ul>
                    <%
                        if ((current_page != null) && current_page.equalsIgnoreCase("dashboard")) { %>
                    <li class="act_class" id="dashboard_active"><a href="cp.jsp?current_page=dashboard" title="Manage User">Dashboard</a></li>
                        <% } else { %>
                    <li class="" id="edit_profile_active"><a href="cp.jsp?current_page=dashboard" title="Manage User">Dashboard</a></li>
                        <% }%>
                    
                    <%
                        if ((current_page != null) && current_page.equalsIgnoreCase("user_manager")) { %>
                    <li class="act_class" id="dashboard_active"><a href="UserController?service=user_manager" title="Manage User">Manage User</a></li>
                        <% } else { %>
                    <li class="" id="edit_profile_active"><a href="UserController?service=user_manager" title="Manage User">Manage User</a></li>
                        <% }%>
                    
                    <%
                        if ((current_page != null) && current_page.equalsIgnoreCase("category_manager")) { %>
                    <li class="act_class" id="dashboard_active"><a href="CategoryController?service=listall" title="Manage Category">Manage Category</a></li>
                        <% } else { %>
                    <li class="" id="edit_profile_active"><a href="CategoryController?service=listall" title="Manage Category">Manage Category</a></li>
                        <% }%>
                    
                    
                </ul>
            </div>
        </div>
    </body> 

</html>
