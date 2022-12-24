<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="Project_css/User_Register.css" rel="stylesheet" type="text/css">
    </head>
    <body background='img/signup.jpg'>
        <div class="signupbox" style="background-color:rgba(0, 0, 0, 0.6);">
            <img src="img/lag.png" class="avatar"/>
            <h1>BECOME A MEMBER OF PERFUME WORLD</h1>
            <form action="ControllerUser_Signup">
                <p>Name</p>
                <input type="text" name="cname" value="" placeholder="Enter Your Name"/>
                <p>Phone</p>
                <input type="text" name="cphone" value="" placeholder="Enter Your Phone"/>
                <p>Address</p>
                <input type="text" name="caddress" value="" placeholder="Enter Your Address"/>
                <p>Username</p>
                <input type="text" name="username" value="" placeholder="Enter Username"/>
                <p>Password</p>
                <input type="password" name="password" value="" placeholder="Enter Password"/>
                <input type="submit" value="Register" name="submit" />
                <h6>Already a member? <a href="ControllerUser_Login">Sign in</a></h6>
            </form>
        </div>
    </body>
</html>
