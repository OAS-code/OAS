<%-- 
    Document   : AddUser12
    Created on : Jul 10, 2014, 9:18:46 AM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add user</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Add new user</h2> 
                <br>
                <form name="form1" method="post" action="AddProcess.jsp">
                    <table>
                        <tr>
                            <td style="text-align: right">Username:</td>
                            <td>
                                <input type="text" name="username" id="username">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Fullname:</td>
                            <td>
                                <input type="text" name="fullname" id="fullname" >
                            </td>
                        </tr>              
                        <tr>
                            <td style="text-align: right">Password:</td>
                            <td><label for="password"></label>

                                <input type="text" name="password" id="password"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Phone number:</td>
                            <td><label for="phonenumber"></label>

                                <input type="text" name="phonenumber" id="phonenumber"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Email:</td>
                            <td><label for="email"></label>

                                <input type="text" name="email" id="email"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Address:</td>
                            <td>                    
                                <textarea name="address" id="address" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Status:</td>
                            <td>
                                <p>
                                    <label>
                                        <input name="Status" type="radio" id="active" value="active" checked="checked">
                                        Activated</label>
                                    <br>
                                    <label>
                                        <input type="radio" name="Status" value="deactive" id="deactive">
                                        Deactive</label>
                                    <br>
                                </p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="add" id="add" value="Add">
                                <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location = 'UserController?service=listall';">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
