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
        <title>Add new user</title>
    </head>
    <body>
        <%@ include file="perm_admin.jsp" %>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Add new user</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="UserController">

                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <table border="0" cellspacing="10" cellpadding="10">
                            <tr>
                                <td width="500">

                                    <div class="user_name_common">
                                        <b>Username <span class="red">*</span>: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" maxlength="100" name="username" id="username" class="textbox" value=""></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b>Email <span class="red">*</span>: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" maxlength="100" name="email" id="email" class="textbox" value=""></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b>Role <span class="red">*</span>: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <select name="cb1" id="cb1">
                                                    <option value="Customer" selected="selected">Customer</option>
                                                    <option value="Auction staff">Auction staff</option>
                                                    <option value="Administrator">Administrator</option>
                                                </select>
                                            </h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b>Status <span class="red">*</span>: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <select name="cb2" id="cb2">
                                                    <option value="Active" selected="selected">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                </select>
                                            </h2>
                                        </div>
                                    </div>
                                    
                                    <br>&nbsp;<br>
                                    
                                    <div class="user_name_common">
                                        <b>Full name: </b>
                                    </div>
                                    
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" maxlength="100" name="fullname" id="fullname" class="textbox" value=""></h2>
                                        </div>		
                                    </div>
                                    
                                    <div class="user_name_common">
                                        <b>Address: </b>
                                    </div>
                                    
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" maxlength="100" name="address" id="address" class="textbox" value=""></h2>
                                        </div>		
                                    </div>
                                    
                                    <div class="user_name_common">
                                        <b>Phone number: </b>
                                    </div>
                                    
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" maxlength="100" name="phonenumber" id="phonenumber" class="textbox" value=""></h2>
                                        </div>		
                                    </div>
                                    
                                    
                                </td>
                            </tr>
                        </table>


                        <br>
                        <table align="center">
                            <tr>
                                <td width="140"></td>
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
