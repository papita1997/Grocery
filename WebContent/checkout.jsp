<jsp:include page="header.jsp"/>
   <jsp:include page="herosection.jsp"/>
   
   <%@page import="java.util.*,pojo.SubCategoryPojo,dao.ProductDao,pojo.ProductPojo,dao.HomeDao,pojo.BasketPojo" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="images/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	<% 
	List<BasketPojo> list = HomeDao.AllBasketData((String)request.getSession().getAttribute("userid")); 
	//String prodidlist = "";
	//for(BasketPojo b:list){
		//prodidlist = prodidlist + b.getProductID();
	//}
	%>
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="PlaceOrderServlet?pid=<%=request.getParameter("pid")%>&pidlist=<%=list.stream().map(b -> b.getProductID()).reduce("", String::concat) %>" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fist Name<span>*</span></p>
                                        <input type="text" required name="fname">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text" required name="lname">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input type="text" required name="country">
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" placeholder="Street Address" class="checkout__input__add" required name="address">
                               
                            </div>
                            <div class="checkout__input">
                                <p>Town/City<span>*</span></p>
                                <input type="text" required name="town">
                            </div>
                            <div class="checkout__input">
                                <p>State<span>*</span></p>
                                <input type="text" required name="state">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text" required name="pincode">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="number" required name="phone">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" required name="email">
                                    </div>
                                </div>
                            </div>
                      
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                        <%
                        	SubCategoryPojo order= ProductDao.CheckOutProduct(request.getParameter("pid"));
                        	
                        	boolean basket = Boolean.parseBoolean(request.getParameter("basket"));
                        	if(basket){
                        		
                        %>
                        
                                <div class="checkout__order__products">Products <span>Total</span></div>  
                                <ul>
                                    <li>No of products <span><%= list.size() %></span></li>
                                    <li>Total MRP  <span>Rs <%=list.stream().mapToDouble(bask -> bask.gettPrice()).sum() %></span></li>
                                    <li>DISCOUNT(-10%) <span>-Rs <%= list.stream().mapToDouble(bask -> bask.gettPrice()).sum()/10 %></span></li>
                                </ul>
                                <div class="checkout__order__subtotal">Subtotal <span>Rs <%= list.stream().mapToDouble(bask -> bask.gettPrice()).sum() - (list.stream().mapToDouble(bask -> bask.gettPrice()).sum()/10) %></span></div>
                                <div class="checkout__order__total">Total <span>Rs  <%= list.stream().mapToDouble(bask -> bask.gettPrice()).sum() - (list.stream().mapToDouble(bask -> bask.gettPrice()).sum()/10) %> </span></div>
                                
                            <%
                                
                        	}
                        	
                        		if(!basket && order!=null) {
                            %>    
                            	<div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                    <li><%= order.getProductName() %><span></span></li>
                                    <li>MRP  <span>Rs <%= order.getMrp() %></span></li>
                                    <li>DISCOUNT(-<%= order.getDiscount() %>%) <span>-Rs <%=(order.getMrp()*order.getDiscount())/100.0 %></span></li>
                                </ul>
                                <div class="checkout__order__subtotal">Subtotal <span>Rs <%= order.getTotalPrice() %></span></div>
                                <div class="checkout__order__total">Total <span>Rs <%= order.getTotalPrice() %></span></div>
                            
                            <% } %>
                            
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
<jsp:include page="footer.jsp"/>