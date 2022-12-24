
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAOAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
//            DAOAdmin dao = new DAOAdmin();
//            ResultSet rs = dao.getData("select * from Admin");
            ResultSet rs = (ResultSet) request.getAttribute("kq");
            String title = (String) request.getAttribute("title");
        %>
        <p><a href="ControllerAdmin_new?action=insert">Insert Admin</a></p>
        <table border="1">
            <caption><%=title%></caption>
            <thead>
                <tr>
                    <th>Admin ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% while(rs.next()){%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><a href="ControllerAdmin_new?action=update&adminID=<%=rs.getString(1)%>">Update</a></td>
                    <td><a href="ControllerAdmin_new?action=delete&adminID=<%=rs.getString(1)%>">Delete</a></td>
                </tr>
                <%}%>
            </tbody>
        </table>

    </body>
</html>
