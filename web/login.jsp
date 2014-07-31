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
    </head>
    <body>      
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
                                <p>User Name <span class="red">*</span>:</p>
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
                            <label><a title="Forgot password" href="">Forgot password?</a></label>						
                        </div>
                        <div class="login_button fl clr">
                            <div class="login_button_lft"></div>
                            <div class="login_button_midd">
                                <input type="submit" title="SIGNIN" value="Signin" name="login" id="login">
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
                            <div class="reg_midd"><a title="Register" href="">Register</a></div>
                            <div class="reg_rgt"></div>

                        </div>
                    </div>
                </div>
            </div>  
        </div> 
    </body>
</html>
