<%-- 
    Document   : Admin_Insert
    Created on : 08-Oct-2021, 10:47:13
    Author     : ADMINS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ControllerAdmin_new?action=insert" method="POST">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Register" /></td>
                    <td><input type="submit" value="Reset" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
