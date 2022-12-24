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
            ResultSet rsCate = (ResultSet) request.getAttribute("rsCate");
        %>
        <form action="ControllerProduct_new?action=insert" method="POST">
            <table border="0">
                <tr>
                    <td>Category: </td>
                    <td>
                        <select name="cate" size="1">
                            <% while (rsCate.next()) {%>
                            <option value="<%=rsCate.getInt(1)%>"><%=rsCate.getString(2)%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Product ID:</td>
                    <td><input type="text" name="pid" value="" /></td>
                </tr>

                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="pname" value="" /></td>
                </tr>

                <tr>
                    <td>Quantity:</td>
                    <td><input type="text" name="quantity" value="" /></td>
                </tr>

                <tr>
                    <td>Price: </td>
                    <td><input type="text" name="price" value="" /></td>
                </tr>

                <tr>
                    <td>Image Name:</td>
                    <td><input type="text" name="image" value="" /></td>
                </tr>

                <tr>
                    <td>Description :</td>
                    <td><input type="text" name="des" value="" /></td>
                </tr>

                <tr>
                    <td>status</td>
                    <td>
                        <input type="radio" name="status" value="1" />Enable
                        <input type="radio" name="status" value="0" />Disable
                    </td>
                </tr>

                <tr>
                    <td>
                    <input type="submit" value="Add" name="submit" />
                    <input type="submit" value="Reset" />
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
