
	<jsp:include page="header.jsp"/>
	<jsp:include page="herosection.jsp"/>

	<%@page import="pojo.ShopProductPojo,dao.ProductDao,dao.HomeDao,java.util.List,pojo.ProductPojo,java.util.HashMap,java.util.ArrayList" %>
    

	<%
    	ShopProductPojo shop =  (ShopProductPojo)request.getSession().getAttribute("shop");
		System.out.println(shop);
    if(shop!=null){
    	System.out.println(shop.getCatname());
    
    %>
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="images/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><%= shop.getCatname() %></h2>
                        <div class="breadcrumb__option">
                            <a href="home.jsp">Home</a>
                            
                            <span><%= shop.getCatname() %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
    
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="<%= shop.getpImage()%>">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%= shop.getpName() %></h3>
                        <!-- 
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                         -->
                        <div class="product__details__price" id="price" data-value="<%= shop.gettPrice()%>"><span>Rs </span><%= shop.gettPrice()%> </div>
                        <p><%= shop.getpDesc() %></p>
                        <%
                        String type = (String)request.getSession().getAttribute("units");
                        HashMap<String,String> units = new HashMap<>();
                		ArrayList<Integer> qtyList = new ArrayList<>();
                        	if(type!=null){
                        		if(type.equals("gram")){
                        			units = ProductDao.getGramUnit();
                        			qtyList = ProductDao.gramQantity();
                        		} else {
                        			units = ProductDao.getLiterUnit();
                        			qtyList = ProductDao.literQantity();
                        		}
                        		
                        	}
                        %>
                        <div class="product__details__quantity">
                           <!-- <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" id="number" value="1">
                                </div>
                            </div>-->
                            
                            <select id="qty">
                            <option disabled>Quantity</option>
                            <%
                            	
                            	if(!qtyList.isEmpty()){
                            		for(Integer i:qtyList){
                            			
                            	
                            %>
                            <option value="<%= i %>"><%=i %></option>
                           <%
                            		}
                            	}
                           %>
                      
                            </select>
                            
                        </div>
                        <div class="product__details__quantity">
                        <select id="unit">
                        <option disabled >Units</option>
                            <%
                            String defaultUnit = "";
                            	if(!units.isEmpty()){
                            		for(String u:units.keySet()){
                            			 defaultUnit = units.get(u);
                            	
                            %>
                            <option value="<%=units.get(u) %>"><%=units.get(u) %></option>
                           <%
                            		}
                            	}
                           %>
                           
                            </select>
                        </div>
                        
                        <ul>
                        <%
                        	 if(!qtyList.isEmpty()){
                        %>
                            <li><b>Availability</b> <span><%= "yes".equalsIgnoreCase(shop.getIsAvi())?"In Stock":"Out Of Stock" %></span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span id="weight"><%=qtyList.get(0) %></span>&nbsp<span id="unit-text"><%=defaultUnit %></span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                        
                       <%
                        	 }
                       	request.getSession().setAttribute("pid", shop.getProductId());
                       %>
                       
                    </div>
                    <hr>
                     <a href="javascript:void(0)" data-value="<%= shop.getProductId() %>" onclick="addCart(this)" class="primary-btn">ADD TO BASKET</a>
                        <a href="checkout.jsp" class="primary-btn">BUY NOW</a>
                    
                </div>
                
                
	<%
    }
	%>
            </div>
        </div>
        
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <%
            	List<ProductPojo> list=HomeDao.allRandProductLimit4();
           if(list!=null)
           {
        	   for(ProductPojo p:list){
        		
            
            %>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<%= p.getProdImages()%>">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text " data-value="<%=p.getProdId()%> " onclick="shop(this)">
                            <h6><a href="javascript:void(0)"><%= p.getProdName() %></a></h6>
                            <h5>Rs <%= p.getTotalPrice() %></h5>
                        </div>
                    </div>
                </div>
               <%}} %>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
<jsp:include page="footer.jsp"/>