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
        <script language="JavaScript" type="text/javascript" src="JavaScript/permissions.js"></script>
    </head>
    <body>

        <%@ include file="perm_customer.jsp" %>

        <jsp:include page="top.jsp" />
        <div class="header2">  
            <%                String errorCode = request.getParameter("errorCode");
            %>
            <%if (errorCode != null && errorCode.equals("1")) {%>
            <ul id="message" class="success_msg">
                <li><p>Logged in successfully!</p></li>
            </ul>
            <br>
            <%}%>
            <jsp:include page="cp_cols.jsp" />
            <jsp:include page="cp_home.jsp" />  
        </div>
        <jsp:include page="footer.jsp" />
    </body> 

</html>
