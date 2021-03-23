<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">
<div class="row mt-5">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<%@include file="components/message.jsp" %>
<center><img alt="signup" src="Images/signuplogo.png" height="80px" width="100px"></center>
<h3 class="text-center">Sign Up here</h3>

<form action="RegisterServlet" method="post">
 <div class="form-group">
    <label for="name" class="form-label">Name:</label>
    <input type="text"  name="user_name" class="form-control" id="name" placeholder="Enter Name here"/>
  </div>
   <div class="form-group">
    <label for="email" class="form-label">Email Id:</label>
    <input type="email" name="user_email" class="form-control" id="email"  placeholder="Enter email Id here">
  </div>
     <div class="form-group">
    <label for="password" class="form-label">Password:</label>
    <input type="password" name="user_password" class="form-control" id="user_password" placeholder="Enter password here">
  </div>
  <div class="form-group">
    <label for="user_phone" class="form-label">Phone No:</label>
    <input type="number" name="user_phone" class="form-control" id="user_phone" placeholder="Enter Phone number here"/>
  </div>
  <div class="form-group">
    <label for="user_address" class="form-label">Address:</label>
    <textarea class="form-control" name="user_address" id="user_address" placeholder="Enter address here" cols="50" rows="5"></textarea>
  </div>
  <div class="container text-center mt-3">
  <button class="btn btn-outline-success">Register</button>
  <button class="btn btn-outline-warning">Reset</button>
  </div>
  
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>