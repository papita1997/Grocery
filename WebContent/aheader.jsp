   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Grocery</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
</head>
    
<body onload="homeload()">
	
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="images/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>Rs 150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>Setting</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="changepwd.jsp">Change Pass</a></li>
                    
                    <li><a href="logout">Log Out</a></li>
                </ul>
            </div>
            
             <%                            
				String rs1 = (String)request.getSession().getAttribute("username");
                String rp1="#";
				if(rs1==null){
					rs1 = "login";
					rp1 =".jsp";
				}
			%>
            <div class="header__top__right__auth">
                <a href="<%= !rs1.equals("login")?"":rs1 %><%= rp1 %>"><i class="fa fa-user"></i> <%= rs1.toUpperCase() %></a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> grocery@gmail.com</li>
                <li>Free Shipping for all Order of Rs 499</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> grocery@gmail.com</li>
                                <li>Free Shipping for all Order of Rs 499</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="img/language.png" alt="">
                                <div>Setting</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="changepwd.jsp">Change Password</a></li>
                                    <li><a href="logout">Log out</a></li>
                                </ul>
                            </div>
                            <%                           
							String rs = (String)request.getSession().getAttribute("username");
                                String rp="#";
							if(rs==null){
								rs = "login";
								rp=".jsp";
							}
							%> 
                            <div class="header__top__right__auth">
                                <a href="<%= !rs.equals("login")?"":rs %><%= rp%>"><i class="fa fa-user"></i> <%= rs.toUpperCase() %></a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
   	<div class="jumbotron text-center p-2 m-0">
   		<h2>Admin Panel</h2>
   	</div>
   	
   	<div class="container">
	<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
	  
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav">
      
      <li class="nav-item">
        <a class="nav-link n" href="AllProduct.jsp">All Product </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link n" href="AddProduct.jsp">Add product </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link n" href="category.jsp">Category </a>
      </li>
      <li class="nav-item">
        <a class="nav-link n" href="orderlist.jsp">Order List </a>
      </li>

      
    </ul>
     </div>
</nav>