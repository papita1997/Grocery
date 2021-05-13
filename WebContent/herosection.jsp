   <%@page import="java.util.*,dao.ProductDao" %>
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
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
                                <input type="text" required placeholder="What do yo u need?" id="search" name="search" onkeyup="suggestion()">
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
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
