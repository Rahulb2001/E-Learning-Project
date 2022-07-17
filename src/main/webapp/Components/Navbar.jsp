<%@page import="com.learn.mycart.entities.*"%>
<%@include file="Bootstrap_cdn.jsp"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>
<style>
.navbar{
background-color: bg-primary;
}
</style>
<nav class="navbar navbar-expand-lg navbar-light custom-bg bg-warning">
	<div class="container">
		<a class="navbar-brand" href="#">E-Learning Website</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Blog_index.jsp">Blog <span class="sr-only"></span>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#" data-toggle="modal" data-target="#cart"></a></li>
				<%
				if (user1 == null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="Login.jsp">Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="registration.jsp">Register</a></li>
			</ul>
			<%
			} else {
			%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="<%= user1.getUsertype().equals("admin")?"Admin.jsp":"NUser.jsp" %>"><%=user1.getUserName()%></a></li>
				<li class="nav-item active"><a class="nav-link" href="Logout">Logout</a></li>
				<%
				}
				%>
			</ul>

		</div>
	</div>
</nav>