<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ControllerCustomer_new?action=insert" method="POST">
            <table>
                <tr>
                    <td>CName</td>
                    <td><input type="text" name="cname" value="" /></td>
                </tr>

                <tr>
                    <td>CPhone</td>
                    <td><input type="text" name="cphone" value="" /></td>
                </tr>

                <tr>
                    <td>CAddress</td>
                    <td><input type="text" name="caddress" value="" /></td>
                </tr>

                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" value="" /></td>
                </tr>

                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" value="" /></td>
                </tr>

                <tr>
                    <td>status</td>
                    <td>
                        <input type="radio" name="status" value="1" />Enable
                        <input type="radio" name="status" value="0" />Disnable
                    </td>
                </tr>

                <tr>
                    <td><input type="submit" value="Add" name="submit" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
            </table>

        </form>
    </body>
</html>
