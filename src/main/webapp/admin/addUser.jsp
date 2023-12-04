<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>CS336 Project Login</title>
	</head>
	
	<body>
	
		<form method="post" action="createUser.jsp">
			<input type="text" name="username" value="username"/>
			<input type="text" name="password" value="password"/>
			<label for="isAdmin">Admin role?</label>
			<input type="checkbox" name="isAdmin" value="admin"/>
			<label for="isRep">Customer Representative role?</label>
			<input type="checkbox" name="isRep" value="customerRep"/>
			<input type="submit"/>
		</form>
	</body>
</html>