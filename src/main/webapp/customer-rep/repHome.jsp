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
		
		<button onclick="location.href ='/cs336FinalProject/client/makeRes.jsp'" >Make Reservation</button>
		<button onclick="location.href ='/cs336FinalProject/client/editRes.jsp'" >Edit Res</button>
		<button onclick="location.href ='/cs336FinalProject/client/adjInfo.jsp'" >Adjust aircraft, airport and flight Info</button>
		<button onclick="location.href ='/cs336FinalProject/client/flightWait.jsp'" >View Waiting list for particular flight</button>
		<button onclick="location.href ='/cs336FinalProject/client/viewFlight.jsp'" >View Flights by Airport</button>
		<button onclick="location.href ='/cs336FinalProject/client/ansQ.jsp'" >Reply to Questions</button>
		

	</body>
</html>