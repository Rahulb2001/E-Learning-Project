<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.* "%>
<%@page import="com.learn.mycart.dao.CategoryDoa"%>
<%@page import="com.learn.mycart.entities.*"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "you are not logged in !! Login First");
	response.sendRedirect("Login.jsp");
} else {
	if (user.getUsertype().equals("normal")) {
		session.setAttribute("message", "you are not an  Admin !! you can't Acess this page ");
		response.sendRedirect("Login.jsp");
		return;
	}
}
%>
<%
CategoryDoa cd = new CategoryDoa(FactoryProvider.getFactory());
List<Category> list = cd.getCategory();

Map<String,Long> m=Helper.getcounts(FactoryProvider.getFactory());
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>
<body>
	<style>
.card:hover {
	background: #e2e2e2;
	cursor: pointer;
}
</style>
	<%@include file="Components/Navbar.jsp"%>
	<div class="container" style="cursor: pointer;">
		<div class="container-fluid mt-3">

			<%@include file="Components/CategoryMessage.jsp"%>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#user">
					<div class="card-body text-center">
						<div class="container">
							<img alt="" src="Images/group.png" style="max-width: 100px;"
								class="img-fluid rounded-circle">
						</div>
						<h1><%=m.get("userCount") %></h1>
						<h1>User</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#courses">
					<div class="card-body text-center">
						<div class="container">
							<img alt="" src="Images/online-course.png"
								style="max-width: 100px;" class="img-fluid rounded-circle">
						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1>Courses</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#category">
					<div class="card-body text-center">
						<div class="container">
							<img alt="" src="Images/menu.png" style="max-width: 100px;"
								class="img-fluid rounded-circle">
						</div>
						<h1><%=list.size()%></h1>
						<h1>Category</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#courseModal">
					<div class="card-body text-center">
						<div class="container">
							<img alt="" src="Images/category.png" style="max-width: 100px;"
								class="img-fluid rounded-circle">
						</div>
						<h3>Click here to Add Course</h3>
						<h1>Add Course</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#addcatagory">
					<div class="card-body text-center">
						<div class="container">
							<img alt="" src="Images/menu.png" style="max-width: 100px;"
								class="img-fluid rounded-circle">
						</div>
						<h3>Click here to add Category</h3>
						<h1>Add Category</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Add category model -->

	<!-- Modal -->
	<div class="modal fade" id="addcatagory" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-black">
					<h5 class="modal-title" id="exampleModalLabel">Add New
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="CourseOperationServlet" method="post">
						<input type="hidden" name="operation" value="addcategory">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter the Category Title" required>
						</div>
						<div class="form-group">
							<textarea rows="3" cols="4" name="catDescription"
								placeholder="Enter the Description" class="form-control"></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End category Model -->
	<!-- Start Course Model -->
	<!-- Modal -->
	<div class="modal fade" id="courseModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-black">
					<h5 class="modal-title" id="exampleModalLabel">Course Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="CourseOperationServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addcourse">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter the title of the Course" name="cname"
								required="required">
						</div>
						<div class="form-group">
							<textarea rows="3" cols="4" name="cDescription"
								placeholder="Enter the Description" class="form-control"></textarea>
						</div>
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter the Price of the Course" name="cprice"
								required="required">
						</div>
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter the Discount" name="cDiscount"
								required="required">
						</div>
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter the quantity of the Course" name="cquantity"
								required="required">
						</div>

						<div class="form-group">
							<select name="catId" id="" class="form-control">
								<%
								for (Category c : list) {
								%>
								<option value=<%=c.getCategoryId()%>><%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="cpic">Select Image of Course</label> <br> <input
								type="file" class="form-control" name="cpic" required="required">
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Course</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Course Model -->
	<!-- Start of user modal -->
	<div class="modal fade" id="user" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-black">
					<h5 class="modal-title" id="exampleModalLabel">User</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Number of User Using this Application is 000</p>
					<div class="container text-center">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Of User Modal  -->
	<!-- Start of Courses Modal -->
	<div class="modal fade" id="courses" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-black">
					<h5 class="modal-title" id="exampleModalLabel">Courses</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Number of Courses Currently Available is 000</p>
					<div class="container text-center">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Courses Modal -->
	<!-- Start of Category Modal -->
	<div class="modal fade" id="category" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-black">
					<h5 class="modal-title" id="exampleModalLabel">Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						Number of Category Currently Available is
						<%=list.size()%></p>
					<div class="container text-center">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Of Category Model -->

	<%@include file="Components/Common_modles.jsp"%>
</body>
</html>