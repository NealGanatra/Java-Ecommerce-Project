package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession httpSession=request.getSession();
		try {
			String userName=request.getParameter("user_name");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userPhone=request.getParameter("user_phone");
			String userAddress=request.getParameter("user_address");
			String userPic="default.jpg";
			
			//validations
			if(userName!=null && userEmail!=null  && userPassword!=null && userPhone!=null && userAddress!=null) {
			
			User user=new User(userName, userEmail, userPassword, userPhone, userPic, userAddress,"normal");
			Session hibernateSession=FactoryProvider.getFactory().openSession();
			Transaction tx= hibernateSession.beginTransaction();
			int userId=(Integer) hibernateSession.save(user);
			
			tx.commit();
			hibernateSession.close();
			System.out.println("Successfully saved");
			System.out.println("UserId :"+userId);
			
			
			httpSession.setAttribute("message", "User Added Successfully!!\nUser ID is "+userId);
			response.sendRedirect("register.jsp");
			return;
			
			
			}
			else
				System.out.println("Data cannot be empty");
			httpSession.setAttribute("message","Data cannot be empty");
			response.sendRedirect("register.jsp");
			
		}
		catch(Exception e) {
			httpSession.setAttribute("message", e.getMessage());
			response.sendRedirect("register.jsp");
		}
	}

}
