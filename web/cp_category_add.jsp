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
            String errorCode = request.getParameter("errorCode");
        %>
    </head>
    <body>
        <jsp:include page="top.jsp" />
        <div class="header2">
            <%if (errorCode != null) {
                    if (errorCode.equals("1")) { %>

            <ul id="message" class="error_msg">
                <li><p>Failed to add category. Category name is invalid!</p></li>
            </ul>
            <% } else if (errorCode.equals("2")) { %>
            <ul id="message" class="error_msg">
                <li><p>Failed to update category. Internal error!</p></li>
            </ul>   

            <% }else if (errorCode.equals("3")) { %>
            <ul id="message" class="error_msg">
                <li><p>You can not delete this category that isn't empty.</p></li>
            </ul>   

            <% }else if (errorCode.equals("4")) { %>
            <ul id="message" class="success_msg">
                <li><p>Category has been successfully added!</p></li>
            </ul>   

            <% } else if (errorCode.equals("0")) { %>
            <ul id="message" class="success_msg">
                <li><p>Category has been successfully updated!</p></li>
            </ul>   

            <% }%>
            <br>

            <%
                }
            %>
            <jsp:include page="cp_cols.jsp" />
            <jsp:include page="cp_category_add_home.jsp" />             
        </div>
        <jsp:include page="footer.jsp" />
    </body> 

</html>
