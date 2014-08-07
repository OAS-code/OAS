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
    </head>
    <body>
        <%@ include file="perm_customer.jsp" %>
        <div id="edit_profile_page" class="my_message_right">
            <div class="message_common_border">
                <h1 title="EDIT PROFILE">Edit profile.</h1>
                <p>&nbsp;</p>
            </div>
            <form name="form1" method="post" action="UserController"> 
                <%
                    String userid = (String) session.getAttribute("userid");
                    int id = Integer.parseInt(userid);
                     UserDAO dao = new UserDAO();
                    ResultSet rs = dao.search(id);
                    User user = new User();
                    if (rs.next()) {
                        user.setFullname(rs.getString(2));
                        user.setUsername(rs.getString(3));
                        user.setPhonenumber(rs.getString(5));
                        user.setEmail(rs.getString(6));
                        user.setAddress(rs.getString(7));
                    }
                %>
                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <div class="user_name_common"><input type="hidden" name="no" id="no" value="<%=id%>">                      
                            <p>User name :</p>
                            <div class="text_feeld">
                                <h2><input type="text" readonly="readonly" class="textbox" title="User Name"  value="<%=user.getUsername()%>" name="username"></h2>
                            </div>
                        </div>

                        <div class="user_name_common">
                            <p>Email:</p>
                            <div class="text_feeld">
                                <h2><input type="text" readonly="readonly" class="textbox" title="Email"  value="<%=user.getEmail()%>" name="email"></h2>
                            </div>
                        </div>                                                
                        <div class="user_name_common">
                            <p>Full name <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2><input type="text" class="textbox" title="Full Name"  value="<%=user.getFullname()%>" name="fullname"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Phone number:</p>
                            <div class="text_feeld">
                                <h2><input type="text" class="textbox" title="Phone Number" maxlength="20" value="<%=user.getPhonenumber()%>" name="phonenumber"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Address:</p>
                            <div class="text_feeld">
                                <h2><input type="text" class="textbox" title="Address"  value="<%=user.getAddress()%>" name="address"></h2>
                            </div>		
                        </div>
                        <div class="no_img">
                            <div class="buton_green">
                                <div class="profil_butoon">
                                    <div class="res_left"></div>
                                    <div class="res_mid">
                                        <a title="RESET">
                                            <input type="reset" value="Reset" name="reset">
                                        </a>
                                    </div>
                                    <div class="res_right"></div>
                                </div>
                                <span></span>				
                                <div class="grand_total_btn_cp">
                                    <div class="save_left"></div>
                                    <div class="save_mid"><a title="SAVE">
                                            <input type="submit" value="Save" name="save">
                                            <input type="hidden" name="service" id="service" value="edit_profile">
                                        </a>
                                    </div>
                                    <div class="save_right"></div>
                                </div>				
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
