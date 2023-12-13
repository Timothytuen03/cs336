<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>CS336 Project: Customer Rep - View Airport Flights</title>
		
		
	</head>
	
	<body>
		<h1>What Airport would you like to view?</h1>
		
		<form method="post" action="/cs336FinalProject/customer-rep/javaFunctions/airportFlight.jsp">
			<label for="airport_id">Airport ID</label>
			<input name="airport_id"/>
			<input type="submit"/>
		</form>
		
	</body>
</html>