<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td style="padding: 25px">User ID</td>
		<td style="padding: 25px">Ticket Number</td>
		<td style="padding: 25px">Buy Date/Time</td>
		<td style="padding: 25px">Booking Fees</td>
		<td style="padding: 25px">Total Fares</td>
		<td style="padding: 25px">Ticket ID Num</td>
		<td style="padding: 25px">Ticket Type</td>
		<td style="padding: 25px">Seat Number</td>
		<td style="padding: 25px">Ticket Price</td>
	</tr>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String flight_num = request.getParameter("number");
		String first_name = request.getParameter("fName");
		String last_name = request.getParameter("lName");
		
		


		//Make a select statement:
		String find = "SELECT";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		if(flight_num != null) {
			String findFlight = "SELECT p.*, t.id_num, t.ticket_type, t.seat_num, t.ticket_price FROM purchase p INNER JOIN ticket t on p.ticket_num = t.ticket_num inner join ticket_flight tf on t.ticket_num = tf.ticket_num WHERE tf.ticket_num = ?";
			PreparedStatement ps = con.prepareStatement(findFlight);
			ps.setString(1, flight_num);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) { %>
				<tr>
					<td style="padding: 25px"><p><%= rs.getInt(1) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rs.getDate(3) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(4) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(5) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(6) %></p></td>
					<td style="padding: 25px"><p><%= rs.getString(7) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(8) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(9) %></p></td>
				</tr>
				
				
				
			<%}
			
		} else {
			String findName = "SELECT p.*, t.id_num, t.ticket_type, t.seat_num, t.ticket_price FROM purchase p INNER JOIN ticket t on p.ticket_num = t.ticket_num inner join customer c on p.u_id = c.u_id WHERE c.first_name = ? AND c.last_name = ?";
			PreparedStatement ps = con.prepareStatement(findName);
			ps.setString(1, first_name);
			ps.setString(2, last_name);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { %>
				<tr>
					<td style="padding: 25px"><p><%= rs.getInt(1) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rs.getDate(3) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(4) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(5) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(6) %></p></td>
					<td style="padding: 25px"><p><%= rs.getString(7) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(8) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(9) %></p></td>
				</tr>
			<%}
		}

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		/* response.sendRedirect("http://localhost:8080/cs336FinalProject/admin/viewAcc.jsp"); */
		
		
	} catch (Exception ex) {
		out.println(ex);
		out.println("Can't find reservations");
	}
%>
</table>
</body>
</html>