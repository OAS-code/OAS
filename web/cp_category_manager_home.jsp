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
        <title>Manage category</title>
    </head>
    <body>
        <%@ include file="perm_staff.jsp" %>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Search category</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="CategoryController">

                <div class="message_common">
                    <div class="login_middle_common_profil">

                        <div class="user_name_common">
                            <p>Keyword:</p>
                            <div class="text_feeld">
                                <h2><input type="text" name="txtsearch" maxlength="100" id="txtsearch" class="textbox"></h2>
                            </div>		
                        </div>

                        <div class="user_name_common">
                            <p>&nbsp;&nbsp;&nbsp;</p>

                            <table>
                                <tr>
                                    <td>
                                        <div class="profil_butoon" style="width:auto;">
                                            <div class="res_left"></div>
                                            <div class="res_mid" style="width:auto;">
                                                <a style="width:auto;">
                                                    <input type="submit" name="search" id="search" value="Search">
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
                                                    <input type="hidden" name="service" id="service" value="search">
                                                    <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'CategoryController?service=listall';">
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
                                                    <input type="button" name="add" id="add" value="Add new category" onclick="window.location = 'cp_category_add.jsp?current_page=category_manager';">
                                                </a>
                                            </div>
                                            <div class="res_right"></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
            <jsp:include page="table_category.jsp" />   
        </div>
    </body>
</html>
