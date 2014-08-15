<%-- 
    Document   : cp_auction_add
    Created on : Aug 6, 2014, 11:41:59 PM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new auction</title>
    </head>
    <body>
        <%@ include file="perm_staff.jsp" %>
        <jsp:include page="top.jsp" />
        <div class="header2">
            <jsp:include page="cp_cols.jsp" />
            <%@ include file="cp_auction_add_home.jsp" %>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
