<%-- 
    Document   : edit_profile
    Created on : Aug 4, 2014, 10:42:08 AM
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
        <title>JSP Page</title>
    </head>
    <body>
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
                    <td style="text-align: right">Phone number:</td>
                    <td><label for="phonenumber"></label>

                        <input type="text" name="phonenumber" id="phonenumber" value="<%=user.getPhonenumber()%>"></td>
                </tr>
                <tr>
                    <td style="text-align: right">Address:</td>
                    <td><label for="address"></label>                     
                        <textarea name="address" id="address" ><%=user.getAddress()%></textarea></td>
                </tr>
                </tr>
                </tr>                       
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="save" id="save" value="Save">
                        <input type="hidden" name="service" id="service" value="edit_profile">
                        <input type="reset" name="reset" id="reset" value="Clear" onclick='clear();'>
                        <input type="button" name="cancel" id="cancel" value="Cancel" onclick="window.location = 'UserController?service=listall';">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
