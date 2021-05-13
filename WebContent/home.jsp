<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.util.List,pojo.ProductPojo,dao.HomeDao,dao.ProductDao,java.util.HashMap,java.util.ArrayList,java.util.Collections" %>
    
<jsp:include page="header.jsp"/>

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All Category</span>
                        </div>
                        <ul>
                  <%
				HashMap<String,String> map = ProductDao.getAllCategory();
				ArrayList<String> sortedKeys = 
	                    new ArrayList<String>(map.keySet()); 
	          
	       		 Collections.sort(sortedKeys);  
				if(map!=null){
					for(String catId:sortedKeys){
				%>
                            <li><a href="showcategoryProd?cat=<%=catId%>"><%= map.get(catId) %></a></li>
                            
                <% 
                }
					}
					%>            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form ">
                            <form action="SearchBarServlet" method="get">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input autocomplete="false" type="text" required placeholder="What do yo u need?" id="search" name="search" onkeyup="suggestion()">
                                <button type="submit" class="site-btn" >SEARCH</button>
					              </form>              
 						</div>
                       
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+91 7870260373</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="dropdownn" style="margin-bottom: 30px; margin-left: 200px;">
                        <div id="myDropdown" class="dropdown-content" style="display:block;">
                          
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="images/hero/banner.jpg" style="margin-top:30px">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="showcategoryProd?cat=c102" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    
    
    

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div id="carouselExampleSlidesOnly" class="carousel slide m-2" data-ride="carousel">
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img class="d-block w-100 " src="images/c1.jpg" alt="First slide" style="height:400px">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="images/c2.jpg" alt="Second slide" style="height:400px">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="images/c3.jpg" alt="Third slide" style="height:400px">
					    </div>
					  </div>
					</div>

            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Trending Product</h2>
                    </div>
                    
                </div>
            </div>
            <div class="row featured__filter">
            
            <% 
            List<ProductPojo> list = null;
            try {
            	list =HomeDao.allRandProduct(); 
            }
			catch(Exception ex){
         		
            }
            
            %>
            <% if(list!=null){
            	for(ProductPojo prod:list){
            %>
           
            
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="<%=prod.getProdImages()%>" >
                            <ul class="featured__item__pic__hover">
                                <li><a href="javascrip:void(0)"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li  ><a href="javascript:void(0)" data-value="<%= prod.getProdId() %>" onclick="addCart(this)"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        
                        <div class="featured__item__text"  data-value="<%= prod.getProdId() %>" onclick="shop(this)">
                            <h6><a href="return false"><%= prod.getProdName() %></a></h6>
                            <h5>Rs <%= prod.getTotalPrice() %></h5>
                        </div>
                    </div>
                </div>
               
            <%
            }
            }
            %>    
               
                
              
               
             
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="images/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="images/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    

   	<jsp:include page="footer.jsp"/>
	