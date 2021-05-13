<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.util.List,pojo.ProductPojo,dao.HomeDao" %>   
  
   <% 
     String userid = (String)request.getSession().getAttribute("userid");
     int count = 0;
	 if(userid!=null){
	 count =(int)HomeDao.CartCount(userid);
    }
      %>
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
    
    <style>
        .dropbtn {
          background-color: #4CAF50;
          color: white;
          padding: 16px;
          font-size: 16px;
          border: none;
          cursor: pointer;
        }
        
        .dropbtn:hover, .dropbtn:focus {
          background-color: #3e8e41;
        }
       
        #myInput:focus {outline: 3px solid #ddd;}
        
        .dropdownn {
          position: absolute;
          display: inline-block;
        }
        
        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #f6f6f6;
          min-width: 230px;
          overflow: auto;
          border: 1px solid #ddd;
          z-index: 1;
        }
        
        .dropdown-content a {
          color: black;
          padding: 12px 16px;
          text-decoration: none;
          display: block;
        }
        
        .dropdownn a:hover {background-color: #ddd;}
        
        .shownn {display: none;}
        .bsetting ul li a{
        	font-size:10px;
        }
        .setting ul{
        	width: 130px;
        }
        </style>
    
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
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span id="basketcount"><%= count %></span></a></li>
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
        <div class="humberger__menu__widget">
            <div class="header__top__right__language bsetting <%= rs1.equals("login")?"shownn":"" %>" id="setting">
                <img src="img/language.png" alt="">
                <div>Setting</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="changepwd.jsp">Change Pass</a></li>
                    
                    <li><a href="logout">Log Out</a></li>
                </ul>
            </div>
            
            <div class="header__top__right__auth">
                <a href="<%= !rs1.equals("login")?"":rs1 %><%= rp1%>" id="nameuser" data-value="<%= rs1.toUpperCase() %>"><i class="fa fa-user"></i> <%= rs1.toUpperCase() %></a>
            </div>
        </div>
        
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Contact</a></li>
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
                                <li><i class="fa fa-envelope"></i>  grocery@gmail.com</li>
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
                            <div class="header__top__right__language setting <%= rs1.equals("login")?"shownn":"" %>" id="setting">
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
                                <a href="<%= !rs.equals("login")?"":rs %><%= rp%>" id="nameuser" data-value="<%= rs.toUpperCase() %>"><i class="fa fa-user"></i> <%= rs.toUpperCase() %></a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="images/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="home.jsp">Home</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <label>My Basket</label>
                            <li><a href="basket.jsp"><i class="fa fa-shopping-bag"></i> <span id="basketcount"><%= count %></span></a></li>
                        </ul>
                        
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    