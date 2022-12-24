<%@page import="ShoppingOnline_Cart.Cart_Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String check = (String) session.getAttribute("check");
%>
<% if (check.equals("true")) {%>
<p style="text-align: center; margin-left: 20px; font-size: 30px; margin-bottom: 25px; font-family: sans-serif;">
    Giỏ hàng của bạn đang rỗng
</hp>
<div style="display: block; margin: 70px 200px 200px 300px; width: 52%">
    <p style=" text-align: center; ;font-size: 19.5px;"> 
        Thật tiếc! Chúng tôi biết bạn đang muốn mua món đồ gì đó
        <br>
        nhưng trước tiên bạn cần thêm món đồ đó vào giỏ hàng của mình 
        <br>
        Nhấn 
        <a href="Controller_TrangChu" style="text-decoration: underline">vào đây</a>
        để tiếp tục mua sắm.</p>
</div>
<%}%> 
<% if (check.equals("false")) {%>  
<p style="text-align: left; margin-left: 20px; font-size: 30px; margin-bottom: 25px; font-family: sans-serif;">Giỏ hàng</hp>
<div class="container"> 
    <table id="cart" class="table table-hover table-condensed"> 
        <thead> 
            <tr> 
                <th style="width:50%">Tên sản phẩm</th> 
                <th style="width:10%">Giá</th> 
                <th style="width:8%">Số lượng</th> 
                <th style="width:22%" class="text-center">Thành tiền</th> 
                <th style="width:10%">Xóa</th> 
            </tr> 
        </thead> 
        <tbody>

            <%
                ArrayList<Cart_Item> listCart = (ArrayList<Cart_Item>) session.getAttribute("cart");
                for (Cart_Item prod : listCart) {
            %>
            <tr> 
                <td data-th="Product"> 
                    <div class="row"> 
                        <div class="col-sm-2 hidden-xs"><img src="<%= prod.getImage()%>" width="100px" height="100px;">
                        </div> 
                        <div class="col-sm-10"> 
                            <p class="nomargin" style="font-weight:bold; margin-top: 40px; font-family: sans-serif;"><%= prod.getName()%></p> 
                        </div> 
                    </div> 
                </td> 
                <td data-th="Price" style="padding-top: 40px"><%= prod.getPrice()%> $</td> 
                <td data-th="Quantity"><a href="TheCart_Add?action=updateNewQuan&id=<%=prod.getProductID()%>">
                    <input class="form-control text-center" value="<%= prod.getQuantity()%>" type="number" style="margin-top: 25px">
                    </a>
                </td> 
                <td data-th="Subtotal" class="text-center" style="padding-top: 40px"><%= prod.getTotal()%> $</td> 
                <td class="actions" data-th="">
                    <div style="margin-top: 32px; display: block; ">
                        <a onclick="testConfirmDialog()" href="TheCart_Remove?action=remove&pid=<%=  prod.getProductID()%>">
                            <i class="far fa-trash-alt fa-lg"></i>
                        </a>
                    </div>
                </td> 
            </tr>
            <%}%>
        </tbody><tfoot> 
            <tr> 
                <td style="margin-top: 30px;"><a href="Controller_TrangChu" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                </td> 
                <td colspan="2" class="hidden-xs" style="padding-left: 130px; font-weight: bold; padding-top: 30px;">Tổng tiền:</td> 
                <%
                    double sum = 0;
                    for (int i = 0; i < listCart.size(); i++) {
                        sum = sum + listCart.get(i).getTotal();
                    }
                %>
                <td class="hidden-xs text-center" style="padding-top: 30px;"><strong><%=sum%>$</strong>
                </td> 
                <td>
                    <%
                        String name = (String) request.getAttribute("name");
                    %>
                    
                    <% if (name.equals("TÀI KHOẢN")){%>
                        <a href="ControllerUser_Login" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
                    <%}else{%>
                        <a href="ControllerUser_Checkout" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
                    <%}%>
                </td> 
            </tr> 
        </tfoot> 
        <%}%>
    </table>
</div>
<script type="text/javascript">
    function testConfirmDialog(){
        var result = confirm("Bạn chắc chắn muốn xóa sản phẩm khỏi giỏ hàng ?");
        var check;
        if(result){
            alert("Xóa thành công!");
            check = true;
        }else{
            alert("Tác vụ đã hủy!");
            check = false;
            }
        }
</script>
<script src="js/bootstrap.min.js"></script>
