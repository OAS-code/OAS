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
        <script src="http://wcetdesigns.com/assets/javascript/jquery.js"></script>
        <script src="http://wcetdesigns.com/assets/javascript/jquery/cookie-plugin.js"></script>
        <script>
            function remember_me() {
                var c = $("#check");

                if (c.is(":checked")) {
                    var u = $("#username").val();
                    var p = $("#password").val();
                    $.cookie("username", u, {expires: 365});
                    $.cookie("password", p, {expires: 365});
                }
            }
            function load_em() {
                var u = $.cookie("username");
                var p = $.cookie("password");

                $("#username").val(u);
                $("#password").val(p);
            }
        </script>
    </head>
    <body onLoad="load_em()">   
        <%
            String errorCode = request.getParameter("errorCode");
        %>
        <jsp:include page="top.jsp" />
        <div class="header2">            
            <div class="login-part">
                <h2 title="LOGIN">Login</h2>
            </div>
            <div class="login_middle">
                <div class="login_lft">
                    <form accept-charset="utf-8" method="post" action="UserController">					
                        <div class="login_form">
                            <div class="log_fields">
                                <p>User Name <span class="red"><%if (errorCode != null && errorCode.equals("1")) {%>(Username or password does not exist)<%} else {%>*<%}%></span>:</p>
                                <input type="text"  name="username" id="username" value="Enter username..." class="fl" onfocus="if (this.value === 'Enter username...')
                                            this.value = '';" onblur="if (this.value === '')
                                                        this.value = 'Enter username...'">						
                            </div>
                            <span class="red fl"></span>

                            <div class="log_fields">
                                <p>Password <span class="red">*</span>:</p>
                                <input type="password" id="password" name="password" id="password" value="********" class="fl" onfocus="if (this.value === '********')
                                            this.value = '';" onblur="if (this.value === '')
                                                        this.value = '********'">    
                            </div>

                        </div>		<span class="red fl"></span>
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
    </body>
</html>
