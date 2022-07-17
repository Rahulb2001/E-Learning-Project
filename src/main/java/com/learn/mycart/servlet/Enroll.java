package com.learn.mycart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.group.Response;
import org.hibernate.Session;

import com.learn.mycart.entities.User;
import com.learn.mycart.videos.Video;

/**
 * Servlet implementation class Enroll
 */
@WebServlet("/Enroll")
public class Enroll extends HttpServlet {
	public static String coursetitle = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Enroll() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root", "9663885375");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public static ArrayList<ArrayList<String>> videoList() {
		ArrayList<ArrayList<String>> listvideoArrayList = new ArrayList<ArrayList<String>>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root", "9663885375");
			PreparedStatement ps = con
					.prepareStatement("Select videolink from video where videocourse=\"[" + coursetitle + "]\";");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ArrayList<String> inner = new ArrayList<String>();
				inner.add(rs.getString("videolink"));
				listvideoArrayList.add(inner);
			}
			rs.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (listvideoArrayList);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		coursetitle = request.getParameter("title");
		System.out.println(coursetitle);
		 HttpSession session=request.getSession();
		 session.setAttribute("ctitle",coursetitle);
//	response.sendRedirect("NUser.jsp");
		Enroll enroll = new Enroll();

		ArrayList<ArrayList<String>> arr = enroll.videoList();
		System.out.println(arr);
		//HttpSession session = request.getSession();
		//User user = (User) session.getAttribute("usernameandemail");
		//savetouserprofile(user.getUserName(), user.getUserEmail());
		session.setAttribute("Listofcourse", arr);
		response.sendRedirect("NUser.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
