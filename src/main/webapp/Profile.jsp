<%@page import="com.learn.myblog.entities.Blog_user"%>
<%
Blog_user blog_user = (Blog_user) session.getAttribute("currentuser");
if (blog_user == null) {
	response.sendRedirect("Blog_LoginPage.jsp");

}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>
<title><%=blog_user.getNameString()%></title>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-warning">
		<a class="navbar-brand" href="#">Blog Writing</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Learn
						Course Online</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Projrct Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link " href="#">Contact
						Us</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profile"><span
						class="fa fa-user-circle"></span><%=blog_user.getNameString()%></a></li>
				<li class="nav-item"><a class="nav-link" href="Blog_Logout"><span
						class="fa fa-user-plus"></span>Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Modal Start -->
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning ">
					<h5 class="modal-title " id="exampleModalLabel">Your Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img alt="" src="Profile_Pics/<%=blog_user.getProfileString()%>"
							style="border-radius: 50%; max-width: 100px;">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=blog_user.getNameString()%></h5>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">ID</th>
									<td><%=blog_user.getId()%></td>

								</tr>
								<tr>
									<th scope="row">Email</th>
									<td><%=blog_user.getEmailString()%></td>

								</tr>
								<tr>
									<th scope="row">Status</th>
									<td><%=blog_user.getAboutString()%></td>

								</tr>
							</tbody>
						</table>



					</div>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#editModal">Edit</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal Ends -->
	<!-- Edit model Starts -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h5 class="modal-title" id="exampleModalLabel">Edit Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img alt="" src="Profile_Pics/<%=blog_user.getProfileString()%>"
							style="border-radius: 50%; max-width: 100px;">
						<form action="">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=blog_user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><input type="text" class="form-control"
											value="<%=blog_user.getNameString()%>" name="user_name"></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><input type="text" class="form-control"
											value="<%=blog_user.getEmailString()%>" name="user_email"></td>

									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input type="text" class="form-control"
											value="<%=blog_user.getPasswordString()%>"
											name="user_password"></td>

									</tr>
									<tr>
										<th scope="row">About</th>
										<td><textarea name="user_about" rows="3" 
												class="form-control"><%=blog_user.getAboutString()%></textarea></td>
									</tr>
									<tr>
										<th scope="row">New Profile Pic</th>
										<td><input type="file" class="form-control"></td>
									</tr>
								</tbody>
							</table>

						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Model Ends -->
</body>
</html>