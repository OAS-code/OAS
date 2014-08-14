<%-- 
    Document   : forgot_password
    Created on : Aug 5, 2014, 11:35:05 AM
    Author     : Duc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password recovery</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <%
            String errorCodeString = request.getParameter("errorCode");
            if (errorCodeString==null){
                errorCodeString = "-1";
            }
            int errorCode = Integer.parseInt(errorCodeString);
            String clue = request.getParameter("clue");
            if (clue == null){
                clue = "";
            }
        %>
    </head>
    <body>
        <jsp:include page="top.jsp" />
        <div class="header2">   
            <%if (errorCode == 0) {%>
            <ul id="message" class="success_msg">
                <li><p>We just sent instructions for completing your password reset to the email address you used to set up your OAS account.</p></li>
            </ul><br>
            <% } else if (errorCode == 1) {%>
            <ul id="message" class="error_msg">
                <li><p>Please enter your username or the email address you used to set up your OAS account.</p></li>
            </ul><br>
            <% } else if (errorCode == 2 || errorCode == 3) {%>
            <ul id="message" class="error_msg">
                <li><p>Sorry, the username or email address your provided does not exist in our system.</p></li>
            </ul><br>
            <% } else if (errorCode == 4) { %>
            <ul id="message" class="error_msg">
                <li><p>Internal error! Please try again later.</p></li>
            </ul><br>
            <% } else if (errorCode == 5) { %>
            <ul id="message" class="error_msg">
                <li><p>It looks like that link has expired. But don't worry, you can request a new one here. </p></li>
            </ul><br>
            <% } else if (errorCode == 6) { %>
            <ul id="message" class="error_msg">
                <li><p>Internal Error! Could not reset your account password, please try again later. </p></li>
            </ul><br>
            <% } %>
            <div class="login-part">
                <h2 title="Forgot_password">Password recovery</h2>
            </div>
            <div class="login_middle">
                <div class="login_lft">
                    <form accept-charset="utf-8" method="post" action="UserController">	
                        <div class="login_form">
                            <div class="log_fields">
                                <p>Please enter your username or email address <span class="red">*</span>:</p>
                                <input type="text"  name="username_email" id="username_email" value="<%=clue%>">				
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
