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
        <title>Reset your password</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <%
            String errorCodeString = request.getParameter("errorCode");
            if (errorCodeString == null) {
                errorCodeString = "-1";
            }
            int errorCode = Integer.parseInt(errorCodeString);
            String password1 = request.getParameter("password1");
            if (password1 == null) {
                password1 = "";
            }
            String password2 = request.getParameter("password2");
            if (password2 == null) {
                password2 = "";
            }
        %>
    </head>
    <body>
        <jsp:include page="top.jsp" />
        <%
            if (errorCode == 0) {
        %>
        <div class="header2">  


            <div class="login-part">
                <h2 title="Forgot_password">Please enter your new password below.</h2>
            </div>
            <div class="login_middle">
                <div class="login_lft">
                    <form accept-charset="utf-8" method="post" action="UserController">	
                        <div class="login_form">
                            <div class="log_fields">
                                <p>New password <span class="red">*</span>:</p>
                                <input type="text"  name="password1" id="password1" value="<%=password1%>">				
                            </div>
                            <span class="red fl"></span>
                        </div>

                        <div class="login_form">
                            <div class="log_fields">
                                <p>Re-type new password <span class="red">*</span>:</p>
                                <input type="text"  name="password2" id="password2" value="<%=password2%>">				
                            </div>
                            <span class="red fl"></span>
                        </div>

                        <div class="login_button">
                            <div class="login_button_lft"></div>
                            <div class="login_button_midd">
                                <input type="submit" title="Send" value="Submit" name="reset_password" id="reset_password">
                                <input type="hidden" id="service" name="service" value="reset_password">
                            </div>
                            <div class="login_button_rgt"></div>
                        </div>
                    </form>
                </div>
            </div> 
        </div>
        <%
        } else if (errorCode == 1) {%>
        <div class="header2"> 

            <div class="login-part">
                <h2 title="Forgot_password">Password Link Expired</h2>
            </div>
            <div class="login_middle">
                <div class="login_lft">
                    <form accept-charset="utf-8" method="post" action="UserController">	
                        <div class="login_form">
                            <div class="log_fields">
                                <p></p>
                                <input type="text"  name="password1" id="password1" value="<%=password1%>">				
                            </div>
                            <span class="red fl"></span>
                        </div>

                        <div class="login_form">
                            <div class="log_fields">
                                <p>Re-type new password <span class="red">*</span>:</p>
                                <input type="text"  name="password2" id="password2" value="<%=password2%>">				
                            </div>
                            <span class="red fl"></span>
                        </div>

                        <div class="login_button">
                            <div class="login_button_lft"></div>
                            <div class="login_button_midd">
                                <input type="submit" title="Send" value="Submit" name="reset_password" id="reset_password">
                                <input type="hidden" id="service" name="service" value="reset_password">
                            </div>
                            <div class="login_button_rgt"></div>
                        </div>
                    </form>
                </div>
            </div> 
        </div>
        <%
            }
        %>
    </body>
</html>
