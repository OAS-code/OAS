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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage user</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Manage user</h2> 
                <form name="form1" method="post" action="UserController">
                    <br>
                    <td>
                        <input type="button" name="add" id="add" value="Add new user" onclick="window.location = 'AddUser.jsp';">
                    </td>
                    <p>
                    <td>
                        <label>Keyword:</label>
                        <input type="text" name="txtsearch" id="txtsearch">
                        <label>User type:</label>
                        <select name="user_type" id="user_type">
                            <option value="" selected="selected">Select</option>
                            <option value="Admin"  >Admin</option>
                            <option value="Customer"  >Customer</option>
                            <option value="Staff"  >Auction staff</option>
                        </select>                       
                    </td>
                    <td>
                        <label>Status:</label>
                        <select name="status" id="status">
                            <option value="" selected="selected">Select</option>
                            <option value="Active">Active</option>
                            <option value="Deactive">Deactive</option>
                        </select> 
                        <input type="submit" name="search" id="search" value="Search">
                        <input type="hidden" name="service" id="service" value="search">
                        <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'UserController?service=listall'">
                    </td>
                        <label>Result</label>
                        <input type="text" id="result" readonly>
                    </td>
                    <p>
                    <td> 

                        <table width="90%" border="1px">
                            <tr>
                                <th>No.</th>
                                <th>Full name</th>
                                <th>Username </th>
                                <th>User type</th>
                                <th>Status</th>
                            </tr>              
                            <jsp:useBean id="arr" class="java.util.ArrayList" scope="request">
                            </jsp:useBean>
                            <c:forEach var="user" items="${arr}" varStatus="status"> 
                                <tr> 
                                    <script type="text/javascript">
                                    var elem = document.getElementById("result");
                                    elem.value = "${status.count}";
                                    </script>
                                    <td>${status.count}</td> 
                                    <td>${user.fullname}</td>
                                    <td><a href="UserController?service=viewdetail&userid=${user.id}">${user.username}</a></td>
                                    <td>${user.role}</td>
                                    <td>${user.status}</td>                         
                                </tr>
                            </c:forEach>
                        </table>
                </form> 
            </div>
        </div>
    </body>
</html>
