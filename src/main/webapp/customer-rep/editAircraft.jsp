<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Flight</title>
</head>
<body>
	<%
		String aircraft_id = request.getParameter("aircraft_id");
	%>

	<form method="post" action="/cs336FinalProject/customer-rep/javaFunctions/editAircraft.jsp?aircraft_id=<%=aircraft_id%>">
		<label for="num_seats"># Seats</label>
		<input type="text" name="num_seats"/>
		<label for="airline_id">airline id</label>
		<input type="text" name="airline_id" />
		<input type="submit"/>
	</form>
</body>
</html>