<%-- 
    Document   : register
    Created on : Jul 22, 2014, 1:33:34 PM
    Author     : NamNV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Register</h2> 
                <br>

                <form action="UserController" method="POST">
                    <table>
                        <tr>
                            <td style="text-align: right">Username:</td>
                            <td>
                                <input type="text" name="username" id="username">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Password:</td>
                            <td><label for="password"></label>
                                <input type="password" name="password" id="password">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Retype Password:</td>
                            <td><label for="password"></label>
                                <input type="password" name="cpassword" id="password">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Full name:</td>
                            <td>
                                <input type="text" name="fullname" id="fullname" >
                            </td>
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
                            <td></td>
                            <td>
                                <input type="submit" name="add" id="add" value="Submit">
                                <input type="hidden" name="service" id="service" value="registerUser">
                                <input type="reset" name="reset" id="reset" value="Clear">

                            </td>
                        </tr>
                    </table>
                </form>
                </body>
                </html>
