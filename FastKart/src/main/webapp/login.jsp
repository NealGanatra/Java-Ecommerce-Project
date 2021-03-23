<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login- FastKart</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card mt-3">
<div class="card-header custom-bg text-white">
<h3>Login Here</h3>
</div>
<%@include file="components/message.jsp" %>
</div>
<div class="card-body">
<form class="row g-3" action="LoginServlet" method="post">
  <div class="form-group mt-3">
    <label for="email" class="form-label">Email</label>
    <input type="email" class="form-control" name="email" id="email" placeholder="enter email address">
  </div>
  <br/>
  <div class="form-group">
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" name="password" id="password" placeholder="enter password">
  </div>
    <a href="register.jsp" class="text-center">If not register click here</a>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary custom-bg">Login</button>
  <button type="reset" class="btn btn-primary custom-bg">Reset</button>
  </div>

  </form>
</div>
<div class="card-footer">
</div>
</div>
</div>
</div>
</body>
</html>