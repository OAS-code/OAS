<%-- 
    Document   : forgot_password
    Created on : Aug 5, 2014, 11:35:05 AM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password recovery</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
    </head>
    <body>
        <jsp:include page="top.jsp" />
        <div class="header2">   
            <div class="login-part">
                <h2 title="Forgot_password">Password recovery</h2>
            </div>
            <div class="login_middle">
                <div class="login_lft">
                    <form accept-charset="utf-8" method="post" action="UserController">	
                        <div class="login_form">
                            <div class="log_fields">
                                <p>Please enter your registered username or email address<span class="red">*</span>:</p>
                                <input type="text"  name="username_email" id="username_email" value="">				
                            </div>
                            <span class="red fl"></span>
                        </div>

                        <div class="login_button">
                            <div class="login_button_lft"></div>
                            <div class="login_button_midd">
                                <input type="submit" title="Send" value="Submit" name="forgot_password" id="forgot_password">
                                <input type="hidden" id="service" name="service" value="forgot_password">
                            </div>
                            <div class="login_button_rgt"></div>
                        </div>
                    </form>
                </div>
            </div> 
        </div>
    </body>
</html>
