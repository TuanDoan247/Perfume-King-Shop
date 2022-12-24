
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Index</title>
        <link href="Project_css/Admin_Index.css" rel="stylesheet" type="text/css">
        <link href="Project_css/CustomerView.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        
        <%
            String username = (String) session.getAttribute("nameAdminlogin");
        %>

        <div class="top" style="background-image: url(img/admin-1.jpg);">
            <h1 id ="trangchu" style="float: left; margin-left: 40px;"><a href="ControllerCart?cateId=<%=0%>" style="color: white">Trang Chủ</a></h1>
            <h1>Welcome: <%=username%></h1>
            <p><a href="ControllerAdmin_Login">Logout</a></p>
        </div>

        <div class="left" >
            <ul>
                <li class="menu">
                    <div class="dropdown">
                        <button class="dropbtn"><a href="ControllerAdmin_control?action=listcustomer">Customer Manager</a></button>
                        <div class="dropdown-content">
                            <a href="#">Insert</a>
                            <a href="#">Get Name</a>
                            <a href="#">Get Phone</a>
                            <a href="#">Get Address</a>
                            <a href="#">Get Status</a>
                            <a href="#">Get Account</a>
                        </div>
                    </div>
                </li>
                <li class="menu">
                    <div class="dropdown">
                        <button class="dropbtn"><a href="ControllerAdmin_control?action=product">Product Manager</a></button>
                        <div class="dropdown-content">
                            <a href="#">Insert</a>
                            <a href="#">Get Name</a>
                            <a href="#">Get Quantity</a>
                            <a href="#">Get Price</a>
                            <a href="#">Get Status</a>
                            <a href="#">Sort By Price Increase</a>
                            <a href="#">Sort By Price Decrease</a>
                        </div>
                    </div>
                </li>
                <li class="menu">
                    <div class="dropdown">
                        <button class="dropbtn"><a href="ControllerAdmin_control?action=bill">Bill Manager</a></button>
                        <div class="dropdown-content">
                            <a href="#">Insert</a>
                            <a href="#">Get Customer Name</a>
                            <a href="#">Get Status</a>
                            <a href="#">Get Date</a>
                        </div>
                    </div>
                </li>
            </ul>

        </div>

        <div class="right">
            <%
                String check = (String) request.getAttribute("check");
            %>

            <% if (check.equals("cus")) {%>
            <jsp:include page="Customer_View.jsp"></jsp:include>
            <%}%>

            <% if (check.equals("prod")) {%>
            <jsp:include page="Product_View.jsp"></jsp:include>
            <%}%>

            <% if (check.equals("bill")) {%>
            <jsp:include page="Bill_View.jsp"></jsp:include>
            <%}%>

        </div>


    </body>
</html>
