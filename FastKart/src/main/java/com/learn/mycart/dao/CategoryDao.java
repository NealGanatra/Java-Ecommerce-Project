package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Category;
import com.learn.mycart.helper.FactoryProvider;

public class CategoryDao {

	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory=factory;
	}
	
	public int saveCategory(Category category) {
		int categoryId=0;
		try {
			
			Session session=this.factory.openSession();
			//Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			 categoryId=(Integer) session.save(category);
			tx.commit();
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return categoryId;
		
	}
	
	public List<Category> getCategories(){
		Session s=this.factory.openSession();
		Query query=s.createQuery("from Category");
		List<Category> list=query.list();
		return list;
	}
	
	public Category getCategoryById(int Id) {
		Category cat=null;
		try {
		Session s=this.factory.openSession();
		cat=s.get(Category.class, Id);
		s.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cat;
		
	}
}
