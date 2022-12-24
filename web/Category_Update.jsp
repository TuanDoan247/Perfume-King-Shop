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
            ResultSet rs = (ResultSet) request.getAttribute("kq");
        %>
        <form action="ControllerCategory_new?action=update" method="POST">
            <table border="0">
                <% if(rs.next()) {%>
                <tr>
                    <td>Cate ID</td>
                    <td><input type="text" name="cateID" value="<%=rs.getString(1)%>" /></td>
                </tr>
                
                <tr>
                    <td>Cate Name</td>
                    <td><input type="text" name="catename" value="<%=rs.getString(2)%>" /></td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td>
                        <input type="radio" name="status" value="1" <%=(rs.getInt(3)==1?"checked":"")%> />Enable
                        <input type="radio" name="status" value="0" <%=(rs.getInt(3)==0?"checked":"")%>/>Disable
                    </td>
                </tr>
                <%}%>
                
                <tr>
                    <td><input type="submit" value="ADD" name="submit" /></td>
                    <td><input type="submit" value="Reset" /></td>
                </tr>
                
            </table>

        </form>
    </body>
</html>
