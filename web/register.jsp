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
        <%
            String errorCode = request.getParameter("errorCode");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String phonenumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            if (errorCode == null) {
                username = "";
                email = "";
                fullname = "";
                phonenumber = "";
                address = "";
            }
        %>
    </head>
    <body>
        <jsp:include page="logout.jsp" />
        <jsp:include page="top.jsp" />
        <div class="header2">   
            <% if (errorCode != null) {
                if (errorCode.equals("1")) {%>
                <ul id="message" class="error_msg">
                    <li><p>Username must contain 3 characters or longer.</p></li>
                </ul>
                <%} else if (errorCode.equals("2")) {%>
                <ul id="message" class="error_msg">
                    <li><p>Email is invalid.</p></li>
                </ul>
                <%} else if (errorCode.equals("3")) {%>
                <ul id="message" class="error_msg">
                    <li><p>Username is already taken or email is already in use.</p></li>
                </ul>
                <%} else if (errorCode.equals("4")) {%>
                <ul id="message" class="success_msg">
                    <li><p>Change password successful. Please to login!.</p></li>
                </ul>
                <% }
            } %>
            <div class="login-part">
                <h2 title="Register">Register</h2>
            </div>
            <div class="signup_middle">
                <div class="signup_lft">
                    <div class="signup_form">
                        <form accept-charset="utf-8" method="post" action="UserController">				<div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Username <span class="red">*</span>:</p></div>
                                    <input type="text"  name="username" id="username" value="<%=username%>" class="fl">						</div>
                                <label><span class="red"></span></label>
                            </div>
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Email <span class="red">*</span>:</p></div>
                                    <input type="text"  name="email" id="email" value="<%=email%>" class="fl" >						</div>
                                <label style="width:250px;"><span class="red"></span></label>
                            </div>
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Full name: </p></div>
                                    <input type="text"  name="fullname" id="fullname" value="<%=fullname%>">	
                                </div>
                                <span class="red"></span>
                            </div> 
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Phone number: </p></div>
                                    <input type="text"  name="phonenumber" id="phonenumber" value="<%=phonenumber%>">	
                                </div>
                                <span class="red"></span>
                            </div> 
                            <div class="">
                                <div class="log_fields">
                                    <div class="colm1_width fl"><p>Address: </p></div>
                                    <input type="text"  name="address" id="address" value="<%=address%>">	
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
                                    <input type="hidden" id="service" name="service" value="register" >
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
                        <div class="signreg_midd"><a title="Sign in" href="login.jsp">Sign in</a></div>
                        <div class="signreg_rgt"></div>
                    </div>
                </div>

            </div>
        </div>

    </body>
</html>
