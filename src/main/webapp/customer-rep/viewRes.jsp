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
			<th>
				<td style="padding: 25px">User ID</td>
				<td style="padding: 25px">Ticket Number</td>
				<td style="padding: 25px">Buy Date/Time</td>
				<td style="padding: 25px">Booking Fees</td>
				<td style="padding: 25px">Total Fares</td>
				<td style="padding: 25px">Ticket ID Num</td>
				<td style="padding: 25px">Ticket Type</td>
				<td style="padding: 25px">Seat Number</td>
				<td style="padding: 25px">Ticket Price</td>
			</th>
		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a select statement for the Sells table:
			String find = "SELECT p.*, t.id_num, t.ticket_type, t.seat_num, t.ticket_price FROM purchase p INNER JOIN ticket t on p.ticket_num = t.ticket_num";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(find);
	
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()){
				int tix_num = rs.getInt(2);
				%>
				<tr>
					<td></td>
					<td style="padding: 25px"><p><%= rs.getInt(1) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rs.getDate(3) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(4) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(5) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(6) %></p></td>
					<td style="padding: 25px"><p><%= rs.getString(7) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(8) %></p></td>
					<td style="padding: 25px"><p><%= rs.getFloat(9) %></p></td>
					<button onclick="location.href ='/cs336FinalProject/customer-rep/editRes.jsp?ticket_num=<%=tix_num%>&type=<%=rs.getString(7)%>'">Edit</button>
				</tr>
		<%	};
			
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.println(ex);
		}
		%>
		</table>
	</body>
</html>