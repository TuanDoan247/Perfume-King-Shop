<%@page import="ShoppingOnline_Cart.Cart_Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Project_css/ShowDetailProduct.css" rel="stylesheet" type="text/css">
        <link href="Project_css/Footer.css" rel="stylesheet" type="text/css">
        <link href="Project_css/TrangChu.css" rel="stylesheet" type="text/css">
        <link href="Project_css/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="Project_css/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="Project_css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="top" style="width: 100%; height: 50px;">
            <%
                String usernameLogin = (String) session.getAttribute("namelogin");
                String usernameSignup = (String) session.getAttribute("namesignup");
                String name = "TÀI KHOẢN";
                int statuscheck = 1;

                if (usernameLogin != null) {
                    name = usernameLogin;
                    statuscheck = 0;
                }

                if (usernameSignup != null) {
                    name = usernameSignup;
                    statuscheck = 0;
                }

            %>

            <div id="part1">
                <div class="part1-infro">
                    <ul class="menu clearfix">
                        <li><a href="#"><%=name%></a>
                            <ul>
                                <%if (statuscheck == 1) {%>
                                <li><a href="ControllerUser_Login">Đăng nhập</a></li>
                                <li><a href="ControllerUser_Signup">Đăng ký</a></li>
                                    <%}%>
                                    <%if (statuscheck == 0) {%>
                                <li><a href="#">Thông tin</a></li>
                                <li><a href="ControllerUser_Logout">Đăng xuất</a></li>
                                    <%}%>
                            </ul>
                        </li>
                        <li><i class="far fa-user-circle fa-lg" style="color: white;"></i></li>
                            <%
                                String check = (String) session.getAttribute("check");
                            %>
                            <% if (check.equals("true")) {%>
                        <li> <a href="TheCart_Add?action=viewProd">GIỎ HÀNG (<%=0%>)</a></li>
                            <%}%>
                            <% if (check.equals("false")) {%>
                            <%
                                ArrayList<Cart_Item> listCart = (ArrayList<Cart_Item>) session.getAttribute("cart");
                                int quantityProduct = 0;
                                for (int i = 0; i < listCart.size(); i++) {
                                    quantityProduct = quantityProduct + listCart.get(i).getQuantity();
                                }
                            %>
                        <li> <a href="TheCart_Add?action=viewProd">GIỎ HÀNG (<%=quantityProduct%>)</a></li>
                            <%}%>
                        <li><i class="fas fa-shopping-cart fa-lg" style="color: white;"></i></li>
                    </ul>
                </div>

                <div class="part1-moreinfor">
                    <a href="ControllerCart?cateId=<%=0%>">Trang Chủ</a>
                    <a href="https://vnexpress.net/tag/nuoc-hoa-22581">Tin Tức</a>
                    <a href="ControllerAdmin_Login">Admin</a>
                </div>
            </div>
        </div>

        <%
            Product prod = (Product) session.getAttribute("Prod");
        %>
        <div class="main">
            <section class="product">
                <div class="product__photo">
                    <div class="photo-container">
                        <div class="photo-main">
                            <div class="controls">
                                <i class="material-icons">share</i>
                                <i class="material-icons">favorite_border</i>
                            </div>
                            <img src="<%=prod.getImage()%>" alt="green apple slice" style="margin-left: 49px; margin-top: 32px; width: 100%;">
                        </div>
                        <div class="photo-album">
                        </div>
                    </div>
                </div>
                <div class="product__info">
                    <div class="title">
                        <h1><%=prod.getPname()%></h1>
                        <span>COD: 45999</span>
                    </div>
                    <div class="price">
                        $ <span><%=prod.getPrice()%></span>
                    </div>
                    <div class="description">
                        <h3>DESCRIPTION </h3>
                        <p><%=prod.getDescription()%></p>
                    </div>
                    <a href="TheCart_Add?action=addProd&pid=<%= prod.getPid()%>" class="buy--btn">ADD TO CART</a>
                </div>
            </section>
        </div>
        <div id="footer" style="margin-top: 100px;">
            <jsp:include page="Project_Footer.jsp"></jsp:include>
        </div>
    </body>
</html>
