<%-- 
    Document   : Admin_Update
    Created on : 08-Oct-2021, 10:46:51
    Author     : ADMINS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("ud");
        %>
        <form action="ControllerAdmin_new?action=update" method="POST">
            <table>
                <% if(rs.next()) {%>
                <tr>
                    <td>Admin Id</td>
                    <td><input type="text" name="adminID" value="<%=rs.getString(1)%>" /></td>
                </tr>
                
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" value="<%=rs.getString(2)%>" /></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" value="<%=rs.getString(3)%>" /></td>
                </tr>
                <%}%>
                
                <tr>
                    <td><input type="submit" name="submit" value="Update" /></td>
                    <td><input type="submit" value="Reset" /></td>
                </tr>
                
            </table>
        </form>
    </body>
</html>
