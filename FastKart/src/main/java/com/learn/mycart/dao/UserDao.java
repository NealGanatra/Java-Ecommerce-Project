package com.learn.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.learn.mycart.entities.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public User getUserByEmailandPassword(String username,String password) {
		
		User user=null;
		try {
			String query="from User where user_email=:e and user_password=:p";
			Session session=factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", username);
			q.setParameter("p", password);
			user=(User)q.uniqueResult();
			session.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
}
