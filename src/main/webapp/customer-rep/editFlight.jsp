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
		String flight_num = request.getParameter("flight_num");
		String airline_id = request.getParameter("airline_id");
	%>

	<form method="post" action="/cs336FinalProject/customer-rep/javaFunctions/editFlight.jsp?flight_num=<%=flight_num%>&airline_id=<%=airline_id%>">
		<label for="days_of_operation">Days of Operation</label>
		<input type="text" name="days_of_operation"/>
		<label for="isDomestic">Domestic</label>
		<input type="checkbox" name="isDomestic" value="1"/>
		<label for="out_airport">Departing Airport</label>
		<input name="out_airport"/>
		<label for="in_airport">Arrival Airport</label>
		<input name="in_airport"/>
		<label for="depart">Departure Date YYYY-MM-DD</label>
		<input type="text" name="depart"/>
		<label for="aircraft_id">Aircraft ID</label>
		<input name="aircraft_id"/>
		<input type="submit"/>
	</form>
</body>
</html>