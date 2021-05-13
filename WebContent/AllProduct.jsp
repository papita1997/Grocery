
<%
	String userid=(String)request.getSession().getAttribute("userid");
	String type = (String)request.getSession().getAttribute("type");
	if(userid!=null && type!=null){
		if(!userid.equalsIgnoreCase("admin@gmail.com") || !type.equals("ADMIN")){
			response.sendRedirect("accessdenied.html");
			return;
		}
	}else{
		response.sendRedirect("accessdenied.html");
	}
	%> 
	

<jsp:include page="aheader.jsp"/>

<%@page import="java.util.List,java.util.HashMap,java.util.Collection,dao.AdminDao,pojo.AdminProductPojo,dao.ProductDao" %>
<div class="jumbotron text-center m-0 p-2" >
<h2>All Product</h2>
</div>
<hr>


<p  ><b><%= request.getSession().getAttribute("msg")==null?"":(String)request.getSession().getAttribute("msg") %></b></p>
					<% request.getSession().setAttribute("msg", ""); %>
					
<div class="container">
<div class="row">
<div class="col-sm-12">
<table class="table table-bordered">
			<thead class="table-dark">
				<th>Product Id</th>
				
				<th>Product Name</th>
				<th>MRP</th>
				<th>Is Avilable ?</th>
				<th>Total Price</th>
				<th>Category Name</th>
				<th>Category Id</th>
				<th> Operations</th>
			</thead>
			<tbody>
			
			<%
			List<AdminProductPojo> list=AdminDao.getProductDetails();
			
			HashMap<String,String> map=ProductDao.getAllCategory();
			if(list!=null && map!=null){
				
				for(AdminProductPojo admin:list){
			
			%>
				<tr> 
					<td><%= admin.getProdId() %></td>
			
					<td><%= admin.getProdName() %></td>
					<td><%= admin.getMrp() %></td>
					<td><%= admin.getIs_avi() %></td>
					<td><%= admin.getTotalPrice() %></td> 
					<td><%= map.get(admin.getCat_id()) %></td>
					<td><%= admin.getCat_id() %></td>
					<td>
					<a href="updateproduct?pid=<%= admin.getProdId() %>" class="btn btn-primary btn-sm">edit</a>
					<a href="DeletProductServlet?pid=<%= admin.getProdId() %>" class="btn btn-danger btn-sm">delete</a>
					</td>
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