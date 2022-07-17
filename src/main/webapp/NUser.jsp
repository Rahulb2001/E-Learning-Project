<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.learn.mycart.servlet.Enroll"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
String ctitle = (String) session.getAttribute("ctitle");
ArrayList<String> list = (ArrayList) session.getAttribute("Listofcourse");
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
<title>User Page</title>
<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>
<body>
	<%
	out.print(ctitle);
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root", "9663885375");
		PreparedStatement ps = con.prepareStatement("update user set user_course_opted=? where user_email=?");
		ps.setString(1, ctitle);
		ps.setString(2, user.getUserEmail());
		int i = ps.executeUpdate();
		con.close();
		if (i > 0) {
			out.print("Record Updated Successfully");
		} else {
			out.print("There is a problem in updating Record.");
		}
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	%>
	<div class="container">
		<div class="jumbotron text-center">
			<h1 class="display-3">
				Thank You!
				<%=user.getUserName()%>
				Enrolling the Course
			</h1>
			<p class="lead">
				<strong>Please Login to the Main Page For Studying </strong>
			</p>
			<hr>
			<p>
				Having trouble? <a href="">Contact us</a>
			</p>
			<p class="lead">
				<a class="btn btn-primary btn-sm" href="UserMainPage.jsp"
					role="button">Continue to Login Page</a>
			</p>
		</div>

	</div>


</body>
</html>