<%-- 
    Document   : cp_edit_profile_home
    Created on : Aug 7, 2014, 10:20:37 AM
    Author     : MrTu
--%>

<%@page import="Entity.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/table.css"/>
        <%            User user = (User) request.getAttribute("requestedUser");
        %>
    </head>
    <body>
        <%@ include file="perm_customer.jsp" %>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Edit profile - <%=user.getUsername()%></h1>
                <p>&nbsp;</p>
            </div>
            <form name="form1" method="post" action="UserController"> 
                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <table border="0" cellspacing="10" cellpadding="10">
                            <tr>
                                <td width="500">

                                    <div class="user_name_common">
                                        <b>Full name: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" class="textbox" title="Full Name" value="<%=user.getFullname()%>" name="fullname"></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b>Address: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" class="textbox" title="Address"  value="<%=user.getAddress()%>" name="address"></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b>Phone number: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" class="textbox" title="Phone Number" maxlength="20" value="<%=user.getPhonenumber()%>" name="phonenumber"></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b>Email <span class="red">*</span>: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" readonly="readonly" class="textbox" title="Email" maxlength="50" value="<%=user.getEmail()%>" name="email"></h2>
                                        </div>		
                                    </div>

                                </td>
                            </tr>
                        </table>
                                        
                        <br>

                        <table align="center">
                            <tr>
                                <td width="90"></td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <input type="submit" value="Update" name="Update">
                                            <input type="hidden" name="service" id="service" value="update_profile">
                                        </div>
                                        <div class="res_right"></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="reset" value="Reset" name="reset">
                                            </a>
                                        </div>
                                        <div class="res_right"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </form>
        </div>
    </body>
</html>