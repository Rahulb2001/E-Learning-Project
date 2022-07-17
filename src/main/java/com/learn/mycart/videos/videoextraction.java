package com.learn.mycart.videos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class videoextraction {

	public static ArrayList<ArrayList<String>> extraction() {
		Connection con = null;
		Statement statement = null;
		ArrayList<ArrayList<String>> outer = new ArrayList<ArrayList<String>>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root", "9663885375");
			statement = (Statement) con.createStatement();
			String sql;
			sql = "select courseTitle from course";
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				ArrayList<String> inner = new ArrayList<String>();
				inner.add(resultSet.getString("courseTitle"));
				outer.add(inner);
			}
			System.out.println("The name are as follows:");
			for (int i = 0; i < outer.size(); i++) {
				System.out.println(outer.get(i));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return(outer);
	}

	public static void main(String[] args) {
		
		videoextraction vd=new videoextraction();
		ArrayList<ArrayList<String>>arr=vd.extraction();

	}
}
//      Connection con = null;
//      Statement statement = null;
//      try {
//         ArrayList<ArrayList<String>> outer = new ArrayList<ArrayList<String>>();
//         Class.forName("com.mysql.jdbc.Driver");
//         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearn", "root","9663885375");
//         statement = (Statement) con.createStatement();
//         String sql;
//         sql = "select courseTitle from course";
//         ResultSet resultSet = statement.executeQuery(sql);
//         while (resultSet.next()) {
//            ArrayList<String> inner = new ArrayList<String>();
//            inner.add(resultSet.getString("courseTitle"));
//            outer.add(inner);
//         }
//         System.out.println("The name are as follows:");
//         for (int i = 0; i < outer.size(); i++) {
//            System.out.println(outer.get(i));
//         }
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//   }
