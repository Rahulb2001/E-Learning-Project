<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog</title>
<%@include file="Components/Bootstrap_cdn.jsp"%>
<style>
.bg{
background: #f2b20f
}

</style>
</head>
<body>
	<%@include file="Components/Blog_Navbar.jsp"%>


	<div class="container-fluid p-0 m-0">
		<div class="jumbotron bg">
			<div class="container">
				<h3 class="display-3">Welcome , Folks</h3>
				<p>A programming language is any set of rules that converts
					strings, or graphical program elements in the case of visual
					programming languages, to various kinds of machine code
					output.[citation needed] Programming languages are one kind of
					computer language, and are used in computer programming to
					implement algorithms.</p>
				<button class="btn btn-outline-dark btn-lg">
					<span class="fa fa-user-plus fa-spin"></span>Start
				</button>
				<a href="Blog_LoginPage.jsp">
				<button class="btn btn-outline-dark btn-lg">
					<span class="fa fa-user-circle fa-spin"></span>Login
				</button></a>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-warning text-dark">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-warning text-dark">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-warning text-dark">Read More</a>
					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-4  mt-3">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-warning text-dark">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4  mt-3">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-warning text-dark">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-warning text-dark">Read More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>