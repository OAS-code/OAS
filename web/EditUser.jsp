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
        <title>Edit user</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Edit user</h2> 
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
                    <table>
                        <input type="hidden" name="no" id="no" value="<%=user.getId()%>"></td>               
                        <tr>
                            <td style="text-align: right">Fullname:</td>
                            <td><label for="fullname"></label>

                                <input type="text" name="fullname" id="fullname" value="<%=user.getFullname()%>"></td>
                        </tr>       
                        <tr>
                            <td style="text-align: right">Username:</td>
                            <td>
                                <input type="text" name="username" id="username" value="<%=user.getUsername()%>" readonly></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Phone number:</td>
                            <td><label for="phonenumber"></label>

                                <input type="text" name="phonenumber" id="phonenumber" value="<%=user.getPhonenumber()%>"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Email:</td>
                            <td><label for="email"></label>

                                <input type="text" name="email" id="email" value="<%=user.getEmail()%>"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Address:</td>
                            <td><label for="address"></label>                     
                                <textarea name="address" id="address" ><%=user.getAddress()%></textarea></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Role:</td>                          
                            <td>                    
                                <select name="cb1" id="cb1">
                                    <option value="Customer">Customer</option>
                                    <option value="Staff">Auction staff</option>
                                    <option value="Admin">Admin</option>
                                </select>
                            </td>    
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
                            } else {
                            %>
                            document.getElementById("cb1").selectedIndex = "0";
                            <%
                                }
                            %>
                        </script>
                        </tr>
                        <tr>
                            <td style="text-align: right">Status:</td>                          
                            <td>                    
                                <select name="cb2" id="cb2">
                                    <option value="Active">Active</option>
                                    <option value="Deactive">Deactive</option>
                                </select>
                            </td>    
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
                        </tr>                       
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="save" id="save" value="Save">
                                <input type="hidden" name="service" id="service" value="edituser">
                                <input type="reset" name="reset" id="reset" value="Clear" onclick='clear();'>
                                <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location = 'UserController?service=listall';">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
