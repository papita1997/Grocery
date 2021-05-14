	
	<%@page import="java.util.List,pojo.ProductPojo,dao.HomeDao,pojo.BasketPojo" %>
	<jsp:include page="header.jsp"/>
    <jsp:include page="herosection.jsp"/>
    
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="images/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                            	List<BasketPojo> list = HomeDao.AllBasketData((String)request.getSession().getAttribute("userid"));
                            	if(list!=null){
                            		for(BasketPojo basket:list){
                            			
                            	
                            %>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%= basket.getImages()%>" alt="">
                                        <h5><%= basket.getProductName() %></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                       Rs <%= basket.gettPrice() %>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <%= basket.getQuantity() %>
                                    </td>
                                    <td class="shoping__cart__total">
                                        Rs <%= basket.getQuantity()*basket.gettPrice() %>
                                    </td>
                                    <td class="shoping__cart__item__close " data-value="<%= basket.getProductID()%>" onclick="deleteCartProduct(this)">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                
                  <% 	}
                            	 %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        
                        <a href="home.jsp" class="primary-btn cart-btn cart-btn-right">
                            CONTINUE SHOPPING</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>Rs <%= list.stream().mapToDouble(basket -> basket.gettPrice()).sum() %></span></li>
                            <li>Total <span>Rs <%= list.stream().mapToDouble(basket -> basket.gettPrice()).sum() %></span></li>
                        </ul>
                        <a href="checkout.jsp?basket=true" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

<jsp:include page="footer.jsp"/>