package com.learn.myblog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.myblog.dao.Blog_UserDao;
import com.learn.myblog.entities.Blog_user;
import com.learn.myblog.entities.Message;
import com.learn.myblog.helper.ConnectionProvider;

/**
 * Servlet implementation class Blog_LoginServlet
 */
@WebServlet("/Blog_LoginServlet")
public class Blog_LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Blog_LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String useremailString = request.getParameter("email");
		String passwordString = request.getParameter("password");
		Blog_UserDao bDao = new Blog_UserDao(ConnectionProvider.getConnection());
		Blog_user blog_user = bDao.getUserByEmailAndPassword(useremailString, passwordString);
		if (blog_user == null) {
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Username or Password incorrect');");
//			out.println("location='Blog_LoginPage.jsp';");
//			out.println("</script>");
			Message msgMessage=new Message("Invalid Details ! try with another ", "error", "alert-danger");
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message", msgMessage);
			response.sendRedirect("Blog_LoginPage.jsp");
		} else {
			HttpSession hSession = request.getSession();
			hSession.setAttribute("currentuser", blog_user);
			response.sendRedirect("Profile.jsp");
		}
		System.out.println(bDao);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
