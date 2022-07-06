package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Category;

public class CategoryDoa {
	private SessionFactory factory;

	public CategoryDoa(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public int saveCategory(Category cat) {
		int catid = 0;
		try {
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			catid=(int) session.save(cat);
			tx.commit();
			session.close();
			
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return catid;
		
	}
	public List<Category> getCategory(){
		Session s=this.factory.openSession();
		Query query=s.createQuery("from Category");
		List<Category> list=query.list();
		return list;
		
	}
	public Category getCategoryById(int cid) {
		Category cat=null;
		try {
			Session session=this.factory.openSession();
			cat=session.get(Category.class, cid);
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cat;
	}

}
