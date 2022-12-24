<%@page import="ShoppingOnline_Cart.Cart_Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vua Nước Hoa™ - Thế Giới Hương Thơm Luôn Bên Cạnh Bạn</title>
        <link href="Project_css/Footer.css" rel="stylesheet" type="text/css">
        <link href="Project_css/TrangChu.css" rel="stylesheet" type="text/css">
        <link href="Project_css/MenuProduct.css" rel="stylesheet" type="text/css">
        <link href="Project_css/Cart_ListProduct.css" rel="stylesheet" type="text/css">
        <link href="Project_css/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="Project_css/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="Project_css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            String usernameLogin = (String) session.getAttribute("namelogin");
            String usernameSignup = (String) session.getAttribute("namesignup");
            String name = "TÀI KHOẢN";
            int statuscheck = 1;
            
            if(usernameLogin != null){
                name = usernameLogin;
                statuscheck = 0;
            }
            
            if(usernameSignup != null){
                name = usernameSignup;
                statuscheck = 0;
            }
            
            request.setAttribute("name", name);

        %>
        <form action="Controller_TrangChu" method="POST">
            <div id="part1">
                <div class="part1-infro">
                    <ul class="menu clearfix">
                        <li><a href="#"><%=name%></a>
                            <ul>
                                <%if(statuscheck == 1){%>
                                    <li><a href="ControllerUser_Login">Đăng nhập</a></li>
                                    <li><a href="ControllerUser_Signup">Đăng ký</a></li>
                                <%}%>
                                <%if(statuscheck == 0){%>
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

            <div id="part2">
                <div>
                    <ul class="part2-infor">
                        <li><i class="far fa-comments fa-2x"></i></li>
                        <li>
                            <p>Hotline: 0987749999</p>
                            <p>Tổng đài: 19008198</p>
                        </li>
                    </ul>
                </div>

                <div class="img">
                    <img src="img/log.jpg"/>
                    <h2>VUA NƯỚC HOA</h2>
                </div>

                <div class="search">
                    <div class="wrap">
                        <div class="search">
                            <input type="text" class="searchTerm" placeholder="Tìm sản phẩm trong cửa hàng">
                            <a href="#" class="searchButton">
                                <i class="fas fa-search"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="menuProduct">
                    <jsp:include page="Project_MenuProduct.jsp"></jsp:include>
                </div>

                <div id="showcart" style="margin-bottom: 100px;">
                    <jsp:include page="Project_ListProdutcInCart.jsp"></jsp:include>
                </div
                
                <div id="footer">
                    <jsp:include page="Project_Footer.jsp"></jsp:include>
                </div>
                
            </div>
        </form>
    </body>
</html>
