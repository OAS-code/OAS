<%-- 
    Document   : AddUser
    Created on : Jul 9, 2014, 10:48:39 PM
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
        <title>Edit user</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
        <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
          <h2 style="margin: auto;margin-left: 10px">Edit user</h2> 
        <form name="form1" method="post" action="EditProcess.jsp">
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
                    user.setStatus(rs.getBoolean(8));
                }
            %>
            <table>
                <% String action = "";%>
                <% String action1 = "";%>               
                <%

                    if (user.getStatus() == true) {
                        action = "active";
                        action1 = "deactive";
                    } else {
                        action = "deactive";
                        action1 = "active";
                    }
                %>
                <input type="hidden" name="no" id="no" value="<%=user.getId()%>"></td>
                <tr>
                    <td style="text-align: right">Username:</td>
                    <td>
                        <input type="text" name="username" id="username" value="<%=user.getUsername()%>" readonly></td>
                </tr>
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
                    <td style="text-align: right">Status:</td>
                    <td>
                        <p>
                            <label>
                                <input name="Status" type="radio" id="active" value="active">
                                Active</label>
                            <br>
                            <label>
                                <input type="radio" name="Status" value="deactive" id="deactive">
                                Deactive</label>
                            <br>
                        </p>
                        <script>
                            <%
                                if (action.equals("deactive")) {
                            %>
                            document.getElementById("deactive").checked = true;
                            <%
                            } else {
                            %>
                            document.getElementById("active").checked = true;
                            <%
                                }
                            %>
                        </script></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="save" id="save" value="Save">
                        <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location='UserController?service=listall';">
                    </td>
                </tr>
            </table>
        </form>
        </div>
        </div>
    </body>
</html>
