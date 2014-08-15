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
                <h1 title="User Manager">Add new category</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="CategoryController">
                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <table border="0" cellspacing="10" cellpadding="10">
                            <tr>
                                <td width="550">

                                    <div class="user_name_common">
                                        <b style="width: 150px;">Category name <span class="red">*</span>:</b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" maxlength="100" name="name" id="name" class="textbox"></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b style="width: 150px;">Description: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" maxlength="100" name="description" id="description" class="textbox"></h2>
                                        </div>		
                                    </div>

                                </td>
                            </tr>
                        </table>




                        <table>
                            <tr>
                                <td width="140">

                                </td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="hidden" name="service" id="service" value="addcategory" >
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
                                                <input type="button" name="cancel" id="cancel" value="Cancel" onclick="window.location = 'CategoryController?service=category_manager';">

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
                                                <input type="reset" name="reset" id="reset" value="Reset" > </a>
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



