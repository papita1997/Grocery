
   	<jsp:include page="header.jsp"/>


<hr>

<div class="jumbotron text-center">
<h2>Change Password</h2>
</div>
<div class="container">
<div class="row">
	<div class="col-sm-5 mx-auto">
	


	<form method="post" action="cpwd">
		
		<div class="form-group">
			<input type="password" class="form-control" placeholder="original password" name="pwd" required>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" placeholder="new Password" name="npwd" required>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" placeholder="re-enter password" name="nnpwd" required>
		</div>
		<div class="form-group">
		<input type="submit" value="Change Password" class="btn btn-primary btn-sm float-right m-2" >
		</div>
 	
	</form>		
</div>
</div>
</div>
   	<jsp:include page="footer.jsp"/>