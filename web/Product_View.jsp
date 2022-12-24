<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAOProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//            DAOProduct dao = new DAOProduct();
//            ResultSet rs = dao.getData("select * from Product");
    ResultSet rs = (ResultSet) request.getAttribute("kq");
    String title = (String) request.getAttribute("title");
%>
<div class="container">
    <h2>List Product</h2>
    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-1">Product ID</div>
            <div class="col col-1">Product Name</div>
            <div class="col col-1">Quantity</div>
            <div class="col col-1">Price</div>
            <div class="col col-1">image</div>
            <div class="col col-1" style="margin-right: 20px;">Description</div>
            <div class="col col-1">status</div>
            <div class="col col-1" style="margin-right: 10px;">Category ID</div>
            <div class="col col-1">Update</div>
            <div class="col col-1">Delete</div>
        </li>
        <% while (rs.next()) {%>
        <li class="table-row">
            <div class="col col-1" data-label="Job Id"><%=rs.getString(1)%></div>
            <div class="col col-1" data-label="Customer Name"><%=rs.getString(2)%></div>
            <div class="col col-1" data-label="Amount" style="text-align: center"><%=rs.getString(3)%></div>
            <div class="col col-1" data-label="Payment Status"><%=rs.getString(4)%></div>
            <div class="col col-1" data-label="Payment Status">
                <img src="<%=rs.getString(5)%>" width="100" height="100"/>
            </div>
            <div class="col col-1" data-label="Payment Status" 
                 style="width:120px;
                 height:200px;
                 overflow-x:hidden;
                 overflow-y:auto; margin-right: 20px;"><%=rs.getString(6)%></div>
                 <div class="col col-1" data-label="Payment Status"><%=(rs.getInt(7) == 1 ? "Active" : "Deactive")%></div>
            <div class="col col-1" data-label="Payment Status" style="margin-right: 10px;"><%=rs.getString(8)%></div>
            <div class="col col-1" data-label="Payment Status">
                <a href="ControllerProduct_new?action=update&pid=<%=rs.getString(1)%>">Update</a>
            </div>
            <div class="col col-1" data-label="Payment Status">
                <a href="ControllerProduct_new?action=delete&pid=<%=rs.getString(1)%>">Delete</a>
            </div>
        </li>
        <%}%>
    </ul>
</div>   
