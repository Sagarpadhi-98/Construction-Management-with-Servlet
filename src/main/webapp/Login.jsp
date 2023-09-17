<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="WelcomePage.html">
<title>Login form</title>
<style type="text/css">
	body{
		background-image:url("Construction Management Software.jpg");
		background-size: cover;
		background-repeat: no-repeat;
	}
	
.login-form{
		position: absolute;
		width: 400px;
		height: 350px;
		background: transparent;
		border: 2px solid black;
		border-radius: 20px;
		box-shadow: 0 0 30px black;
		display: block;
		margin: 20px 100px;
		backdrop-filter:blur(60px);
		justify-content: center;
		align-items: center;
		box-shadow: 0 0 20px white;
}
h2{
	text-align: center;
	color: black;
	
}

.input-box{
	
	position: relative;
	width: 90%;
	height: 50px;
	border-bottom: 2px solid white;
	margin: 30px 15px;
	align-items: center;
	
	
}

.input-box lable{

	color: white;
}

input{
	
	width: 100%;
	height: 100%;
	background: transparent;
	border: none;
	outline: none;
	color: black;
	font-family: 5px;
}
.btn{

	width: 85%;
	height: 40px;
	margin-left: 25px;
	font-weight: 200px;
	font-size: medium;
	font-family: sans-serif;
	background-color: white;
	border: 2px solid white;
	border-radius: 5px 5px 5px 5px;
	
}

button:hover{
	background: rgb(0, 255, 64);
	border: 2px solid rgb(0, 255, 64);
	border-radius: 5px 5px 5px 5px;
	color: black;
}

.register {
	text-align: center;
	font-size: 16px;
	color: black;
	margin: 20px 5px;
}

</style>
</head>
<body >

<div class="login-form">
	<h2>Login</h2>
	<form action="login" method="post">
	<div class="input-box">
	<label style="color: black; top:50%; left:20px;" >Email Id</label>
	<input type="email" name="email" class="email" required>	
	</div>
	<div class="input-box">
	<label style="color: black; top:50%; left:20px;" >Password</label>
	<input type="password" name="password" class="password" required>	
	</div>
	
	<button  type="submit" class="btn">Login</button>
	
	<div class="register">
	Don't have an account?<a href="SignUp.html" ><b>signup</b></a></div>
	</form>
</div>


<script src="script.js"></script>
</body>
</html>