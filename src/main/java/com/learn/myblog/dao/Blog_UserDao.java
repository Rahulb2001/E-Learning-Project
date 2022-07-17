package com.learn.myblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.learn.myblog.entities.Blog_user;

public class Blog_UserDao {
	private Connection con;

	public Blog_UserDao(Connection con) {
		this.con=con;
	}
	
	public boolean saveUser(Blog_user bUser) {
		boolean f=false;
	try {
		String queryString="insert into blog_user(blog_username,blog_useremail,blog_userpassword,blog_userabturself)values(?,?,?,?)";
	PreparedStatement pStatement=this.con.prepareStatement(queryString);
	pStatement.setString(1, bUser.getNameString());
	pStatement.setString(2, bUser.getEmailString());
	pStatement.setString(3, bUser.getPasswordString());
	pStatement.setString(4, bUser.getAboutString());
	pStatement.executeUpdate();
	f=true;
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	return f;	
	}
	  public Blog_user getUserByEmailAndPassword(String email, String password) {
	        Blog_user bUser = null;

	        try {

	            String query = "select * from blog_user where blog_useremail =? and blog_userpassword=?";
	            PreparedStatement pstmt = con.prepareStatement(query);
	            pstmt.setString(1, email);
	            pstmt.setString(2, password);

	            ResultSet set = pstmt.executeQuery();

	            if (set.next()) {
	              bUser=new Blog_user();
	              bUser.setId(set.getInt("idblog_user"));
	              bUser.setNameString(set.getString("blog_username"));
	              bUser.setEmailString(set.getString("blog_useremail"));
	              bUser.setPasswordString(set.getString("blog_userpassword"));
	              bUser.setAboutString(set.getString("blog_userabturself"));
	              bUser.setProfileString(set.getString("blog_userprofile"));

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return bUser;
	    }

}
