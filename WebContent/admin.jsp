   	
   	<%
	String userid=(String)request.getSession().getAttribute("userid");
	String type = (String)request.getSession().getAttribute("type");
	System.out.println(type);
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
   	
   	<div class="jumbotron text-center ">
 
   		<h2> Welcome to Admin Pannel</h2>
   	</div>
   	
  	<jsp:include page="afooter.jsp"/>