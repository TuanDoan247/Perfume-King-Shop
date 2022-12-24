<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="Project_css/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="Project_css/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="Project_css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Project_css/Update.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            ResultSet rsCate = (ResultSet) request.getAttribute("rsCate");
            ResultSet rs = (ResultSet) request.getAttribute("rs");
        %>
        <h2 style="margin-left: 80px; margin-bottom: 30px;">Update Product</h2>
        <div class="row">
            <div class="col-75">
                <div class="container">
                    <form action="ControllerProduct_new?action=update" method="POST">
                        <div class="row">
                            <div class="col-50">
                                <h3>Information Product</h3>
                                <label for="id"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Category ID</label>
                                <select name="cate" size="1">
                                    <% while (rsCate.next()) {%>
                                    <option value="<%=rsCate.getInt(1)%>"><%=rsCate.getString(2)%></option>
                                    <%}%>
                                </select>
                                <%if (rs.next()) {%>
                                <label for="id"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Product ID</label>
                                <input type="text" id="id" name="pid" value="<%=rs.getString(1)%>">
                                <label for="name"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Product Name</label>
                                <input type="text" id="name" name="pname" value="<%=rs.getString(2)%>">
                                <label for="quantity"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Quantity</label>
                                <input type="text" id="quantity" name="quantity" value="<%=rs.getInt(3)%>">
                                <label for="price"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Price</label>
                                <input type="text" id="price" name="price" value="<%=rs.getDouble(4)%>">
                                <label for="image"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Image</label>
                                <input type="text" id="image" name="image" value="<%=rs.getString(5)%>">
                                <label for="description"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Description</label>
                                <input type="text" id="description" name="des" value="<%=rs.getString(6)%>">
                                <label for="status"><i class="far fa-check-circle" style="margin-right: 10px;"></i> Status</label>
                                <input type="radio" id="status" name="status" value="1" <%=(rs.getInt(7) == 1 ? "checked" : "")%>/>Enable
                                <input type="radio" id="status" name="status" value="0" <%=(rs.getInt(7) == 0 ? "checked" : "")%>/>Disnable
                                <%}%>
                            </div>
                        </div>
                        <input type="submit" value="Update Product"  name="submit" class="btn">
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>