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
            ResultSet rs = (ResultSet) request.getAttribute("ud");
        %>
        <h2 style="margin-left: 80px; margin-bottom: 30px;">Update Customer</h2>
        <div class="row">
            <div class="col-75">
                <div class="container">
                    <form action="ControllerCustomer_new?action=update" method="POST">
                        <%if (rs.next()) {%>
                        <div class="row">
                            <div class="col-50">
                                <h3>Information Customer</h3>
                                <label for="id"><i class="far fa-user" style="margin-right: 10px;"></i>Customer ID</label>
                                <input type="text" id="id" name="cid" value="<%=rs.getString(1)%>">
                                
                                <label for="name"><i class="fas fa-file-signature" style="margin-right: 10px;"></i>Customer Name</label>
                                <input type="text" id="name" name="cname" value="<%=rs.getString(2)%>">
                                
                                <label for="phone"><i class="fas fa-phone-square-alt" style="margin-right: 10px;"></i>Customer Phone</label>
                                <input type="text" id="phone" name="cphone" value="<%=rs.getInt(3)%>">
                                
                                <label for="address"><i class="far fa-address-card" style="margin-right: 10px;"></i>Customer Address</label>
                                <input type="text" id="addess" name="caddress" value="<%=rs.getString(4)%>">
                                
                                <label for="username"><i class="far fa-user-circle" style="margin-right: 10px;"></i>Username</label>
                                <input type="text" id="username" name="username" value="<%=rs.getString(5)%>">
                                
                                <label for="password"><i class="fas fa-lock" style="margin-right: 10px;"></i>Password</label>
                                <input type="password" id="password" name="password" value="<%=rs.getString(6)%>">
                                
                                <label for="status"><i class="far fa-check-circle" style="margin-right: 10px;"></i> Status</label>
                                <input type="radio" id="status" name="status" value="1" <%=(rs.getInt(7)==1?"checked":"")%>/>Enable
                                <input type="radio" id="status" name="status" value="0" <%=(rs.getInt(7)==0?"checked":"")%>/>Disnable
                            </div>
                        </div>
                        <%}%>
                        <input type="submit" value="Update Customer"  name="submit" class="btn">
                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>
