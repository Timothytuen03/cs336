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
		<td style="padding: 25px">Booking Fees</td>
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
		String airline_id = request.getParameter("airline_id");
		
		


		//Make a select statement:
		String findSales = "SELECT p.booking_fee FROM purchase p WHERE MONTH(p.buy_date) = ?;";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		if(first_name == null && airline_id == null) {
			String findSalesFlight = "SELECT p.booking_fee FROM purchase p inner join ticket_flight tf on p.ticket_num = tf.ticket_num WHERE tf.flight_num = ?;";
			PreparedStatement ps = con.prepareStatement(findSalesFlight);
			ps.setString(1, flight_num);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) { %>
				<tr>
					<td style="padding: 25px"><p><%= rs.getInt(1) %></p></td>

				</tr>
				
				
				
			<%}
			
		} else if(flight_num == null && airline_id == null){
			String findSalesName = "SELECT p.booking_fee FROM purchase p INNER JOIN customer c on p.u_id = c.u_id WHERE c.first_name = ? AND c.last_name = ?;";
			PreparedStatement ps = con.prepareStatement(findSalesName);
			ps.setString(1, first_name);
			ps.setString(2, last_name);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { %>
				<tr>
					<td style="padding: 25px"><p><%= rs.getInt(1) %></p></td>
				</tr>
			<%}
		} else {
			String findSalesAirline = "SELECT p.booking_fee FROM purchase p inner join ticket_flight tf on p.ticket_num = tf.ticket_num INNER JOIN flight f on tf.flight_num = f.flight_num WHERE f.airline_id = ?;";
			PreparedStatement ps = con.prepareStatement(findSalesAirline);
			ps.setString(1, airline_id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) { %>
			<tr>
				<td style="padding: 25px"><p><%= rs.getInt(1) %></p></td>

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