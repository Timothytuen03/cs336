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
		
		<button onclick="location.href ='/cs336FinalProject/client/flightSearch.jsp'" >Search for Flights</button>
		<button onclick="location.href ='/cs336FinalProject/client/qa.jsp'" >Q&A</button>
		<button onclick="location.href ='/cs336FinalProject/client/prevFlight.jsp'" >View Past Flights</button>
		<button onclick="location.href ='/cs336FinalProject/client/nearFlight.jsp'" >View Upcoming Flights</button>
		<button onclick="location.href ='/cs336FinalProject/loginPage.jsp'" >Logout</button>
		
		<!-- <form method="post" action="postQuestion.jsp">
			<input type="text" name="user" value="user"/>
			<input type="text" name="topic" value="topic"/>
			<input type="text" name="question" value="question"/>
			<input type="submit"/>
		</form> -->

	</body>
</html>