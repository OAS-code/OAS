<%-- 
    Document   : AddUser
    Created on : Jul 9, 2014, 10:48:39 PM
    Author     : MrTu
--%>

<%@page import="Entity.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%response.setContentType("text/html; charset=UTF-8");%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit user information</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/table.css"/>
    </head>
    <body>
        <div id="edit_profile_page" class="my_message_right">
            <div class="message_common_border">
                <h1 title="EDIT PROFILE">Edit user information.</h1>
                <p>&nbsp;</p>
            </div>
            <form name="form1" method="post" action="UserController">
                <%
                    UserDAO dao = new UserDAO();
                    String id = request.getParameter("id");
                    ResultSet rs = dao.search(Integer.parseInt(id));
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
                        <div class="user_name_common"><input type="hidden" name="no" id="no" value="<%=user.getId()%>">                      
                            <p>User name :</p>
                            <div class="text_feeld">
                                <h2><input type="text" readonly="readonly" class="textbox" title="User Name" maxlength="20" value="<%=user.getUsername()%>" name="username"></h2>
                            </div>
                        </div>

                        <div class="user_name_common">
                            <p>Email:</p>
                            <div class="text_feeld">
                                <h2><input type="text" readonly="readonly" class="textbox" title="Email" maxlength="50" value="<%=user.getEmail()%>" name="email"></h2>
                            </div>
                        </div>
                        <div class="user_name_common">
                            <p>Role <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2>
                                    <select name="cb1" class=" text_bg select" id="cb1" >	
                                        <option value="Customer"  >Customer</option>
                                        <option value="Staff"  >Auction staff</option>
                                        <option value="Admin"  >Administrator</option>
                                    </select>
                                    <script>
                                        <%
                                            if (user.getRole().equalsIgnoreCase("Admin")) {
                                        %>
                                        document.getElementById("cb1").selectedIndex = "2";
                                        <%
                                        } else if (user.getRole().equalsIgnoreCase("Staff")) {
                                        %>
                                        document.getElementById("cb1").selectedIndex = "1";
                                        <%
                                        } else if (user.getRole().equalsIgnoreCase("Customer")) {
                                        %>
                                        document.getElementById("cb1").selectedIndex = "0";
                                        <%                              
                                        } else {
                                        %>
                                        document.getElementById("cb1").selectedIndex = "";
                                        <%
                                            }
                                        %>
                                    </script>
                                </h2>
                            </div>	
                        </div>
                        <div class="user_name_common">
                            <p>Status <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2>
                                    <select name="cb2" class=" text_bg select" id="cb2" >	
                                        <option value="Active">Activated</option>
                                        <option value="Deactive">Deactivated</option>
                                    </select>
                                    <script>
                                        <%
                                            if (user.getStatus().equalsIgnoreCase("Active")) {
                                        %>
                                        document.getElementById("cb2").selectedIndex = "0";
                                        <%
                                        } else {
                                        %>
                                        document.getElementById("cb2").selectedIndex = "1";
                                        <%
                                            }
                                        %>
                                    </script>
                                </h2>
                            </div>
                        </div>
                        <div class="user_name_common">
                            <p>Full name <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2><input type="text" class="textbox" title="Full Name" value="<%=user.getFullname()%>" name="fullname"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Phone number <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2><input type="text" class="textbox" title="Phone Number" maxlength="20" value="<%=user.getPhonenumber()%>" name="phonenumber"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Address <span class="red">*</span>:</p>
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
                                            <input type="hidden" name="service" id="service" value="edituser">
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
