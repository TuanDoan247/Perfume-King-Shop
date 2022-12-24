<%-- 
    Document   : demo
    Created on : 04-Oct-2021, 13:01:39
    Author     : ADMINS
--%>

<%@page import="model.DAOProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demo</title>
    </head>
    <body>
        <!-- Script-->
        <%//code jave
            int a=10;
            out.print("<h2 style='color:red'>a="+a+"</h2>");
            DAOProduct dao = new DAOProduct();
        %>
        
        <!-- Expression-->
        <h1>values a=<%=a%></h1>
        <% for (int i=10; i<=100; i+=10){%>
            <hr width="<%=i%>"/>
        <%}%>
        
        <!-- Declare-->
        <% // local variable
            int Min =10;%> 
        <%!//Global
            int MAX=100; %>
        <%! public void abc(){

        }%>
        
        
    </body>
</html>
