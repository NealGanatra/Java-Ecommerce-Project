<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@page import="com.learn.mycart.entities.User"%>
    <% User currUser=(User)session.getAttribute("current-user"); 
if(currUser==null){
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>
<h1>Hi This is CheckOut page</h1>
<div class="container">
<div class="row mt-5">
<div class="col-md-6">
<div class="card">
<h3 class="text-center">Your Selected Items</h3>
<div class="cart-body">
</div>
</div>

</div>
<div class="col-md-6">
<div class="card">
<div class="card-body">

<form action="#!">
<div class="form-group">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" value="<%=currUser.getUserEmail() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
</div>
<div class="form-group">
    <label for="name" class="form-label">Your Name</label>
    <input type="text" class="form-control" value="<%=currUser.getUserName() %>"  id="name" aria-describedby="emailHelp">
</div>
<div class="form-group">
    <label for="name" class="form-label">Your Contact</label>
    <input type="text" class="form-control" value="<%=currUser.getUserPhone() %>"  id="contact" aria-describedby="emailHelp">
</div>

<div class="form-group">
    <label for=address class="form-label">Your Shipping Address</label>
    <textarea class="form-control"  value="<%=currUser.getUserAddress() %>" rows="5" cols="10" placeholder="Enter your Shipping address"></textarea>
</div>
<div>
<div class="container mt-3">
<button class="btn btn-outline-success">Order Now</button>
<button class="btn btn-outline-primary">Continue Shopping</button>
</div>
</div>
</form>
</div>

</div>
</div>
</div>

</div>
<%@include file="components/common_modal.jsp" %>
</body>
</html>