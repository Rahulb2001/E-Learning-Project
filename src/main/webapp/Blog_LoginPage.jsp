<%@page import="com.learn.myblog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>
<body>
	<!-- Section: Design Block -->
	<section class="text-center text-lg-start">
		<style>
.cascading-right {
	margin-right: -50px;
}

@media ( max-width : 991.98px) {
	.cascading-right {
		margin-right: 0;
	}
}
</style>

		<!-- Jumbotron -->
		<div class="container py-4">
			<div class="row g-0 align-items-center">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div class="card cascading-right"
						style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
						<div class="card-body p-5 shadow-5 text-center">
							<h2 class="fw-bold mb-5">Login now</h2>
							<%
							Message m = (Message) session.getAttribute("message");
							if (m != null) {
							%>
							<div class="alert <%=m.getCssclassString()%>" role="alert">
								This is a
								<%=m.getContentString()%></div>
							<%
							session.removeAttribute("message");
							}
							%>

							<form action="Blog_LoginServlet" method="post">
								<!-- 2 column grid layout with text inputs for the first and last names -->
								<!-- Email input -->
								<div class="form-outline mb-4">
									<input type="email" id="form3Example3" class="form-control"
										placeholder="Enter your Email" name="email" /> <label
										class="form-label" for="form3Example3">Email address</label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
									<input type="password" id="form3Example4" class="form-control"
										placeholder="Enter your Password" name="password" /> <label
										class="form-label" for="form3Example4">Password</label>
								</div>
								<!-- Submit button -->
								<button type="submit" class="btn btn-primary btn-block mb-4">
									Sign up</button>
								<!-- Register buttons -->
							</form>
							<div>
								<p class="mb-0">
									Don't have an account? <a href="Blog_Registration.jsp"
										class="text-white-50 fw-bold">Sign Up</a>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6 mb-5 mb-lg-0">
					<img
						src="https://mdbootstrap.com/img/new/ecommerce/vertical/004.jpg"
						class="w-100 rounded-4 shadow-4" alt="" />
				</div>
			</div>
		</div>
		<!-- Jumbotron -->
	</section>
	<!-- Section: Design Block -->

</body>
</html>