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
		
		<form method="post" action="/cs336FinalProject/admin/javaFunctions/genSales.jsp">
			<input type="submit" name="month" value="jan"/>
			<input type="submit" name="month" value="feb"/>
			<input type="submit" name="month" value="mar"/>
			<input type="submit" name="month" value="apr"/>
			<input type="submit" name="month" value="may"/>
			<input type="submit" name="month" value="jun"/>
			<input type="submit" name="month" value="jul"/>
			<input type="submit" name="month" value="aug"/>
			<input type="submit" name="month" value="sep"/>
			<input type="submit" name="month" value="oct"/>
			<input type="submit" name="month" value="nov"/>
			<input type="submit" name="month" value="dec"/>
		</form >
		
	</body>
</html>