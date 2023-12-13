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
		const deleteAircraft = (aircraft_id) => {
			document.location.href = "/cs336FinalProject/customer-rep/javaFunctions/deleteAircraft.jsp?aircraft_id=" + encodeURIComponent(aircraft_id);
		}
		
		/* const addAircraft = () => {
			document.location.href = "/cs336FinalProject/customer-rep/javaFunctions/addAircraft.jsp"
		} */
		
		const editAircraft = (aircraft_id) => {
			document.location.href = "/cs336FinalProject/customer-rep/editAircraft.jsp?aircraft_id=" + encodeURIComponent(aircraft_id);
		}
		
		const deleteAirport = (airport_id) => {
			document.location.href = "/cs336FinalProject/customer-rep/javaFunctions/deleteAirport.jsp?airport_id=" + encodeURIComponent(airport_id);
		}
		
		
		const deleteFlight = (flight_num, airline_id) => {
			document.location.href = "/cs336FinalProject/customer-rep/javaFunctions/deleteFlight.jsp?airline_id=" + encodeURIComponent(airline_id) +
					"&flight_num=" + encodeURIComponent(flight_num);
		}
		
		const editFlight = (flight_num, airline_id) => {
			document.location.href = "/cs336FinalProject/customer-rep/editFlight.jsp?airline_id=" + encodeURIComponent(airline_id) +
			"&flight_num=" + encodeURIComponent(flight_num);
		}

	</script>
	<body>
		<table>
			<tr>
				<td style="padding: 25px">Aircraft ID</td>
				<td style="padding: 25px">Number of Seats</td>
				<td style="padding: 25px">Airline</td>
			</tr>

		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a select statement for the Sells table:
			String findAircraft = "SELECT * FROM aircraft";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement psAircraft = con.prepareStatement(findAircraft);
	
			ResultSet rsAircraft = psAircraft.executeQuery();
			
			
			while(rsAircraft.next()){
				%>
				<tr>
					<td style="padding: 25px"><p><%= rsAircraft.getInt(1) %></p></td>
					<td style="padding: 25px"><p><%= rsAircraft.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rsAircraft.getString(3) %></p></td>
					<td><button onclick="deleteAircraft(<%=rsAircraft.getInt(1)%>)">Delete</button></td>
					<td><button onclick="editAircraft(<%=rsAircraft.getInt(1)%>)">Edit</button></td>
				</tr>
		<%	};%>
		
		</table>
		<form method="post" action="/cs336FinalProject/customer-rep/javaFunctions/addAircraft.jsp">
			<label for="aircraft_id">Aircraft ID</label>
			<input type="text" name="aircraft_id"/>
			
			<label for="num_seats">Number Seats</label>
			<input type="text" name="num_seats"/>
			
			<label for="airline_id">Airline ID</label>
			<input type="text" name="airline_id"/>
			<input type="submit"/>
		</form>
		
		<table>
			<tr>
				<td style="padding: 25px">Airport ID</td>
			</tr>
		
		<%
			String findAirport = "SELECT * FROM airport";
			PreparedStatement psAirport = con.prepareStatement(findAirport);
			ResultSet rsAirport = psAirport.executeQuery();
			
			while(rsAirport.next()) {
		%>
			<tr>
				<td style="padding: 25px"><p><%= rsAirport.getString(1) %></p></td>
				<td><button onclick="deleteAirport('<%=rsAirport.getString(1)%>')">Delete</button></td>
			</tr>
		<%}; %>
		
		</table>
		<form method="post" action="/cs336FinalProject/customer-rep/javaFunctions/addAirport.jsp">
			<label for="airport_id">Airport ID</label>
			<input type="text" name="airport_id"/>
			<input type="submit"/>
		</form>
			
		<table>
			<tr>
				<td style="padding: 25px"><p>Airline ID</p></td>
				<td style="padding: 25px"><p>Days of Operation</p></td>
				<td style="padding: 25px"><p>Flight Number</p></td>
				<td style="padding: 25px"><p>Domestic?</p></td>
				<td style="padding: 25px"><p>Out Airport</p></td>
				<td style="padding: 25px"><p>In Airport</p></td>
				<td style="padding: 25px"><p>Departure</p></td>
				<td style="padding: 25px"><p>Aircraft ID</p></td>
			</tr>
		
		<%
			String findFlight = "SELECT * FROM flight";
			PreparedStatement psFlight = con.prepareStatement(findFlight);
			ResultSet rsFlight = psFlight.executeQuery();
			
			while(rsFlight.next()) {
		%>
			<tr>
				<td style="padding: 25px"><p><%= rsFlight.getString(1) %></p></td>
				<td style="padding: 25px"><p><%= rsFlight.getInt(2) %></p></td>
				<td style="padding: 25px"><p><%= rsFlight.getInt(3) %></p></td>
				<td style="padding: 25px"><p><%= rsFlight.getBoolean(4) %></p></td>
				<td style="padding: 25px"><p><%= rsFlight.getString(5) %></p></td>
				<td style="padding: 25px"><p><%= rsFlight.getString(6) %></p></td>
				<td style="padding: 25px"><p><%= rsFlight.getDate(7) %></p></td>
				<td style="padding: 25px"><p><%= rsFlight.getInt(8) %></p></td>
				<%-- <td><button onclick="deleteFlight(<%=rsFlight.getString(1)%>, )">Delete Flight</button></td> --%>
				<td><button onclick="deleteFlight(<%=rsFlight.getInt(3)%>, '<%=rsFlight.getString(1)%>')">Delete Flight</button></td>
				<td><button onclick="editFlight(<%=rsFlight.getInt(3)%>, '<%=rsFlight.getString(1)%>')">Edit Flight</button></td>
			</tr>
		<%}; %>
		
		</table>
		<form method="post" action="/cs336FinalProject/customer-rep/javaFunctions/addFlight.jsp">
			<label for="airline_id">Airline ID</label>
			<input type="text" name="airline_id"/>
			
			<label for="days_operation">Days of Operation</label>
			<input type="text" name="days_operation" value="1"/>
			
			<label for="flight_num">Flight Number</label>
			<input type="text" name="flight_num"/>
	
			<label for="isDomestic">Domestic?</label>
			<input type="checkbox" name="isDomestic" value="domestic"/>
			
			<label for="out_airport">Departing Airport</label>
			<input type="text" name="out_airport"/>
			
			<label for="in_airport">Destination Airport</label>
			<input type="text" name="in_airport"/>
			
			<label for="departure">Departure Day (YYYY-MM-DD HH:MM:SS)</label>
			<input type="text" name="departure"/>
			
			<label for="aircraft_id"> Aircraft ID</label>
			<input type="text" name="aircraft_id"/>
			<input type="submit"/>
		</form>
		
		
		
		
		
		<%
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.println(ex);
		}
		%>
	</body>
</html>