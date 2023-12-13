<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>CS336 Project: Admin - Edit Users</title>
		
		
	</head>
	
	<body>
		<h1>What flight would you like to view?</h1>
		
		<form method="post" action="/cs336FinalProject/customer-rep/javaFunctions/viewWait.jsp">
			<label for="flight_num">Flight Number</label>
			<input name="flight_num"/>
			<label for="airline_id">Airline ID</label>
			<input name="airline_id"/>
			<input type="submit"/>
		</form>
		
	</body>
</html>