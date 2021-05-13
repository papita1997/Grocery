
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

<div class="jumbotron text-center p-2 m-0">
<h2>Edit PRoduct</h2>
</div>
<hr>

<%@page import="java.util.HashMap,dao.ProductDao,pojo.AdminProductPojo" %>
 <p  ><b><%= request.getSession().getAttribute("msg")==null?"":(String)request.getSession().getAttribute("msg") %></b></p>
					<% request.getSession().setAttribute("msg", ""); %>
    
<form method="post" action="updateproduct" enctype="multipart/form-data">
	
	<%
		AdminProductPojo admin=(AdminProductPojo)request.getSession().getAttribute("admin");
		HashMap<String,String> map=ProductDao.getAllCategory();
		if(admin!=null){
			
		
	%>

		<div class="container">
		
		
		<label>Category</label>
		<div class="form-group ">
		<select class="form-control" name="category" required>
		<option value="<%=admin.getCat_id()%>"> <%= map.get(admin.getCat_id()) %></option>
		<%
			
			if(map!=null){
				for(String catId:map.keySet()){
		%>
			<option value="<%=catId%>"><%=map.get(catId) %></option>
		
		<% 
				}
			}
		%>
		</select>
		</div>
		
		<div class="form-group">
		<label>Product Id</label>
		<input  type="text" disabled class="form-control" value="<%= admin.getProdId() %>" required>
		<input  type="hidden" name="pid" class="form-control" value="<%= admin.getProdId() %>" >
		
		
		</div>
		
		<div class="form-group">
		<label>Product Name</label>
		<input type="text" name="pname" class="form-control" value="<%= admin.getProdName() %>" placeholder="Product Name" required>
	
		</div>
		<div class="form-group">
		<label>MRP</label>
		<input type="text" name="mrp" class="form-control" value="<%= admin.getMrp() %>" placeholder="MRP" required>
		</div>
		<div class="form-group">
		<label>Discount %</label>
		<input type="text" name="discount" class="form-control" value="<%= admin.getDiscount() %>" placeholder=" Discount" required>
		</div>
		<div class="form-group">
		<label>Total Price</label>
		<input type="text" name="tprice" class="form-control" value="<%= admin.getTotalPrice() %>" placeholder="Total Price" required>
		</div>
		
		
		<div class="form-group">
		<label>Description</label>
		<textarea required name="description" rows="4" class="form-control"  placeholder="Product Description"><%= admin.getDescription() %></textarea>
		</div>
		
		<div class="form-group">
		<label>Upload Images</label>
		<input type="file" name="upload" accept="image/png, image/jpeg">
		<input type="hidden" name="oldupload" value="<%=admin.getProdImages() %>"/>
		
		<div class="card" style="width: 18rem;">
			<img class="card-img-top" src="<%= admin.getProdImages() %>" alt="Card image cap">			  
		</div>
		</div>
		
		<div class="form-group">
		<label>Is Product Avilable? </label>
		
		<input  type="checkbox" name="avi" value="yes" <%=admin.getIs_avi().equalsIgnoreCase("yes")?"checked":"" %> >
		</div>
		<input type="submit" value="update Product">
	</div>
	<%
		}
	%>
	</form>

		



<jsp:include page="footer.jsp"/>