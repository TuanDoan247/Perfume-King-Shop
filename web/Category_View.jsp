<%-- 
    Document   : CategoryView
    Created on : 04-Oct-2021, 13:41:22
    Author     : ADMINS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAOCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
//            DAOCategory dao = new DAOCategory();
//            ResultSet rs = dao.getData("select * from Category");
              ResultSet rs = (ResultSet) request.getAttribute("kq");
              String title = (String) request.getAttribute("title");
        %>
        
         <p><a href="ControllerCategory_new?action=insert">Insert Category</a></p>
        <table border="1">
            <caption><%=title%></caption>
            <thead>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Status</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% while(rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=(rs.getInt(3)==1?"Active":"Deactive")%></td>
                    <td><a href="ControllerCategory_new?action=update&cateID=<%=rs.getString(1)%>">update</a></td>
                    <td><a href="ControllerCategory_new?action=delete&cateID=<%=rs.getString(1)%>">delete</a></td>
                </tr>
                <%}%>
            </tbody>
        </table>

    </body>
</html>
