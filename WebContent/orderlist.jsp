<jsp:include page="aheader.jsp"/>

<%@page import="java.util.List,dao.AdminDao,pojo.AdminProductPojo,dao.ProductDao,pojo.OrderListPojo" %>
<div class="jumbotron text-center m-0 p-2">
<h2>Order List</h2>
</div>
<hr>
<div class="container">
<div class="row">
<div class="col-sm-12">
<table class="table table-bordered">
			<thead class="table-dark">
			
				<th>Order Id</th>
				<th>Product Id</th>
				<th>Product Name</th>
				<th>Address Id</th>
				<th>userId</th>
			</thead>
			<tbody>
			<%
			List<OrderListPojo> list=AdminDao.getOrderDetails();
			if(list!=null){
				for(OrderListPojo admin:list){
			%>
				<tr> 
					<td><%= admin.getOrderId() %></td>
					<td><%= admin.getProductId() %></td>
					<td><%= admin.getProductName() %></td>
					<td><%= admin.getAddId() %></td>
					<td><%= admin.getUserId() %></td>
					
				</tr>
				
				<%
				
				}
			}
				%>
			
			</tbody>
			</table>

</div>
</div>
</div>

<jsp:include page="footer.jsp" />