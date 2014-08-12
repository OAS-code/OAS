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
        <%@ include file="perm_admin.jsp" %>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Search User</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="UserController">

                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <table border="0" cellspacing="10" cellpadding="10">
                            <tr>
                                <td width="500">

                                    <div class="user_name_common">
                                        <b>User type: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <select name="cb1" class=" text_bg select" id="cb1" >	
                                                    <option value="" selected="selected">Select User Type</option>
                                                    <option value="Customer"  >Customer</option>
                                                    <option value="Staff"  >Auction staff</option>
                                                    <option value="Admin"  >Administrator</option>
                                                </select>
                                            </h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b>Status: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <select name="cb2" class=" text_bg select" id="cb2" >	
                                                    <option value="" selected="selected">Select User Status</option>
                                                    <option value="Active">Activated</option>
                                                    <option value="Deactive">Deactivated</option>
                                                </select>
                                            </h2>
                                        </div>
                                    </div>


                                    <div class="user_name_common">
                                        <b>Keyword: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="txtsearch" maxlength="100" id="txtsearch" class="textbox"></h2>
                                        </div>		
                                    </div>

                                </td>
                            </tr>
                        </table>




                        <table>
                            <tr>
                                <td width="95">

                                </td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="submit" name="search" id="search" value="SEARCH" title="SEARCH">
                                                <input type="hidden" name="service" id="service" value="search" >
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
                                                <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'UserController?service=listall'" >
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
                                                <input type="button" name="add" id="add" value="Add new user" onclick="window.location = 'cp_user_add.jsp?current_page=user_manager';">    
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
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
            <jsp:include page="table_user.jsp" />   
        </div>
    </body>
</html>
