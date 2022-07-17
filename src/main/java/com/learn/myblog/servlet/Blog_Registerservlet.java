package com.learn.myblog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learn.myblog.dao.Blog_UserDao;
import com.learn.myblog.entities.Blog_user;
import com.learn.myblog.helper.ConnectionProvider;

/**
 * Servlet implementation class Blog_Registerservlet
 */
@MultipartConfig
@WebServlet("/Blog_Registerservlet")
public class Blog_Registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Blog_Registerservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String nameString = request.getParameter("Name");
		String emailString = request.getParameter("email");
		String passwordString = request.getParameter("password");
		String aboutString = request.getParameter("tell_me_about_yourself");

		Blog_user bUser = new Blog_user(nameString, emailString, passwordString, aboutString);

		Blog_UserDao bDao = new Blog_UserDao(ConnectionProvider.getConnection());
		if (bDao.saveUser(bUser)) {
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Registered Sucessfully Redirect to  Login Page ');");
			   out.println("location='Blog_LoginPage.jsp';");
			   out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Error');");
			   out.println("location='Blog_Registration.jsp';");
			   out.println("</script>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
