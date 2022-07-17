package com.learn.mycart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.entities.User;
import com.learn.mycart.videos.Video;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet("/VideoServlet")
public class VideoServlet extends HttpServlet {
	public static String vcourseString = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root", "9663885375");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public static int save(Video e) {
		int status = 0;
		try {
			Connection con = VideoServlet.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into video(videolink,videocourse) values (?,?)");
			ps.setString(1, e.getVideolink());
			ps.setString(2, e.getCoursecategory());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	public static int savetouserprofile(Video e) {
		int status = 0;
		try {
			User user=new User();
			Connection con = VideoServlet.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into userprofile(username,useremail,usercourseopted) values (?,?,?)");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserEmail());
			ps.setString(3, vcourseString);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String vlinkString = request.getParameter("vlink");
		vcourseString = request.getParameter("vcourse");
		System.out.println(vlinkString);
		System.out.println(vcourseString);
		Video video = new Video(vlinkString, vcourseString);
		VideoServlet vServlet = new VideoServlet();
		VideoServlet.save(video);
		HttpSession session = request.getSession();
		session.setAttribute("message", "Video added ...!!");
		response.sendRedirect("Admin.jsp");
		return;
	}

}
