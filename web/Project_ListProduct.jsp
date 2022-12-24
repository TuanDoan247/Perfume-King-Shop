<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAOProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Product> listPro = (ArrayList<Product>) session.getAttribute("products");
    for (Product pro : listPro) {
%>
    <div id="Product" class="col-md-3">
        <a href="TheCart_Add?action=prodDetail&pid=<%= pro.getPid()%>" ><img src="<%= pro.getImage() %>"/></a>
        <p id="Pname"><%= pro.getPname() %></p>
        <p id="price">Price: <%= pro.getPrice() %> $</p>
        <a id="add" onclick="myFunction()" href="TheCart_Add?action=addProd&pid=<%= pro.getPid()%>"><i class="fas fa-cart-plus fa-2x" style="color: #ff922b;"></i></a>
    </div>
<%}%>

<script>
function myFunction() {
  alert("Thêm Vào Giỏ Hàng Thành Công");
}
</script>




