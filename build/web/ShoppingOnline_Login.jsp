<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="Project_css/User_Login.css" rel="stylesheet" type="text/css">
    </head>
    <body background='img/login.jpg'>
        <div class="loginbox"  style="background-color:rgba(0, 0, 0, 0.5);">
            <img src="img/lag.png" class="avatar"/>
            <h1>Login here</h1>
            <form action="ControllerUser_Login">
                <p>Username</p>
                <input type="text" name="username" value="" placeholder="Enter Username"/>
                <p>Password</p>
                <input type="password" name="password" value="" placeholder="Enter Password"/>
                <input type="submit" value="Login" name="submit" />
                <a href="ControllerUser_Signup">Don't have an account?</a>
            </form>
        </div>
    </body>
</html>
