<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Project_css/Admin_Login.css" rel="stylesheet" type="text/css">
    </head>
    <body background='img/admin.jpg'>
        <div class="loginbox">
            <img src="img/lag.png" class="avatar"/>
            <h1>Login here</h1>
            <form action="ControllerAdmin_Login">
                <p>Username</p>
                <input type="text" name="usernameadmin" value="" placeholder="Enter Username"/>
                <p>Password</p>
                <input type="password" name="passwordadmin" value="" placeholder="Enter Password"/>
                <input type="submit" value="Login" name="submit" />
                <a href="ControllerUser_Signup">Don't have an account?</a>
            </form>
        </div>
    </body>
</html>
