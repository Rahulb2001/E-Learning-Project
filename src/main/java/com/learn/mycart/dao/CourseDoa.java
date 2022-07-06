package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Course;

public class CourseDoa {
	
	private SessionFactory factory;

	public CourseDoa(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveCourse(Course course) {
		boolean f=false;
		try {
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(course);
			tx.commit();
			session.close();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			f=false;
		}
		return f;
	}
	public List<Course> getAllProducts(){
		Session s=this.factory.openSession();	
		Query query=s.createQuery("from Course");
		List<Course> list=query.list();
		return list;
		
	}
	public List<Course> getAllProductsByCoursesId(int cid){
		Session s=this.factory.openSession();	
		Query query=s.createQuery("from Course as p where p.category.categoryId =: id");
		query.setParameter("id", cid);
		List<Course> list=query.list();
		return list;
		
	}
	
}
