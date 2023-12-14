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
	
	<script>
		const setSort = (dropdown) => {
			var selectedType = dropdown.options[dropdown.selectedIndex].value;
			if(selectedType == "flight") {
				document.getElementById("flight_num").style.display = "block"
				document.getElementById("cust_name").style.display = "none"
				document.getElementById("airline_id").style.display = "none"
			} else if(selectedType == "cust"){
				document.getElementById("cust_name").style.display = "block"
				document.getElementById("flight_num").style.display = "none"
				document.getElementById("airline_id").style.display = "none"
			} else {
				document.getElementById("airline_id").style.display = "block"
				document.getElementById("flight_num").style.display = "none"
				document.getElementById("cust_name").style.display = "none"
			}
		}
	</script>
	
	
	<body>
		<select onchange="setSort(this)">
			<option value="flight">flight number</option>
			<option value="cust">customer name</option>
			<option value="airline">airline</option>
		</select>
		
		<form id="flight_num" method="post" action="/cs336FinalProject/admin/javaFunctions/findRev.jsp">
			<label for="number">Flight Number</label>
			<input type="text" name="number"/>
			<button>Find Revenue</button>
		</form>
		
		<form id="cust_name" style="display: none" method="post" action="/cs336FinalProject/admin/javaFunctions/findRev.jsp">
			<label for="name">First Name</label>
			<input type="text" name="fName"/>
			<label for="name">Last Name</label>
			<input type="text" name="lName"/>
			<button>Find Revenue</button>
		</form>
		
		<form id="airline_id" style="display: none" method="post" action="/cs336FinalProject/admin/javaFunctions/findRev.jsp">
			<label for="name">Airline ID</label>
			<input type="text" name="airline_id"/>
			<button>Find Revenue</button>
		</form>
	</body>
</html>