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
		<table>
			<tr>
				<td style="padding: 25px">Airline</td>
				<td style="padding: 25px">Days of Operation</td>
				<td style="padding: 25px">Flight Number</td>
				<td style="padding: 25px">Domestic?</td>
				<td style="padding: 25px">Departing Airport</td>
				<td style="padding: 25px">Destination Airport</td>
				<td style="padding: 25px">Departure Date</td>
				<td style="padding: 25px">Aircraft ID</td>
			</tr>

		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String airport_id = request.getParameter("airport_id");
			
			//Make a select statement for the Sells table:
			String findWait = "SELECT * FROM flight WHERE in_airport = ? OR out_airport = ?";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement psWait = con.prepareStatement(findWait);
			
			psWait.setString(1, airport_id);
			psWait.setString(2, airport_id);
	
			ResultSet rsWait = psWait.executeQuery();
			
			
			while(rsWait.next()){
				%>
				<tr>
					<td style="padding: 25px"><p><%= rsWait.getString(1) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getInt(3) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getBoolean(4) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getString(5) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getString(6) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getDate(7) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getInt(8) %></p></td>
				</tr>
		<%	}; %>
		</table>
		<%
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.println(ex);
		}
		%>
	</body>
</html>