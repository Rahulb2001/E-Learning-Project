<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "you are not logged in !! Login First to Enroll course");
	response.sendRedirect("Login.jsp");
	return;
}



%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>
<body>
	<%@include file="Components/Navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-3">Your Selected Courses</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-3">Your Details</h3>
						<form action="">
							<div class="form-group">
								<label for="Name">Name</label> <input type="text"
									class="form-control" name=user_name id="name"
									aria-describedby="emailHelp" value="<%=user.getUserName()%>">
							</div>
							<div class="form-group">
								<label for="Name">Email</label> <input type="text"
									class="form-control" name=user_name id="name"
									aria-describedby="emailHelp" value="<%=user.getUserEmail()%>">
							</div>
							<div class="form-group">
								<label for="Phone Number">Phone Number</label> <input
									type="number" name=user_phno class="form-control" id="number"
									aria-describedby="emailHelp" value="<%=user.getUserPhone()%>">
							</div>
							<div class="container text-center">
							<input type="submit" class="btn btn-outline-success" value="Enroll Now">
							<input type="submit" class="btn btn-outline-success" value="Continue Enrolling">
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="Components/Common_modles.jsp"%>
</body>
</html>