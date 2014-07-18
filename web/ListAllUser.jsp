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
                <label>Keyword</label>
                <input type="text" name="txtsearch" id="txtsearch">
                <input type="submit" name="search" id="search" value="Search">
                <input type="hidden" name="service" id="service" value="search">
            </td>
            <p>
            <td> 

                <table width="90%" border="1px">
                    <tr>
                        <th>No.</th>
                        <th>Fullname</th>
                        <th>Username </th>
                        <th>Status</th>
                    </tr>              
                    <jsp:useBean id="arr" class="java.util.ArrayList" scope="request">
                    </jsp:useBean>
                    <c:forEach var="user" items="${arr}" varStatus="status"> 
                        <tr> 
                            <td>${status.count}</td> 
                            <td>${user.fullname}</td>
                            <td><a href="UserController?service=viewdetail&id=${user.id}">${user.username}</a></td>
                                <c:choose>
                                    <c:when test="${user.status==true}">
                                    <td>Active</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Deactive</td>   
                                </c:otherwise>
                            </c:choose>                           
                        </tr>
                    </c:forEach>
                </table>
        </form> 
        </div>
        </div>
    </body>
</html>
