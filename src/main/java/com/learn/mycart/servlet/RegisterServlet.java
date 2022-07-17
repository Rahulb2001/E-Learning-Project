package com.learn.mycart.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try {
			String username=request.getParameter("user_name");
			String useremail=request.getParameter("user_email");
			String userpswd=request.getParameter("user_pswd");
			String userphno=request.getParameter("user_phno");
			String useraddress=request.getParameter("user_address");
			User user=new User(username, useremail, userpswd, userphno, "default.jpg", useraddress,"normal","NotyetSelected");
			
			Session hibernetsession= FactoryProvider.getFactory().openSession();
			Transaction tx=hibernetsession.beginTransaction();
			int useid=(int) hibernetsession.save(user);
		tx.commit();
		hibernetsession.close();
		HttpSession session=request.getSession();
		session.setAttribute("usernameandemail", user);
		session.setAttribute("message", "Registration Sucessfull ...!!");
		response.sendRedirect("registration.jsp");
		return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void setAttribute(String string, User user) {
		// TODO Auto-generated method stub
		
	}
}
