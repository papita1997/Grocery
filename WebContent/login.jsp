<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String userid  = (String)request.getSession().getAttribute("userid");
	if(userid!=null){
		response.sendRedirect("home.jsp");
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<title>grocery login form</title>
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
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Sign In</h1>
		<div class="main-agileinfo">
			<div class="agileits-top" >
				<form action="validate" method="post">
					  <p style='background:red;' ><b><a   href="javascript:void(0)" ><%= request.getSession().getAttribute("invalid")==null?"":(String)request.getSession().getAttribute("invalid") %></a></b></p>
					<% request.getSession().setAttribute("invalid", ""); %>
					<input class="text" type="email" name="email" placeholder="Enter your email" required><br>
					
					<input class="text" type="password" name="password" placeholder="Password" required>

					<div class="wthree-text">
						<label class="anim">
							
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="LOGIN">
				</form>
				<p>Don't have an Account? <a href="register.jsp"> Register Now!</a></p>
				<p>Forget Password <a href="Forget.html"> Forget Now!</a></p><br>
				
				<p><b><a   href="home.jsp">Home</a></b></p>
			</div>
		</div>
	</div>
	
	</body>
	</html>

		