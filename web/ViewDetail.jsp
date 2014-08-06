<%-- 
    Document   : ViewDetail
    Created on : Jul 9, 2014, 12:43:01 AM
    Author     : MrTu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View user information</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/table.css"/>
    </head>
    <body>
        <div id="edit_profile_page" class="my_message_right">
            <div class="message_common_border">
                <h1 title="EDIT PROFILE">User information</h1>
                <p>&nbsp;</p>
            </div>
            <form name="form1" method="post" action="UserController">
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("rs");
                    User user = new User();
                    if (rs.next()) {
                        user.setId(rs.getInt(1));
                        user.setFullname(rs.getString(2));
                        user.setUsername(rs.getString(3));
                        user.setPassword(rs.getString(4));
                        user.setPhonenumber(rs.getString(5));
                        user.setEmail(rs.getString(6));
                        user.setAddress(rs.getString(7));
                        user.setRole(rs.getString(8));
                        user.setStatus(rs.getString(9));
                    }
                %>
                <div class="message_common">					 
                    <div class="login_middle_common_profil">
                        <input type="hidden" name="no" id="no" value="<%=user.getId()%>" readonly>

                        <table border="1"  cellpadding="20" id="viewInfoTable">
                            <tr>                                
                                <td >User name:</td>
                                <td><%=user.getUsername()%></td>                    
                            </tr>                            
                            <tr>
                                <td >Email:</td>
                                <td><%=user.getEmail()%></td>
                            </tr>
                            <tr>
                                <td >Role:</td>
                                <td><%=user.getRole()%></td>
                            </tr>
                            <tr>
                                <td >Status:</td>
                                <td><%=user.getStatus()%></td>
                            </tr>
                            <tr>
                                <td >Full name:</td>
                                <td><%=user.getFullname()%></td>
                            </tr>
                            <tr>
                                <td >Phone number:</td>
                                <td><%=user.getPhonenumber()%></td>
                            </tr>
                            <tr>
                                <td >Address:</td>
                                <td><%=user.getAddress()%></td>
                            </tr>                          	
                        </table>		
                        <div class="no_img">
                            <div class="buton_green">
                                <div class="profil_butoon">
                                    <div class="res_left"></div>
                                    <div class="res_mid"><a title="Edit">
                                            <input type="button" value="Edit" name="Edit" onclick="window.location = 'EditUser.jsp?id=<%=user.getId()%>';"></a>
                                    </div>                  
                                    <div class="res_right"></div>
                                </div>
                                <span></span>				
                                <div class="grand_total_btn_cp">
                                    <div class="save_left"></div>
                                    <div class="save_mid">
                                        <a title="Delete">
                                            <input type="submit" value="Delete" name="Delete" onclick="return confirm('Are you sure?')">
                                            <input type="hidden" id="service" name="service" value="deleteuser">
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
