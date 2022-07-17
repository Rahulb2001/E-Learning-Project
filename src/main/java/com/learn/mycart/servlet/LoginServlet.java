package com.learn.mycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println(email);
		System.out.println(password);
		 UserDao userdao=new UserDao(FactoryProvider.getFactory());
		 User user=userdao.getUserByEmailandPassword(email, password);
		 System.out.println(user);
		 System.out.println("Sucessfully Logged in ");
		 HttpSession session=request.getSession();
		 if(user==null) {
				session.setAttribute("loginmessage", "Invalid Username or password  ...!!");
				response.sendRedirect("Login.jsp");
				return;
		 }else {
			 out.print("<h1>Welcome "+user.getUserName()+"</h1>");
			session.setAttribute("current-user", user);
			if(user.getUsertype().equals("admin")) {
			response.sendRedirect("Admin.jsp");
			}else if(user.getUsertype().equals("normal")) {
				response.sendRedirect("UserMainPage.jsp");
			}
		 }
		 
	}

}
