<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Product</title>
    </head>
    <body>
        <%
            String username = (String) session.getAttribute("namelogin");
            if(session != null){
                out.print("Welcome " + username);
            }else{
                out.print("Welcome to Store");
            }
        %>
        <h2>The Cart</h2>
            <h4><a href="Project_ShowCart.jsp">Show Cart</a></h4>
        <h1>List Information Of Product</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Category Id</th>
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("products");
                    for(Product pro : list) {
                %>
                    <tr>
                        <td><%= pro.getPid() %></td>
                        <td><%= pro.getPname() %></td>
                        <td><%= pro.getQuantity() %></td>
                        <td><%= pro.getPrice() %></td>
                        <td><img src="<%= pro.getImage()%>"/></td>
                        <td><%= pro.getDescription() %></td>
                        <td><%= pro.getStatus() %></td>
                        <td><%= pro.getCateID() %></td>
                        <td><a href="TheCart_Add?pid=<%= pro.getPid()%>">Add Cart</a></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
            <h3><a href="ControllerUser_Checkout">Checkout</a></h3>
            <h4><a href="ControllerUser_Logout">Logout</a></h4>
    </body>
</html>
