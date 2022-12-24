<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAOBill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
//            DAOBill dao = new DAOBill();
//            ResultSet rs = dao.getData("select * from Bill");
    ResultSet rs = (ResultSet) request.getAttribute("kq");
    String title = (String) request.getAttribute("title");
%>
<div class="container">
    <h2>List Bill</h2>
    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-2">Bill ID</div>
            <div class="col col-2">Customer Name</div>
            <div class="col col-2">Date Create Phone</div>
            <div class="col col-2">Total</div>
            <div class="col col-2">Status</div>
            <div class="col col-2">Bill Detail</div>
        </li>
        <% while (rs.next()) {%>
        <li class="table-row">
            <div class="col col-2" data-label="Job Id"><%=rs.getString(1)%></div>
            <div class="col col-2" data-label="Customer Name"><%=rs.getString(3)%></div>
            <div class="col col-2" data-label="Amount"><%=rs.getString(2)%></div>
            <div class="col col-2" data-label="Payment Status"><%=rs.getString(6)%></div>
            
            <%if(rs.getInt(7) == 1 ){%>
            <div class="col col-2" data-label="Payment Status"><%="Wait"%></div>
            <%}%>
            
            <%if(rs.getInt(7) == 0 ){%>
            <div class="col col-2" data-label="Payment Status"><%="Done"%></div>
            <%}%>
            
            <%if(rs.getInt(7) == 2 ){%>
            <div class="col col-2" data-label="Payment Status"><%="Process"%></div>
            <%}%>
            
            <div class="col col-2" data-label="Payment Status">
                <a href="ControllerBillDetail_new?oid=<%=rs.getString(1)%>">View</a>
            </div>
        </li>
        <%}%>
    </ul>
</div>