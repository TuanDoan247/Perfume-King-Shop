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
            ResultSet rsUpdate = (ResultSet) request.getAttribute("rsUpdate");
            ResultSet rsProduct = (ResultSet) request.getAttribute("rsProduct");
            ResultSet rsBill = (ResultSet) request.getAttribute("rsBill");

        %>
        <h2 style="margin-left: 80px; margin-bottom: 30px;">Update Product</h2>
        <div class="row">
            <div class="col-75">
                <div class="container">
                    <form action="ControllerBillDetail_new?action=update" method="POST">
                        <div class="row">
                            <div class="col-50">
                                <h3>Information Product</h3>
                                <label for="id"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Product ID</label>
                                <select name="pid" size="1">
                                    <% while (rsProduct.next()) {%>
                                    <option name="pid" value="<%=rsProduct.getString(1)%>"><%=rsProduct.getString(2)%></option>
                                    <%}%>
                                </select>
                                <label for="id"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Bill ID</label>
                                <select name="oid" size="1">
                                    <% while (rsBill.next()) {%>
                                    <option name="oid" value="<%=rsBill.getString(1)%>"><%=rsBill.getString(1)%></option>
                                    <%}%>
                                </select>
                                <% if(rsUpdate.next()) {%>
                                
                                <label for="quantity"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Quantity</label>
                                <input type="text" id="quantity" name="quantity" value="<%=rsUpdate.getInt(3)%>">
                                
                                <label for="price"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Price</label>
                                <input type="text" id="price" name="price" value="<%=rsUpdate.getInt(4)%>">
                                
                                <label for="total"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Total</label>
                                <input type="text" id="total" name="total" value="<%=rsUpdate.getInt(5)%>">
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