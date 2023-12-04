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
		<button onclick="location.href ='/cs336FinalProject/admin/viewAcc.jsp'" >Determine a user's fate</button>
		<button onclick="location.href ='/cs336FinalProject/admin/salesReport.jsp'" >View Sales Reports per Month</button>
		<button onclick="location.href ='/cs336FinalProject/admin/viewRes.jsp'" >View Reservations</button>
		<button onclick="location.href ='/cs336FinalProject/admin/revenue.jsp'" >Revenue Summary</button>
		<button onclick="location.href ='/cs336FinalProject/admin/activeFlight.jsp'" >View Flights</button>
	</body>
</html>