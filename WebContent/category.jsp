
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
	
<jsp:include page="aheader.jsp" />

<div class="jumbotron text-center m-1 p-2" >
<h2> Category List</h2>
</div>
 <hr>
<%@page  import="java.sql.*,java.util.HashMap,java.util.ArrayList,java.util.Collections,dao.ProductDao,dao.AdminDao,pojo.CategoryPojo"%>

<p  ><b><%= request.getSession().getAttribute("msg")==null?"":(String)request.getSession().getAttribute("msg") %></b></p>
					<% request.getSession().setAttribute("msg", ""); %>
	
	<div class="container">
	  <% 
		if(session.getAttribute("msg")!=null){
			%>
			<div class="alert alert.success font-weight-bold text-center">
			<%= session.getAttribute("msg") %>
			</div>
			
		  <%
		  session.removeAttribute("msg");   
		}
		%>
	
		<div class="row">
			<div class="col-sm-6">
			<table class="table table-bordered">
			<thead class="table-dark">
				<th>Category Id</th>
				<th>Category Name</th>
				<th> Operations</th>
			</thead>
			<tbody>
			<%
				HashMap<String,String> map = ProductDao.getAllCategory();
				ArrayList<String> sortedKeys = 
	                    new ArrayList<String>(map.keySet()); 
	          
	       		 Collections.sort(sortedKeys);  
				if(map!=null){
					for(String catId:sortedKeys){
			%>
				<tr> 
					<td><%= catId %></td>
					<td><%= map.get(catId) %></td> 
					<td>
					<a href="EditCategory?catid=<%= catId %>" class="btn btn-primary btn-sm">edit</a>
					<a href="DeleteCategoryServlet?catid=<%= catId %>" class="btn btn-danger btn-sm">delete</a>
					</td>
				</tr>
			<% 
			}
				}
			%>
			
			</tbody>
			
			</table>
			</div>
			<div class="col-sm-6">
			<div class="jumbotron text_center p-2 m-3">
			<h2>Save Category</h2>
			</div>
			<form method="post" action="SaveCategory">
				<div class="form-group">
				 <p  ><b><a   href="javascript:void(0)" ><%= request.getSession().getAttribute("insertmsg")==null?"":(String)request.getSession().getAttribute("insertmsg") %></a></b></p>
					<% request.getSession().setAttribute("insertmsg", ""); %>
				<label>Category Name</label>
				<input type="text" class="form-control" required name="cname" placeholder="category Name">
				</div>
				<input type="submit" class="btn btn-block btn-primary" value="Save Category">
			</form>
			<hr>
			<div class="jumbotron text_center p-2 m-3">
			<h2>Edit Category</h2>
			</div>
			<form method="post" action="EditCategory">
				<div class="form-group">
				 <p  ><b><a   href="javascript:void(0)" ><%= request.getSession().getAttribute("insertmsg")==null?"":(String)request.getSession().getAttribute("insertmsg") %></a></b></p>
					<% request.getSession().setAttribute("insertmsg", ""); %>
					</div>
					<% 
					 CategoryPojo cat = (CategoryPojo) request.getSession().getAttribute("cat");
					if(cat!=null){
					%>
				<div class="form-group">
				<input type="text" class="form-control" disabled value="<%= cat.getCatId()%>">
				<input type="hidden" class="form-control" name="catid" value="<%= cat.getCatId()%>">
				</div>
				<div class="form-group">
				<input type="text" class="form-control" name="cname" value="<%= cat.getcName()%>">
				</div>
				<% 
				} 
				request.getSession().setAttribute("cat", null);
				
				%>
				
				<input type="submit" class="btn btn-block btn-primary" value="Update Category">
			</form>
			</div>
			
		</div>
	</div>

<jsp:include page="footer.jsp" />