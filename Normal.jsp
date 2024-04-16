

<%@page import="com.mycompany.ecommerce.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first !!");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("admin")) {
		session.setAttribute("message", "You are a Admin !! You cant login in to User Account !!");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Normal User Page</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
</body>
</html>