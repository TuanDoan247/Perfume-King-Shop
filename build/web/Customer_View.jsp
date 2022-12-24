<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAOCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
//            DAOCustomer dao = new DAOCustomer();
//            ResultSet rs = dao.getData("select * from Customer");

    ResultSet rs = (ResultSet) request.getAttribute("kq");
    String title = (String) request.getAttribute("title");

%>

<div class="container">
  <h2>List Customer</h2>
  <ul class="responsive-table">
    <li class="table-header">
      <div class="col col-2">Customer ID</div>
      <div class="col col-2">Customer Name</div>
      <div class="col col-2">Customer Phone</div>
      <div class="col col-2">Customer Address</div>
      <div class="col col-2">UserName</div>
      <div class="col col-2">Password</div>
      <div class="col col-2">Status</div>
      <div class="col col-2">Update</div>
      <div class="col col-2">Delete</div>
    </li>
    <% while (rs.next()) {%>
    <li class="table-row">
      <div class="col col-2" data-label="Job Id"><%=rs.getString(1)%></div>
      <div class="col col-2" data-label="Customer Name"><%=rs.getString(2)%></div>
      <div class="col col-2" data-label="Amount"><%=rs.getString(3)%></div>
      <div class="col col-2" data-label="Payment Status"><%=rs.getString(4)%></div>
      <div class="col col-2" data-label="Payment Status"><%=rs.getString(5)%></div>
      <div class="col col-2" data-label="Payment Status"><%=rs.getString(6)%></div>
      <div class="col col-2" data-label="Payment Status"><%=(rs.getInt(7) == 1 ? "Active" : "Deactive")%></div>
      <div class="col col-2" data-label="Payment Status">
          <a href="ControllerCustomer_new?action=update&cid=<%=rs.getString(1)%>">Update</a>
      </div>
      <div class="col col-2" data-label="Payment Status">
          <a href="ControllerCustomer_new?action=delete&cid=<%=rs.getString(1)%>">Delete</a>
      </div>
    </li>
    <%}%>
  </ul>
</div>


<!--<p><a href="ControllerCustomer_new?action=insert">Insert Customer</a></p>-->

