package com.learn.mycart.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;

public class ProductDao {

	private SessionFactory factory;
	
	public ProductDao(SessionFactory factory) {
		this.factory=factory;
	}
	
	public int saveProduct(Product product) {
		int prodId=0;
		try {
		Session session=this.factory.openSession();
		Transaction txn=session.beginTransaction();
		 prodId=(Integer) session.save(product);
		txn.commit();
		session.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return prodId;
	}
	
	public List<Product> getProducts(){
		Session s=this.factory.openSession();
		Query query=s.createQuery("from Product");
		List<Product> list=query.list();
		return list;
	}
	
	public List<Product> getProductsByCategoryId(int cId){
		Session session=this.factory.openSession();
		Query query=session.createQuery("from Product as p where p.category.categoryId=:id");
		query.setParameter("id", cId);
		List<Product> list=query.list();
		return list;
		
	}
	
	public int getDiscountedPrice(Product p) {
		double d=(Integer.parseInt(p.getpDiscount())/100.0)*Integer.parseInt(p.getpPrice());
		
		double discountedPrice=Integer.parseInt(p.getpPrice())-d;
		System.out.println("p value-->"+discountedPrice);
		int disc=(int)discountedPrice;
		return disc;
			
	}

}
