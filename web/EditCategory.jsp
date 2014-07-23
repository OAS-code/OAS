<%-- 
    Document   : EditCategory
    Created on : Jul 22, 2014, 11:32:41 PM
    Author     : MrTu
--%>
<%@page import="Entity.Category"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%response.setContentType("text/html; charset=UTF-8");%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Edit user</h2> 
                <form name="form1" method="post" action="CategoryController">
                    <%
                        CategoryDAO dao = new CategoryDAO();
                        String id = request.getParameter("categoryid");
                        ResultSet rs = dao.search(Integer.parseInt(id));
                        Category category = new Category();
                        if (rs.next()) {
                            category.setCategoryid(rs.getInt(1));
                            category.setName(rs.getString(2));
                        }
                    %>
                    <table>
                        <input type="hidden" name="categoryid" id="categoryid" value="<%=category.getCategoryid()%>"></td>               
                        <tr>
                            <td style="text-align: right">Name:</td>
                            <td>
                                <input type="text" name="name" id="name" value="<%=category.getName()%>">
                            </td>
                        </tr>                                              
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="save" id="save" value="Save">
                                <input type="hidden" name="service" id="service" value="edit">
                                <input type="reset" name="reset" id="reset" value="Clear" onclick='clear();'>
                                <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location = 'CategoryController?service=listall';">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
