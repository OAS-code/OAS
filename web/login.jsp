<%-- 
    Document   : login
    Created on : Jul 21, 2014, 11:22:32 PM
    Author     : NamNV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
       <div style="width: 500px;margin: auto;">
        <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
         <h2 style="margin: auto;margin-left: 10px">Login</h2> 
        <form action="UserController" method="POST">
            Username <input type="text" name="txtUsername" value=""/><br/>
            Password <input type="password" name="txtPass" value=""/><br/>
            <input type="submit" value="Login" name="service"/>
            <input type="reset" value="Reset"/>
        </form>
        </div>
       </div>
    </body>
</html>
