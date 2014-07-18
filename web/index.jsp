<%-- 
    Document   : index
    Created on : Jul 6, 2014, 10:38:08 PM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <table width="300" border="1" align="center">
                <tr>
                    <td width="194">
                        <div align="center">
                            <p> <a href="UserController?service=listall"><strong>Manage User</strong></a>
                            <p> <a href="AuctionController?service=listall"><strong>Manage Auction</strong></a>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
