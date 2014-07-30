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
        <title>User information</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
        <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
          <h2 style="margin: auto;margin-left: 10px">User information</h2>  
        <form name="form1" method="post" action="UserController" style="width: 350px;margin: auto;margin-top: 10px;margin-bottom: 20px;">
         
            <%
                ResultSet rs = (ResultSet)request.getAttribute("rs");
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
                <input type="hidden" name="no" id="no" value="<%=user.getId()%>" readonly></td>               
                <tr>
                    <td style="text-align: right">Full name: </td>
                    <td><%=user.getFullname()%></td>
                </tr>                
                <tr>
                    <td style="text-align: right">Phone number: </td>
                    <td><%=user.getPhonenumber()%></td>
                </tr>
                <tr>
                    <td style="text-align: right">Email: </td>
                    <td><%=user.getEmail()%></td>
                </tr>
                <tr>
                    <td style="text-align: right">Address: </td>
                    <td><%=user.getAddress()%></td>
                </tr>
                <tr>
                    <td style="text-align: right">Username: </td>
                    <td><%=user.getUsername()%></td>
                </tr>
                <tr>
                    <td style="text-align: right">Role: </td>
                    <td><%=user.getRole()%></td>
                </tr>
                <tr>
                    <td style="text-align: right">Status: </td>
                    <td><%=user.getStatus()%></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" name="Edit" id="Edit" value="Edit" onclick="window.location='EditUser.jsp?id=<%=user.getId()%>';">
                        <input type="submit" name="delete" id="delete" value="Delete" onclick="return confirm('Are you sure?')">
                        <input type="hidden" name="service" id="service" value="deleteuser">
                    </td>
                </tr>
            </table>
        </form>
        </div>
        </div>
    </body>
</html>
