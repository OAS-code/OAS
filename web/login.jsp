<%-- 
    Document   : login
    Created on : Jul 21, 2014, 11:22:32 PM
    Author     : NamNV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>

    </head>
    <body >   
        <%
            String errorCode = request.getParameter("errorCode");
            String username = request.getParameter("username");
        %>

        <jsp:include page="top.jsp" />

        <div class="header2">   
            <%if (errorCode != null && errorCode.equals("1")) {%>
            <ul id="message" class="error_msg">
                <li><p>User name or password does not exist.</p></li>
            </ul>
            <%} else if (errorCode != null && errorCode.equals("2")) {%>
            <ul id="message" class="error_msg">
                <li><p>Please login to access!</p></li>
            </ul>
            <%} else if (errorCode != null && errorCode.equals("3")) {%>
            <ul id="message" class="success_msg">
                <li><p>You have been logged out, session terminated.</p></li>
            </ul>
            <%} else if (errorCode != null && errorCode.equals("4")) {%>
            <ul id="message" class="success_msg">
                <li><p>Change password successful. Please to login!.</p></li>
            </ul>
            <% } else if (errorCode != null && errorCode.equals("5")) {%>
            <ul id="message" class="error_msg">
                <li><p>Account is not activated. Please check your email's inbox or contact an administrator for support.</p></li>
            </ul>
            <% } else if (errorCode != null && errorCode.equals("6")) {%>
            <ul id="message" class="error_msg">
                <li><p>Incorrect username or password.</p></li>
            </ul>
            <% } else if (errorCode != null && errorCode.equals("7")) {%>
            <ul id="message" class="success_msg">
                <li><p>Account '<%=username%>' has been created successfully, account's password has been dispatched to your email address!</p></li>
            </ul>
            <% }%>
            <div class="login-part">
                <h2 title="LOGIN">Login</h2>
            </div>
            <div class="login_middle">
                <div class="login_lft">
                    <form accept-charset="utf-8" method="post" action="UserController">					
                        <div class="login_form">
                            <div class="log_fields" style="width:460px;">
                                <p>User name <span class="red">*</span>:</p>
                                <input type="text"  name="username" id="username" value="Enter username..." class="fl" onfocus="if (this.value === 'Enter username...')
                                            this.value = '';" onblur="if (this.value === '')
                                                        this.value = 'Enter username...'" />
                                <div>
                                    <img src="images/error.png" border="0" alt="Error" width="15">
                                </div>
                            </div>
                            <span class="red fl"></span>

                            <div class="log_fields">
                                <p>Password <span class="red">*</span>:</p>
                                <input type="password" id="password" name="password" id="password" value="********" class="fl" onfocus="if (this.value === '********')
                                            this.value = '';" onblur="if (this.value === '')
                                                        this.value = '********'">    
                            </div>

                        </div>		<span class="red fl"></span>
                        <script>
                            $(function() {

                                if (localStorage.chkbx && localStorage.chkbx != '') {
                                    $('#check').attr('checked', 'checked');
                                    $('#username').val(localStorage.usrname);
                                    $('#password').val(localStorage.pass;
                                } else {
                                    $('#check').removeAttr('checked');
                                    $('#username').val('');
                                    $('#password').val('');
                                }

                                $('#check').click(function() {

                                    if ($('#check').is(':checked')) {
                                        // save username and password
                                        localStorage.usrname = $('#username').val();
                                        localStorage.pass = $('#password').val();
                                        localStorage.chkbx = $('#check').val();
                                    } else {
                                        localStorage.usrname = '';
                                        localStorage.pass = '';
                                        localStorage.chkbx = '';
                                    }
                                });
                            });
                        </script>
                        <div class="login_check">
                            <input type="checkbox" name="check" id="check">							
                            <p class="remeber">Remember me</p>
                            <label><a title="Forgot password" href="forgot_password.jsp">Forgot password?</a></label>						
                        </div>
                        <div class="login_button fl clr">
                            <div class="login_button_lft"></div>
                            <div class="login_button_midd">
                                <input type="submit" title="SIGNIN" value="Signin" name="login" id="login" onClick="remember_me()">
                                <input type="hidden" name="service" id="service" value="login">
                            </div>
                            <div class="login_button_rgt"></div>
                        </div>

                    </form></div>
                <div class="login_rgt">										
                    <div class="login_account">
                        <h2>Don't have an account</h2>
                        <p>Register now to bid, buy, or sell on any Auction site worldwide. It's easy and FREE. Already registered</p>
                        <p>If you want to sign in, you'll need to register first.</p>
                        <p>Registration is fast and FREE.</p>

                        <div class="register">
                            <div class="reg_lft"></div>
                            <div class="reg_midd"><a title="Register" href="register.jsp">Register</a></div>
                            <div class="reg_rgt"></div>

                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
