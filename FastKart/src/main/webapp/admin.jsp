<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.learn.mycart.entities.User"%>
    <%@page import="com.learn.mycart.entities.Category"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% User currUser=(User)session.getAttribute("current-user"); 
if(currUser==null){
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
}
else{
	if(currUser.equals("normal")){
		session.setAttribute("message", "You are not logged in !! Login first");
		response.sendRedirect("login.jsp");
		return;
	}
	
}

Map<String,Long> map=Helper.getCount(FactoryProvider.getFactory());
Long userCount=map.get("userCount");
Long productCount=map.get("productCount");
%>
<%CategoryDao catDao=new CategoryDao(FactoryProvider.getFactory());
List<Category> list=catDao.getCategories();
ProductDao prodDao=new ProductDao(FactoryProvider.getFactory());
List<Product> listProd=prodDao.getProducts();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/navbar.jsp" %>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/message.jsp" %>
<div class="container admin">
<h1>Welcome Admin</h1>
<div class="row mt-3">
<div class="col-md-4">
<div class="card text-center">
<div class="card-body">
<img alt="" src="Images/profile.png" height="150px" width="150px">
<h2>Users:<%=userCount %></h2>
</div>
</div>

</div>

<div class="col-md-4">
<div class="card text-center">
<div class="card-body">
<img alt="" src="Images/box.png" height="150px" width="150px">
<h2>Products:<%=productCount%></h2>
</div>
</div>

</div>

<div class="col-md-4">
<div class="card text-center">
<div class="card-body">
<img alt="" src="Images/categories.png" height="150px" width="150px">
<h2>Categories:<%=list.size() %></h2>
</div>
</div>

</div>
</div>
<div class="row mt-3">
<div class="col-md-6">
<div class="card text-center" data-bs-toggle="modal" data-bs-target="#add-product-modal">
<div class="card-body">
<img alt="" src="Images/add-to-cart.png" height="150px" width="150px">
<h2>Add Product</h2>
<p class="mt-2">Click to add Products</p>
</div>
</div>


</div>

<div class="col-md-6">
<div class="card text-center" data-bs-toggle="modal" data-bs-target="#add-category-modal">
<div class="card-body">
<img alt="" src="Images/add-file.png" height="150px" width="150px">
<h2>Add Category</h2>
<p class="mt-2">Click to add Categories</p>
</div>
</div>

</div>

</div>
</div>




<!-- add category modal start -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header  custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form class="form-group" action="ProductOperationServlet" method="post">
        <input type="hidden" name="operation" value="addCategory">
       <input type="text" class="form-control" placeholder="Enter Category Title here" name="categoryTitle"/><br/>
		<textarea rows="5" cols="30" class="form-control" placeholder="Enter Category description" name="categoryDescription"></textarea>       
       <br/>
       <div class="container text-center">
        
        <button type="submit" class="btn btn-outline-success">Add Category</button>
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       </div>
       
       </form>
      </div>

    </div>
  </div>
</div>
<!-- add category modal end -->

<!-- add Product modal start -->

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header  custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form class="form-group" action="ProductOperationServlet" method="post" enctype="multipart/form-data">
       <input type="hidden" name="operation" value="addProduct">
       <input type="text" class="form-control" placeholder="Enter Product Name here" name="pName"/><br/>
		<textarea rows="5" cols="30" class="form-control" placeholder="Enter Product description" name="pDescription"></textarea>       
       <br/>
       <input type="text" class="form-control" placeholder="Enter Product Price here" name="pPrice"/><br/>
       <input type="text" class="form-control" placeholder="Enter Product Quantity here" name="pQuantity"/><br/>
       <input type="text" class="form-control" placeholder="Enter Product Discount here" name="pDiscount"/><br/>
       
         <div class="form-group">
         <label for="pPhoto">Select Product Image</label>
       <input type="file" class="form-control" name="pPhoto" id="pPhoto" required/><br/>
       </div>
       <div class="form-group">
       <select name="pCatId" id="" class="form-control">
       <%for(Category c:list){ %>
       <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>
       <%} %>
       </select>
       </div>
       
       
       
       <div class="container text-center">
        
        <button type="submit" class="btn btn-outline-success">Add Product</button>
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       </div>
       
       </form>
      </div>

    </div>
  </div>
</div>
<!-- add Product modal end -->
<%@include file="components/common_modal.jsp" %>
</body>
</html>