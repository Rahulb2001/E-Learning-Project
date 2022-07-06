<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.CategoryDoa"%>
<%@page import="com.learn.mycart.dao.CourseDoa"%>
<%@page import="java.util.List "%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart-Home</title>
<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>

<body>
<style>
.card:hover{
	background: #e2e2e2!important;
	cursor: pointer!important;
}
</style>
	<%@include file="Components/Navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<%
			String url=request.getParameter("category");
			CourseDoa course = new CourseDoa(FactoryProvider.getFactory());
			List<Course> list=null;
			 if(url==null || url.equals("all")){
				list = course.getAllProducts();
			}else{
				int cid=Integer.parseInt(url.trim());
				list=course.getAllProductsByCoursesId(cid);
			}
			CategoryDoa ctd = new CategoryDoa(FactoryProvider.getFactory());
			List<Category> listcat = ctd.getCategory();
			%>
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
						Categories </a>
					<%
					for (Category cat : listcat) {
					%>
					<a href="index.jsp?category=<%=cat.getCategoryId() %>" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">
							<%
							for (Course c : list) {
							%>
							<div class="card">
								<div class="container text-center">
									<img class="card-img-top"
										src="Images/Courses/<%=c.getCoursePhoto()%>"
										alt="Card image cap">
								</div>

								<div class="card-body">
									<h5 class="card-title"><%=c.getCourseTitle()%></h5>
									<p class="card-text"><%=Helper.get10Words(c.getCourseDesc())%>
									</p>
								</div>
								<div class="card-footer">
									<button class="btn custom-bg text-Dark" onclick="add_to_cart(<%=c.getCourseId()%> ,'<%=c.getCourseTitle()%>',<%=c.getCoursePriceAfterDiscount()%>)">Add to Cart</button>
									<button class="btn text-info text-info ">
										&#8377:<%=c.getCoursePrice()%></button>
										<button class="btn text-info text-info text-sucess ">
										&#8377:<%=c.getCourseDiscount()%></button>
									<p class="card-text">Amount After Discount</p>
									<button class="btn btn-outline-primary">
										&#8377:<%=c.getCoursePriceAfterDiscount()%></button>
								</div>
							</div>
							<%
							}
							if(list.size()==0){
								out.println("<h3>No Course in this Category</h3>");
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="Components/Common_modles.jsp"%>
</body>
</html>