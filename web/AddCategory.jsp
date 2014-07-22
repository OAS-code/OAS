<%-- 
    Document   : AddCategory
    Created on : Jul 22, 2014, 10:50:14 PM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Add new Category</h2> 
                <br>
                <form name="form1" method="post" action="CategoryController">
                    <table>           
                        <tr>
                            <td style="text-align: right">Name:</td>
                            <td>
                                <input type="text" name="name" id="name" >
                            </td>
                        </tr>                          
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="add" id="add" value="Add">
                                <input type="hidden" name="service" id="service" value="addcategory">
                                <input type="reset" name="reset" id="reset" value="Clear">
                                <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location = 'CategoryController?service=listall';">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
