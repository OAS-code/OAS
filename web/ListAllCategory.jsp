<%-- 
    Document   : ListAllCategory
    Created on : Jul 22, 2014, 10:23:14 PM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Category"%>
<%@page import="DAO.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>       
        <title>Manage Category</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 700px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Manage category</h2> 
                <form name="form1" method="post" action="CategoryController">
                    <br>
                    <td>
                        <input type="button" name="add" id="add" value="Add new category" onclick="window.location = 'AddCategory.jsp';">
                    </td>
                    <p>
                    <td>
                        <label>Keyword:</label>
                        <input type="text" name="txtsearch" id="txtsearch">                                             
                    </td>
                    <td>                      
                        <input type="submit" name="search" id="search" value="Search">
                        <input type="hidden" name="service" id="service" value="search">
                        <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'CategoryController?service=listall';">
                    </td>
                    <label>Result</label>
                    <input type="text" id="result" readonly>
                    </td>
                    <p>                       
                </form> 
            </div>
        </div>
    </body>
</html>
