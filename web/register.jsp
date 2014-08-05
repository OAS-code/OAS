<%-- 
    Document   : register
    Created on : Jul 22, 2014, 1:33:34 PM
    Author     : NamNV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
    </head>
    <body>
        <jsp:include page="top.jsp" />
        <div class="header2">            
            <div class="login-part">
                <h2 title="Register">Register</h2>
            </div>
            <div class="signup_middle">
                <div class="signup_lft">
                    <div class="signup_form">
                        <form accept-charset="utf-8" method="post" action="UserController">				<div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>User name <span class="red">*</span>:</p></div>
                                    <input type="text"  name="username" id="username" value="Enter username..." class="fl" onfocus="if (this.value === 'Enter username...')
                                                this.value = '';" onblur="if (this.value === '')
                                                            this.value = 'Enter username...'">						</div>
                                <label><span class="red"></span></label>
                            </div>
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Email <span class="red">*</span>:</p></div>
                                    <input type="text"  name="email" id="email" value="Enter email..." class="fl" onfocus="if (this.value === 'Enter email...')
                                                this.value = '';" onblur="if (this.value === '')
                                                            this.value = 'Enter email...'">						</div>
                                <label style="width:250px;"><span class="red"></span></label>
                            </div>
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Password <span class="red">*</span>:</p></div>
                                    <input type="password"  name="password" id="password" value="*****************" class="fl" onfocus="if (this.value === '*****************')
                                                this.value = '';" onblur="if (this.value === '')
                                                            this.value = '*****************'">							 </div>
                                <label style="width:205px;"><span class="red"></span></label>
                            </div>
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Retype password  <span class="red">*</span>:</p></div>
                                    <input type="password"  name="cpassword" id="cpassword" value="*****************" class="fl" onfocus="if (this.value === '*****************')
                                                this.value = '';" onblur="if (this.value === '')
                                                            this.value = '*****************'">							</div>
                                <span class="red"></span>
                            </div>
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Full name  <span class="red">*</span>:</p></div>
                                    <input type="text"  name="fullname" id="fullname" value="Enter fullname..." class="fl" onfocus="if (this.value === 'Enter fullname...')
                                                this.value = '';" onblur="if (this.value === '')
                                                            this.value = 'Enter fullname...'">	
                                </div>
                                <span class="red"></span>
                            </div> 
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Phone number  <span class="red">*</span>:</p></div>
                                    <input type="text"  name="phonenumber" id="phonenumber" value="Enter phone number..." class="fl" onfocus="if (this.value === 'Enter phone number...')
                                                this.value = '';" onblur="if (this.value === '')
                                                            this.value = 'Enter phone number...'">	
                                </div>
                                <span class="red"></span>
                            </div> 
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Address  <span class="red">*</span>:</p></div>
                                    <input type="text"  name="address" id="address" value="Enter address..." class="fl" onfocus="if (this.value === 'Enter address...')
                                                this.value = '';" onblur="if (this.value === '')
                                                            this.value = 'Enter address...'">	
                                </div>
                                <span class="red"></span>
                            </div> 
                            <div>     
                            </div>
                            <div>
                                <div class="sign_box">
                                    <div>
                                    </div>
                                </div> 
                            </div>
                            <div class="sign_button">
                                <div class="sign_button_lft"></div>
                                <div class="sign_button_midd">
                                    <input type="submit" title="Register" value="Register" name="Register">
                                    <input type="hidden" id="service" name="service" value="registerUser" >
                                </div>
                                <div class="sign_button_rgt"></div>
                            </div>

                        </form></div>
                </div>
                <div class="sign_rgt">
                    <h2>Already a member?</h2>
                    <p>If so you may want to </p>
                    <div class="sign_register">
                        <div class="signreg_lft"></div>
                        <div class="signreg_midd"><a title="Sign in" href="login.jsp">Sign in»</a>now </div>
                        <div class="signreg_rgt"></div>

                    </div>
                </div>

            </div>
            <!--<div style="width: 500px;margin: auto;">
                <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                    <h2 style="margin: auto;margin-left: 10px">Register</h2> 
                    <br>
    
                    <form action="UserController" method="POST">
                        <table>
                            <tr>
                                <td style="text-align: right">Username:</td>
                                <td>
                                    <input type="text" name="username" id="username">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">Password:</td>
                                <td><label for="password"></label>
                                    <input type="password" name="password" id="password">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">Retype Password:</td>
                                <td><label for="password"></label>
                                    <input type="password" name="cpassword" id="password">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">Full name:</td>
                                <td>
                                    <input type="text" name="fullname" id="fullname" >
                                </td>
                            </tr>   
                            <tr>
                                <td style="text-align: right">Phone number:</td>
                                <td><label for="phonenumber"></label>
    
                                    <input type="text" name="phonenumber" id="phonenumber"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right">Email:</td>
                                <td><label for="email"></label>
    
                                    <input type="text" name="email" id="email"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right">Address:</td>
                                <td>                    
                                    <textarea name="address" id="address" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" name="add" id="add" value="Submit">
                                    <input type="hidden" name="service" id="service" value="registerUser">
                                    <input type="reset" name="reset" id="reset" value="Clear">
    
                                </td>
                            </tr>
                        </table>
                    </form>-->
    </body>
</html>
