<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Project_css/CustomerView.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("kq");
            String oid = (String) request.getAttribute("oid");
        %>
        <form action="ControllerBillDetail_new" method="POST">
            <div class="container">
                <h2>List Bill Detail</h2>
                <ul class="responsive-table">
                    <li class="table-header">
                        <div class="col col-2">Product ID</div>
                        <div class="col col-2">Bill ID</div>
                        <div class="col col-2">Quantity</div>
                        <div class="col col-2">Price</div>
                        <div class="col col-2">Total</div>
                        <div class="col col-2">Update</div>
                    </li>
                    <% while (rs.next()) {%>
                    <li class="table-row">
                        <div class="col col-2" data-label="Job Id"><%=rs.getString(1)%></div>
                        <div class="col col-2" data-label="Customer Name"><%=rs.getString(2)%></div>
                        <div class="col col-2" data-label="Amount"><%=rs.getString(3)%></div>
                        <div class="col col-2" data-label="Payment Status"><%=rs.getString(4)%></div>
                        <div class="col col-2" data-label="Payment Status"><%=rs.getString(5)%></div>
                        <div class="col col-2" data-label="Payment Status">
                            <a href="ControllerBillDetail_new?action=update&pid-<%=rs.getString(1)%>&oid=<%=rs.getString(2)%>">Update</a>
                        </div>
                    </li>
                    <%}%>
                </ul>
                
                <div style="display: none">
                    Bill ID <input type="text" name="billid" value="<%=oid%>" />
                </div>
                
                <div style="margin-left: 40px;">
                    <%
                        ResultSet rsBill = (ResultSet) request.getAttribute("udBill");
                    %>

                    <table border="0">
                        <% if (rsBill.next()) {%>
                        <tr>
                            <td style="font-size: 20px; padding-bottom: 10px;">Status</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="status" value="1" <%=(rsBill.getInt(7) == 1 ? "checked" : "")%> />Wait
                                <input type="radio" name="status" value="0" <%=(rsBill.getInt(7) == 0 ? "checked" : "")%>/>Done
                                <input type="radio" name="status" value="2" <%=(rsBill.getInt(7) == 2 ? "checked" : "")%>/>Process
                            </td>
                        </tr>
                        <%}%>

                        <tr>
                            <td style="padding-top: 30px;"><input style="width: 200px; height: 40px; background: green; border-radius: 10px; color: white" type="submit" value="Finish View" name="submit" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
    </body>
</html>
