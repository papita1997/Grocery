<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>grocery SignUp Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
<style>
    body{
        background-image: url('images/bg3.jpg');
    }
</style>
</head>
<body>

	<%
	if (session.getAttribute("masgs")!=null){
	%> 
	<div class="alert alert-danger text-center  font-weight-bold">
	<%= session.getAttribute("masgs") %>
	</div>
	<% 
		session.removeAttribute("masgs");
	} %>
	
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Sign Up</h1>
		<div class="main-agileinfo">
			<div class="agileits-top" >
				<form action="Register" method="post">
					<input class="text" type="text" name="name" placeholder="FullName" required="please enter your name">
					<input class="text email" type="email" name="email" placeholder="Enter your email" required="">  
					<input class="text" type="text" name="phone" placeholder="Phone" required=""><br>
					<!--<button class="btn" type="button" name="btn" onclick="">Generate OTP</button> <br>  
					<input class="text" type="text" name="otp" placeholder="OTP" required="">  <br>-->
					<input class="text" type="password" name="password" placeholder="Password" required="">
					<input class="text w3lpass" type="password" name="repassword" placeholder="Confirm Password" required=""> 
					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" class="checkbox" required="">
							<span>I Agree To The Terms & Conditions</span>
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SIGNUP">
				</form>
				<p>Login an Account? <a href="login.jsp"> Login Now!</a></p><br>
				<p><b><a   href="home.jsp">Home</a></b></p>
			</div>
		</div>
		<!-- copyright -->
		
		<!-- //copyright -->
		<ul class="colorlib-bubbles">
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
			<li>grocery shopping</li>
		</ul>
	</div>
	<!-- //main -->
</body>
</html>