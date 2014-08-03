<%-- 
    Document   : ChangePassword
    Created on : Aug 3, 2014, 11:22:38 PM
    Author     : ducfpt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
       <script language="javascript">
            function fncSubmit()
            {

                if (document.ChangePasswordForm.OldPassword.value == "")
                {
                    alert('Please input old password');
                    document.ChangePasswordForm.OldPassword.focus();
                    return false;
                }

                if (document.ChangePasswordForm.newpassword.value == "")
                {
                    alert('Please input Password');
                    document.ChangePasswordForm.newpassword.focus();
                    return false;
                }

                if (document.ChangePasswordForm.conpassword.value == "")
                {
                    alert('Please input Confirm Password');
                    document.ChangePasswordForm.conpassword.focus();
                    return false;
                }

                if (document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
                {
                    alert('Confirm Password Not Match');
                    document.ChangePasswordForm.conpassword.focus();
                    return false;
                }

                document.ChangePasswordForm.submit();
            }
        </script>
        <form name="ChangePasswordForm" method="post" action="ChangePasswordProcess.jsp" OnSubmit="return fncSubmit();">

            <table border="1" align="center" >

                <tr>
                    <td>Old Password</td>
                    <TD><input name="OldPassword" type="password" id="OLDpwd" size="20"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input name="newpassword" type="password" id="newpassword">
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input name="conpassword" type="password" id="conpassword">
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" name="Submit" value="Save"></td>
                </tr>

            </table>
    </body>
</html>
