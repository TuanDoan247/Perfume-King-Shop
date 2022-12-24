<%@page import="entity.Customer"%>
<%@page import="model.DAOCustomer"%>
<%@page import="ShoppingOnline_Cart.Cart_Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Cart</title>
        <style>
            #final{
                margin-left: 300px;
            }

            #final li{
                margin-left: 20px;
                margin-right: 10px;
                padding: 10px;
                display: inline;
            }

            table thead tr th{
                padding:5px 20px;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<Cart_Item> listCart = (ArrayList<Cart_Item>) session.getAttribute("cart");
        %>
        <% if (listCart.isEmpty()) {%>
            <h2>Cart is Empty !</h2>
        <%} else {%>
            <h1>Show Cart</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Cart_Item prod : listCart) {%>
                        <tr>
                            <td><%= prod.getProductID()%></td>
                            <td><%= prod.getName()%></td>
                            <td><%= prod.getPrice()%></td>
                            <td><%= prod.getQuantity()%></td>
                            <td><img src="<%= prod.getImage()%>"/></td>
                            <td><%= prod.getTotal()%></td>
                            <td><a href="TheCart_Remove?action=remove&pid=<%=  prod.getProductID()%>">Remove</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                    <ul id="final">
                        <li>Total</li>

                        <%
                            double sum = 0;
                            for (int i = 0; i < listCart.size(); i++) {
                                sum = sum + listCart.get(i).getTotal();
                            }
                        %>
                        <li><%=sum%></li>

                        <li><a href="TheCart_Remove?action=removeall">Remove All</a></li>
                    </ul>
        <%}%>   
            <h2>The Product</h2>
            <h4><a href="ShoppingOnline_ListProduct.jsp" > List Product</a></h4>
    </body>
</html>
