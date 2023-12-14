<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>CS336 Project Login</title>
	</head>
	<body>
		<table>
			<tr>
				<td style="padding: 25px">User ID</td>
				<td style="padding: 25px">Ticket Number</td>
				<td style="padding: 25px">Buy Date</td>
				<td style="padding: 25px">Booking Fee</td>
				<td style="padding: 25px">Total Fare</td>
				<td style="padding: 25px">Flight Number</td>
				<td style="padding: 25px">Airline ID</td>
				<td style="padding: 25px">Departing Airport</td>
				<td style="padding: 25px">Arrival Airport</td>
				<td style="padding: 25px">Aircraft ID</td>
				<td style="padding: 25px">Ticket Type</td>
				
			</tr>

		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			HttpSession httpSession = request.getSession();
			
			String customer = ""+httpSession.getAttribute("user");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String today = dateFormat.format((new java.util.Date())).toString();
			//Make a select statement for the Sells table:
			String findPast = "SELECT p.u_id, p.ticket_num, p.buy_date, p.booking_fee, p.total_fare, tf.flight_num, f.airline_id, f.out_airport, f.in_airport, f.aircraft_id, f.depart, t.ticket_type FROM purchase p inner join ticket_flight tf on p.ticket_num = tf.ticket_num inner join flight f on tf.flight_num = f.flight_num inner join ticket t on tf.ticket_num = t.ticket_num WHERE p.u_id = ? AND f.depart > ?";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement psPast = con.prepareStatement(findPast);
			
			psPast.setString(1, customer);
			psPast.setString(2, today);
	
			ResultSet rsPast = psPast.executeQuery();
			
			
			while(rsPast.next()){
				%>
				<tr>
					<td style="padding: 25px"><p><%= rsPast.getInt(1) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getDate(3) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getFloat(4) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getFloat(5) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getInt(6) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getString(7) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getString(8) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getString(9) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getInt(10) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getString(11) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getString(12) %></p></td>
					<%if(rsPast.getString(12) != "Economy") { %>
						<td><button onclick="location.href='/cs336FinalProject/client/javaFunctions/deleteRes.jsp?ticket_num=<%=rsPast.getInt(2)%>&u_id=<%=customer%>'">Cancel Reservation</button></td>
						
					<%} %>
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