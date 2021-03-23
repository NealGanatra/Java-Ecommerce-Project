<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>

<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp" %>

</head>
<body>
<h1>This is about page</h1>
<p>Hi Neal</p>
<%@include file="components/common_modal.jsp" %>
<button onclick="showToast()">Click Me</button>
<div id="toast" >This is toast tag</div>
</body>
</html>