<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>
<body>
	<%@include file="Components/Navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
			<%@include file="Components/message.jsp" %>
				<div class="card">
					<div class="card-body">
						<img alt="" src="Images/baseline_app_registration_black_24dp.png"
							class="rounded mx-auto d-block">
						<h4 class="text-center my-3">Sign up Here</h4>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="Name">Name</label> <input type="text"
									class="form-control" name=user_name id="name" aria-describedby="emailHelp"
									placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name=user_email class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="Password">Password</label> <input type="password"
									class="form-control" name=user_pswd id="password" aria-describedby="emailHelp"
									placeholder="Enter password">
							</div>
							<div class="form-group">
								<label for="Phone Number">Phone Number</label> <input
									type="number" name=user_phno class="form-control" id="number"
									aria-describedby="emailHelp" placeholder="Enter Phone Number">
							</div>
							<div class="form-group">
								<label for="Address">Address</label>
								<textarea rows="3" cols="5" class="form-control"
									placeholder="Enter your Address" name=user_address></textarea>

							</div>
							<div class="container text-center">
							<input type="submit" class="btn btn-primary" value="Register">
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>