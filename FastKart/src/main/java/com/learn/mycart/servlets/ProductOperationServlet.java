package com.learn.mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductOperationServlet() {
        super();
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession httpSession=request.getSession();
		PrintWriter out=response.getWriter();
		String oper=request.getParameter("operation");
		if(oper.equals("addCategory")) {
		
		String catTitile=request.getParameter("categoryTitle");
		String catDesc=request.getParameter("categoryDescription");
		Category category=new Category(catTitile, catDesc);
		
		CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
		int catId=categoryDao.saveCategory(category);
		//out.println("Category Added");
		httpSession.setAttribute("message", "Category Added successfully! Category Id is "+catId);
		response.sendRedirect("admin.jsp");
		
		}
		else if(oper.equals("addProduct")) {
			String pName=request.getParameter("pName");
			String pDesc=request.getParameter("pDescription");
			String pDiscount=request.getParameter("pDiscount");
			String pQuantity=request.getParameter("pQuantity");
			String pPrice=request.getParameter("pPrice");
			
			System.out.println("Cat Id is: "+request.getParameter("pCatId"));
			int pCatId=Integer.parseInt(request.getParameter("pCatId"));
			CategoryDao catDao=new CategoryDao(FactoryProvider.getFactory());
			Category category=catDao.getCategoryById(pCatId);
			
			Part part=request.getPart("pPhoto");
			Product product=new Product();
			product.setpName(pName);
			product.setpDesc(pDesc);
			product.setpDiscount(pDiscount);
			product.setpPhoto(part.getSubmittedFileName());
			product.setpQuantity(pQuantity);
			product.setpPrice(pPrice);
			product.setCategory(category);
			
			
			ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
			productDao.saveProduct(product);
			try {
			String path=request.getContextPath().concat("Images")+File.separator+"products"+File.separator+part.getSubmittedFileName();
			System.out.println("path-->"+path);
			FileOutputStream fos=new FileOutputStream(path);
			InputStream is=part.getInputStream();
			byte[] data=new byte[is.available()];
			is.read();
			fos.write(data);
			fos.close();
			is.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			httpSession.setAttribute("message", "Product Added Successfully!!");
			response.sendRedirect("admin.jsp");
		}
	}

}
