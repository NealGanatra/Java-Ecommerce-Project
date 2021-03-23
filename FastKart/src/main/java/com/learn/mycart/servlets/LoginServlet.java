package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.exception.InvalidLoginException;
import com.learn.mycart.helper.FactoryProvider;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
	HttpSession session=request.getSession();
	try {
	String username=request.getParameter("email");
	String password=request.getParameter("password"); 
	
if(username==null || username=="") {
	out.println("Username cannot be null");
	throw new InvalidLoginException("Username cannot be null");
}
if(password==null || password=="") {
	out.println("Password cannot be null");
	throw new InvalidLoginException("Password cannot be null");
}

UserDao userDao=new UserDao(FactoryProvider.getFactory());
User user=userDao.getUserByEmailandPassword(username, password);
	System.out.println("user:"+user);	
	if(user==null) {
		out.println("Invalid Credentials !!");
		throw new InvalidLoginException("Invalid Credentials");
	}
	else {
		out.println("Welcome "+user.getUserName());
		session.setAttribute("message","Welcome "+user.getUserName());
		session.setAttribute("current-user",user);
		if(user.getUserType().equalsIgnoreCase("admin"))
			response.sendRedirect("admin.jsp");
		else if(user.getUserType().equalsIgnoreCase("normal"))
			response.sendRedirect("normal.jsp");
		else
			out.println("We have not identified User Type");
	}
	
	//response.sendRedirect("login.jsp");
	}catch(Exception e) {
		e.printStackTrace();
		session.setAttribute("message", e.getMessage());
		response.sendRedirect("login.jsp");
	}
	}

}
