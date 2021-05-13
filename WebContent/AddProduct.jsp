
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
<h2>Add PRoduct</h2>
</div>
<hr>

<%@page import="java.util.HashMap,dao.ProductDao" %>
    
    <p  ><b><%= request.getSession().getAttribute("msg")==null?"":(String)request.getSession().getAttribute("msg") %></b></p>
					<% request.getSession().setAttribute("msg", ""); %>
					
<form method="post" action="addproduct" enctype="multipart/form-data">

		<div class="container">
		
		
		
		<div class="form-group ">
		<select class="form-control" name="category" required>
		<option >--select category--</option>
		<%
			HashMap<String,String> map=ProductDao.getAllCategory();
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
		<%
			String proid =ProductDao.getNewProductId();
			if(proid!=null){
				
		%>
		<input  type="text" disabled class="form-control" value="<%= proid%>" required>
		<input  type="hidden" name="pid" class="form-control" value="<%= proid%>" >
		<%
		}
		%>
		
		</div>
		
		<div class="form-group">
		
		<input type="text" name="pname" class="form-control" placeholder="Product Name" required>
		</div>
		<div class="form-group">
	
		<input type="text" name="mrp" class="form-control" placeholder="MRP" required>
		</div>
		<div class="form-group">
		
		<input type="text" name="discount" class="form-control" placeholder=" Discount" required>
		</div>
		<div class="form-group">
	
		<input type="text" name="tprice" class="form-control" placeholder="Total Price" required>
		</div>
		
		
		<div class="form-group">
		
		<textarea required name="description" rows="4" class="form-control" placeholder="Product Description"></textarea>
		</div>
		
		<div class="form-group">
		<label>Upload Images</label>
		<input required type="file" name="upload" accept="image/png, image/jpeg" >
		</div>
		
		<div class="form-group">
		<label>Is Product Avilable? </label>
		<input  type="checkbox" name="avi" value="yes">
		</div>
		<input type="submit" value="Add Product">
	</div>
	</form>





<jsp:include page="footer.jsp"/>