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
<title><%=user.getUserName()%></title>
<%@include file="Components/Bootstrap_cdn.jsp"%>
</head>
<body>
	<div class="container mt-3">
		<nav class="navbar navbar-dark bg-warning">

			<a class="navbar-brand text-dark " href="index.jsp">Home</a> <a
				class="navbar-brand text-dark " href="index.jsp">Course Details</a>
			<a class="navbar-brand text-dark " href="index.jsp">Instructor</a> <a
				class="navbar-brand text-dark " href="Logout">logout</a> <a
				class="navbar-brand text-dark " href="#"><%=user.getUserName()%></a>
		</nav>
	</div>

	<%
	String course = null;
	try {
		String email = user.getUserEmail();
		out.print(email);
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root", "9663885375");
		PreparedStatement ps = con.prepareStatement("Select user_course_opted from user where user_email=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			course = rs.getString("user_course_opted");
		}
		rs.close();
		out.print(course);

		//session.removeAttribute("ctitle");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>


	<%
	ArrayList<String> inner = new ArrayList<String>();
	ArrayList<ArrayList<String>> listvideoArrayList = new ArrayList<ArrayList<String>>();
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root", "9663885375");
		PreparedStatement ps = con.prepareStatement("Select videolink from video where videocourse=\"[" + course + "]\";");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {

			inner.add(rs.getString("videolink"));
			listvideoArrayList.add(inner);
		}
		rs.close();
		//session.removeAttribute("ctitle");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if (inner.isEmpty()) {
		out.print("<h1>No Course Enrolled</h1>");
	} else {

		Iterator itr = inner.iterator();
		//out.print(inner);
		while (itr.hasNext()) {
	%>
	<div class="container mt-3">


		<div class="card text-center">
			<div class="card-header">Featured</div>
			<div class="card-body">
				<%=itr.next() %>
			</div>
			<div class="card-footer text-muted">My name is sheela </div>
		</div>
	</div>
	<%
	}
	}
	%>

</body>
</html>