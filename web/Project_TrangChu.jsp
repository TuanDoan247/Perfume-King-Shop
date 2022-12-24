<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vua Nước Hoa™ - Thế Giới Hương Thơm Luôn Bên Cạnh Bạn</title>
        <link href="Project_css/Footer.css" rel="stylesheet" type="text/css">
        <link href="Project_css/TrangChu.css" rel="stylesheet" type="text/css">
        <link href="Project_css/MenuProduct.css" rel="stylesheet" type="text/css">
        <link href="Project_css/ListProduct.css" rel="stylesheet" type="text/css">
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
                        <li> <a href="TheCart_Add?action=viewProd">GIỎ HÀNG</a></li>
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

                <div id="postermain" style="margin-top: 100px; margin-bottom: 100px; clear: both;">
                    <img src="img/pótermain.jpg" style="width: 100%"/>
                </div>
                
                <!--image slider start-->
                <div class="slider" style="clear: both"> 
                    <div class="slides">
                        <!--radio buttons start-->
                        <input type="radio" name="radio-btn" id="radio1">
                        <input type="radio" name="radio-btn" id="radio2">
                        <input type="radio" name="radio-btn" id="radio3">
                        <input type="radio" name="radio-btn" id="radio4">
                        <!--radio buttons end-->
                        <!--slide images start-->
                        <div class="slide first">
                            <img src="img/p1.jpg"/>
                        </div>
                        <div class="slide">
                            <img src="img/p2.jpg"/>
                        </div>
                        <div class="slide">
                            <img src="img/p3.jpg"/>
                        </div>
                        <div class="slide">
                            <img src="img/p4.jpg"/>
                        </div>
                        <!--slide images end-->
                        <!--automatic navigation start-->
                        <div class="navigation-auto">
                            <div class="auto-btn1"></div>
                            <div class="auto-btn2"></div>
                            <div class="auto-btn3"></div>
                            <div class="auto-btn4"></div>
                        </div>
                        <!--automatic navigation end-->
                    </div>
                    <!--manual navigation start-->
                    <div class="navigation-manual">
                        <label for="radio1" class="manual-btn"></label>
                        <label for="radio2" class="manual-btn"></label>
                        <label for="radio3" class="manual-btn"></label>
                        <label for="radio4" class="manual-btn"></label>
                    </div>
                    <!--manual navigation end-->
                </div>
                <!--image slider end-->
                <script type="text/javascript">
                    var counter = 1;
                    setInterval(function () {
                        document.getElementById('radio' + counter).checked = true;
                        counter++;
                        if (counter > 4) {
                            counter = 1;
                        }
                    }, 5000);
                </script>

                <div class="poster">
                    <ul>
                        <li><img src="img/pt1.jpg"/></li>
                        <li><img src="img/pt2.jpg"/></li>
                    </ul>
                </div>
                
                <div class="menuProduct">
                    <h2>Thương Hiệu</h2>
                    <h2 id="h2">Thương Hiệu</h2>
                    <jsp:include page="Project_MenuProduct.jsp"></jsp:include>
                </div>

                <div style="clear: both; margin-top: 50px; margin-left: 15px;">
                    <ul style="list-style-type: none">
                        <li style="display: inline-block"><img src="img/gg1.jpg"/></li>
                        <li style="display: inline-block"><img src="img/gg2.jpg"/></li>
                        <li style="display: inline-block"><img src="img/gg3.jpg"/></li>
                    </ul>
                </div>
                
                <div id="titleh3">
                    <h3>Nước hoa</h3>
                    <h3 id="h3">Nước hoa</h3>
                </div>
                
                <div id="listProduct">
                    <jsp:include page="Project_ListProduct.jsp"></jsp:include>
                </div>
                
                <div id="footer">
                    <img src="img/video gif.gif" style=" width: 90%; margin-left: 63px; margin-top: 100px; clear: both;"/>
                    <jsp:include page="Project_Footer.jsp"></jsp:include>
                </div>
            </div>
        </form>
    </body>
</html>
