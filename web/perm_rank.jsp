<%-- 
    Document   : perm_admin
    Created on : Aug 6, 2014, 3:08:10 PM
    Author     : Maxime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String role = (String) session.getAttribute("role");
            Integer rank = 0;
            if (role != null) {
                if (role.equalsIgnoreCase("Admin")) {
                    rank = 3;
                }
                else if (role.equalsIgnoreCase("Staff")) {
                    rank = 2;
                }
                else if (role.equalsIgnoreCase("Customer")) {
                    rank = 1;
                }
            }
            else {
                rank = 0;
            }
            
        %>  

    </body>
</html>
