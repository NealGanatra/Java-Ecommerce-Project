package com.learn.mycart.helper;

import java.util.HashMap;
import java.util.Map;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	public static String get10Words(String desc) {
		String strs[]=desc.split(" ");
		
		if(strs.length>10) {
			String res="";
			for(int i=0;i<10;i++) {
				res=res+strs[i];
			}
			return res;
		}
		else
			return desc;
	}
	
	public static Map<String,Long> getCount(SessionFactory factory) {
		
		HashMap<String,Long> map=new HashMap<String,Long>();
		Session session=factory.openSession();
		Query query1=session.createQuery("select count(1) from User");
		Query query2=session.createQuery("select count(1) from Product");
		Long userCount=(Long) query1.list().get(0);
		Long productCount=(Long) query2.list().get(0);
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		session.close();
		return map;
	}
}
