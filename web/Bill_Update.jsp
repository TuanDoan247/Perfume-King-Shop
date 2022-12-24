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
            ResultSet rsCus = (ResultSet) request.getAttribute("rsCus");
        %>
        <h2 style="margin-left: 80px; margin-bottom: 30px;">Update Bill</h2>
        <div class="row">
            <div class="col-75">
                <div class="container">
                    <form action="/action_page.php">
                        <div class="row">
                            <div class="col-50">
                                <h3>Information Bill</h3>
                                <label for="id"><i class="far fa-check-circle" style="margin-right: 10px;"></i>Customer ID</label>
                                <select name="cid" size="1">
                                    <%while (rsCus.next()) {%>
                                    <option value="<%=rsCus.getString(1)%>"><%=rsCus.getString(1)%></option>
                                    <%}%>
                                </select>
                                <%if (rs.next()) {%>
                                
                                <label for="status"><i class="far fa-check-circle" style="margin-right: 10px;"></i> Status</label>
                                <input type="radio" id="status" name="status" value="1" <%=(rs.getInt(7) == 1 ? "checked" : "")%>/>Enable
                                <input type="radio" id="status" name="status" value="0" <%=(rs.getInt(7) == 0 ? "checked" : "")%>/>Disnable
                                <%}%>
                            </div>
                        </div>
                        <input type="submit" value="Update Product"  name="submit" class="btn">
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>