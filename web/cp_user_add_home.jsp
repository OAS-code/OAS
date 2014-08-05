<%-- 
    Document   : ListAllUser
    Created on : Jul 8, 2014, 3:31:20 PM
    Author     : MrTu
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage user</title>
    </head>
    <body>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Add new user</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="UserController">

                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <div class="user_name_common">
                            <p>Username <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <h2><input type="text" maxlength="100" name="username" id="username" class="textbox"><h2>
                                        </div>		
                                        </div>

                                        <div class="log_fields">
                                            <p>Password <span class="red">*</span>: </p>
                                            <div class="text_feeld">
                                                <input type="password" id="password" name="password" maxlength="100" class="textbox" >
                                            </div>		
                                        </div>

                                        <div class="log_fields">
                                            <p>Re-type password <span class="red">*</span>: </p>
                                            <div class="text_feeld">
                                                <input type="password" id="password2" name="password2" maxlength="100" class="textbox" >
                                                <p>&nbsp;</p>
                                            </div>		
                                        </div>

                                        <div class="user_name_common">
                                            <p>Email <span class="red">*</span>: </p>
                                            <div class="text_feeld">
                                                <h2><input type="text" maxlength="100" name="email" id="email" class="textbox"></h2>
                                            </div>		
                                        </div>

                                        <div class="user_name_common">
                                            <p>Role</p>
                                            <div class="text_feeld">
                                                <select name="cb1" id="cb1">
                                                    <option value="Customer" selected="selected">Customer</option>
                                                    <option value="Staff">Auction staff</option>
                                                    <option value="Admin">Administrator</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="user_name_common">
                                            <p>Full name: </p>
                                            <div class="text_feeld">
                                                <h2><input type="text" maxlength="100" name="fullname" id="fullname" class="textbox"></h2>
                                            </div>		
                                        </div>

                                        <div class="user_name_common">
                                            <p>Address: </p>
                                            <div class="text_feeld">
                                                <h2><input type="text" maxlength="100" name="address" id="address" class="textbox"></h2>
                                            </div>		
                                        </div>

                                        <div class="user_name_common">
                                            <p>Phone number: </p>
                                            <div class="text_feeld">
                                                <h2><input type="text" maxlength="100" name="phonenumber" id="phonenumber" class="textbox"></h2>
                                            </div>		
                                        </div>

                                        <div class="user_name_common">
                                            <p>Status</p>
                                            <div class="text_feeld">
                                                <select name="cb2" id="cb2">
                                                    <option value="Active" selected="selected">Active</option>
                                                    <option value="Deactive">Deactive</option>
                                                    <p>&nbsp;&nbsp;&nbsp;</p>
                                                </select>
                                            </div>
                                        </div>

                                        <table align="center">
                                            <tr>
                                                <td>
                                                    <div class="profil_butoon" style="width:auto;">
                                                        <div class="res_left"></div>
                                                        <div class="res_mid" style="width:auto;">
                                                            <a style="width:auto;">
                                                                <input type="hidden" name="service" id="service" value="adduser" >
                                                                <input type="submit" name="add" value="Add">
                                                            </a>
                                                        </div>
                                                        <div class="res_right"></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="profil_butoon" style="width:auto;">
                                                        <div class="res_left"></div>
                                                        <div class="res_mid" style="width:auto;">
                                                            <a style="width:auto;">
                                                                <input type="button" name="cancel" id="cancel" value="Cancel" onclick="window.location = 'UserController?service=user_manager';">
                                                            </a>
                                                        </div>
                                                        <div class="res_right"></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="profil_butoon" style="width:auto;">
                                                        <div class="res_left"></div>
                                                        <div class="res_mid" style="width:auto;">
                                                            <a style="width:auto;">  
                                                                <input type="reset" name="reset" id="reset" value="Reset" >
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
