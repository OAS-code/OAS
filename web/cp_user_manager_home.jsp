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
                <h1 title="User Manager">Search User</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="UserController">

                <div class="message_common">
                    <div class="login_middle_common_profil">

                        <div class="user_name_common">
                            <p>Keyword:</p>
                            <div class="text_feeld">
                                <h2><input type="text" name="txtsearch" maxlength="100" id="txtsearch" class="textbox"></h2>
                            </div>		
                        </div>

                        <div class="user_name_common">
                            <p>User type</p>
                            <div class="text_feeld">
                                <h2>
                                    <select name="user_type" class=" text_bg select" id="user_type" >	
                                        <option value="" selected="selected">Select User Type</option>
                                        <option value="Admin"  >Admin</option>
                                        <option value="Customer"  >Customer</option>
                                        <option value="Staff"  >Auction staff</option>
                                    </select>
                                </h2>
                            </div>	

                            <p>Status</p>
                            <div class="text_feeld">
                                <h2>
                                    <select name="status" class=" text_bg select" id="status" >	
                                        <option value="" selected="selected">Select User Status</option>
                                        <option value="Active">Activated</option>
                                        <option value="Deactive">Deactivated</option>
                                    </select>
                                </h2>
                            </div>


                            <p>&nbsp;&nbsp;&nbsp;</p>
                            <div class="profil_butoon" style="width:auto;">
                                <div class="res_left"></div>
                                <div class="res_mid" style="width:auto;">
                                    <a style="width:auto;">
                                        <input type="submit" name="search" value="SEARCH" title="SEARCH">
                                        <input type="hidden" name="service" id="service" value="search" >
                                    </a>
                                </div>
                                <div class="res_right"></div>
                            </div>

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="profil_butoon" style="width:auto;">
                                <div class="res_left"></div>
                                <div class="res_mid" style="width:auto;">
                                    <a style="width:auto;">
                                        <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'UserController?service=listall'" >
                                    </a>
                                </div>
                                <div class="res_right"></div>
                            </div>

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="profil_butoon" style="width:auto;">
                                <div class="res_left"></div>
                                <div class="res_mid" style="width:auto;">
                                    <a style="width:auto;">
                                        <input type="button" name="add" id="add" value="Add new user" onclick="window.location = 'AddUser.jsp';">    
                                    </a>
                                </div>
                                <div class="res_right"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>

        </div>
        <!--
                <h2 style="margin: auto;margin-left: 10px">Manage user</h2> 
                <form name="form1" method="post" action="UserController">
                    <br>
    
                    <input type="button" name="add" id="add" value="Add new user" onclick="window.location = 'AddUser.jsp';">
    
                    <p>
    
                        <label>Keyword:</label>
                        <input type="text" name="txtsearch" id="txtsearch">
                        <label>User type:</label>
                        <select name="user_type" id="user_type">
                            <option value="" selected="selected">Select</option>
                            <option value="Admin"  >Admin</option>
                            <option value="Customer"  >Customer</option>
                            <option value="Staff"  >Auction staff</option>
                        </select>                       
    
                        <label>Status:</label>
                        <select name="status" id="status">
                            <option value="" selected="selected">Select</option>
                            <option value="Active">Active</option>
                            <option value="Deactive">Deactive</option>
                        </select> 
                        <input type="submit" name="search" id="search" value="Search">
                        <input type="hidden" name="service" id="service" value="search">
                        <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'UserController?service=listall'">
    
                        <label>Result</label>
                        <input type="text" id="result" readonly>
    
                </form> 
        -->
    </body>
</html>
