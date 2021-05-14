<jsp:include page="header.jsp"/>
   <jsp:include page="herosection.jsp"/>
   <%@page import="java.util.*,dao.ProductDao,pojo.OrdersPojo" %>
<div class="container">

    <!--Section: Block Content-->
    <section class="mt-5 mb-4">

      <!--Grid row-->
      <div class="row">

        <!--Grid column-->
        <div class="col-lg-12">

          <!-- Card -->
          <div class="card wish-list mb-4">
            <div class="card-body">

              <h5 class="mb-4"><strong>ORDER LIST</strong> </h5>
			<%
				String userid = (String) request.getSession().getAttribute("userid");
				if(userid==null || userid.equals("null")) {
					response.sendRedirect("login.jsp");
					return;
				}
				
				List<OrdersPojo> orders = ProductDao.findAllOrdersPlaced(userid);
				if(orders!=null) {
					for(OrdersPojo order:orders) {
						
			%>
              <div class="row mb-4" >
                <div class="col-md-5 col-lg-3 col-xl-2">
                  <div class="mb-3 mb-md-0">
                    <img class="img-fluid w-100" src="<%=order.getImg() %>" alt="Sample">

                  </div>
                </div>
                <div class="col-md-7 col-lg-9 col-xl-9">
                  <div>
                    <div class="d-flex justify-content-between">
                      <div>
                        <h5 ><%=order.getProdName() %></h5>
                        <p class="mb-2 text-uppercase small">OrderId: <span><%=order.getOrderId() %></span></p>
                        <p class="mb-2 text-uppercase small">Description: <span><%=order.getDescription() %></span></p>
                        <p class="mb-2 text-uppercase small">Delivery On: <span >Dec 17,2021</span></p>

                      </div>
                    </div>
                    <div class="mt-3 d-flex justify-content-between align-items-center">
                    
                      <div class="cancel">
                        <a href="CancelOrder?pid=<%=order.getProdId() %>&orderid=<%=order.getOrderId() %>"  type="button" class="card-link-secondary small text-uppercase mr-3"><i
                                class="fas fa-trash-alt mr-1"></i> Cancel Order </a>

                      </div>
                      <p class="mb-0"><span><strong>Rs <span><%=order.getTotalPrice() %></span></strong></span></p>
                    </div>
                  </div>
                </div>
              </div>
              <hr class="mb-4">
			<% }} %>
              <p class="text-primary mb-0"><i class="fas fa-info-circle mr-1"></i>Our Company Provides You The Fast & Free Shipment
              with safety. @ Doo Gaj Ki Duri Mask Hai Jaruri!!
              </p>

            </div>
          </div>
        </div>
        <!--Grid column-->
      </div>
      <!--Grid row-->

    </section>
    <!--Section: Block Content-->

  </div>
<jsp:include page="footer.jsp"/>