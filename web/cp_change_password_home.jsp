<%-- 
    Document   : change_password
    Created on : Aug 7, 2014, 12:31:27 AM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="perm_customer.jsp" %>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Change password</h1>
                <p>&nbsp;</p>
            </div>
            <form name="change_password" id="change_password" method="post" action="UserController">
                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <table border="0" cellspacing="10" cellpadding="10">
                            <tr>
                                <td width="500">

                                    <div class="user_name_common">
                                        <b style="width:170px">Current password <span class="red">*</span>:</b>
                                    </div>

                                    <div class="user_name_common" >
                                        <div class="text_feeld" >
                                            <h2><input type="password" maxlength="20" title="Old Password" name="old_password" id="old_password" style="width:200px;"></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b style="width:170px">New password <span class="red">*</span>:</b>
                                    </div>

                                    <div class="user_name_common" >
                                        <div class="text_feeld">
                                            <h2><input type="password" maxlength="20" title="New Password" name="new_password" id="new_password" style="width:200px;"></h2>
                                        </div>		
                                    </div>

                                    <div class="user_name_common">
                                        <b style="width:170px">Re-type new password <span class="red">*</span>:</b>
                                    </div>

                                    <div class="user_name_common" >
                                        <div class="text_feeld">
                                            <h2><input type="password" maxlength="20" title="Confirm Password" name="confirm_password" id="confirm_password" style="width:200px;"></h2>
                                        </div>		
                                    </div>


                                </td>
                            </tr>
                        </table>

                        <br>


                        <table>
                            <tr>
                                <td width="0">

                                </td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="hidden" name="service" id="service" value="change_password">
                                                <input type="hidden" name="userid" id="userid" value="<%=session.getAttribute("userid")%>">
                                                <input type="submit" value="save" name="submit_change_pass">
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

