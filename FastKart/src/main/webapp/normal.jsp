<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.learn.mycart.entities.User"%>
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Normal</title>
<%@include file="components/navbar.jsp" %>
</head>
<body>
<%@include file="components/common_css_js.jsp" %>
<%@include file="components/message.jsp" %>

<%@include file="components/common_modal.jsp" %>
</body>
</html>