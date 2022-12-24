<%@page import="ShoppingOnline_Cart.Cart_Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="Project_css/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="Project_css/CheckOut.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    ResultSet rsCus = (ResultSet) request.getAttribute("rsCus");
    ArrayList<Cart_Item> listCart = (ArrayList<Cart_Item>) session.getAttribute("cart");
%>
<h2>Thông Tin Hóa Đơn Khách Hàng</h2>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="ControllerUser_Checkout">
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <%if(rsCus.next()){%>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="cname" value="<%=rsCus.getString(2)%>">
            <label for="phone"><i class="fa fa-envelope"></i>Phone</label>
            <input type="text" id="phone" name="cphone" value="<%=rsCus.getString(3)%>">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="caddress" value="<%=rsCus.getString(4)%>">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" value="Hà Nội">
            <%}%>
            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
        <input onclick="myFunction()" type="submit" name="submit"value="Continue to checkout" class="btn">
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
        <%
            double sum = 0;
            int quantityProduct = 0;
            for (int i = 0; i < listCart.size(); i++) {
                sum = sum + listCart.get(i).getTotal();
                quantityProduct = quantityProduct + i;
            }
        %>
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>(<%=quantityProduct%>)</b></span></h4>
      
      <%for (Cart_Item prod : listCart) {%>
      <p><a href="TheCart_Add?action=viewProd"><%= prod.getName()%></a> <span class="price"><%= prod.getPrice()%> $</span></p
      <%}%>
      <hr>
      <p style="font-weight: bold; padding-top: 25px;">Total: <span class="price" style="color:black;"><b style="margin-left: 50px; display: block;"><%=sum%></b></span></p>
    </div>
  </div>
</div>
<script>
function myFunction() {
  alert("Thanh Toán Thành Công");
}
</script>
</body>
</html>

