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
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String airline_id = request.getParameter("airline_id");
		String flight_num = request.getParameter("flight_num");
		String days_of_operation = request.getParameter("days_of_operation");
		String isDomestic = request.getParameter("isDomestic");
		String out_airport = request.getParameter("out_airport");
		String in_airport = request.getParameter("in_airport");
		String depart = request.getParameter("depart");
		String aircraft_id = request.getParameter("aircraft_id");

		//Make an insert statement for the Sells table:
		String del = "UPDATE flight SET days_of_operation=?, isDomestic=?, out_airport=?, in_airport=?, depart=?, aircraft_id=? WHERE flight_num = ? AND airline_id = ?";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(del);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, days_of_operation);
		if(isDomestic != null) {
			ps.setString(2, "1");
		} else {
			ps.setString(2, "0");
		}
		ps.setString(3, out_airport);
		ps.setString(4, in_airport);
		ps.setString(5, depart);
		ps.setString(6, aircraft_id);
		
		ps.setString(8, airline_id);
		ps.setString(7, flight_num);
		ps.executeUpdate();
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("http://localhost:8080/cs336FinalProject/customer-rep/adjInfo.jsp");
		
		
	} catch (Exception ex) {
		out.println(ex);
		out.println("Edit failed");
	}
%>
</body>
</html>