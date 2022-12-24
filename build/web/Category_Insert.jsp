<%-- 
    Document   : Category_Insert
    Created on : 08-Oct-2021, 09:28:34
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
        <form action="ControllerCategory_new?action=insert" method="POST">
            <table border="0">
                <tr>
                    <td>Cate Name</td>
                    <td><input type="text" name="catename" value="" /></td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td>
                        <input type="radio" name="status" value="1" />Enable
                        <input type="radio" name="status" value="0" />Disnable
                    </td>
                </tr>

                <tr>
                    <td><input type="submit" value="ADD" name="submit" /></td>
                    <td><input type="submit" value="Reset" /></td>
                </tr>
            </table>

        </form>
    </body>
</html>
