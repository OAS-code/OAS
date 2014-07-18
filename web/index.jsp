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
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
    </head>
    <body>  
    <center>
        <br><br><br><br><br>
        <div class="box" style="width: 500px">
            <div class="heading-pro"><h2>Management<h2></div>
            <div class="box-content">
                <div class="box-category">
                    <div id="register">
                            <div>
                                <form>
                                    <button type="button" onclick="window.location = 'UserController?service=listall'">Manage User</button>
                                    <br>
                                    <button type="button" onclick="window.location = 'AuctionController?service=listall'">Manage Auction</button>
                                </form>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <center>
    </body>
</html>
