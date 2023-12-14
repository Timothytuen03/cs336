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
				<td style="padding: 25px">Booking Fee</td>
				<td style="padding: 25px">Total Fare</td>
				<td style="padding: 25px">Booking Fee + Total Fare</td>
				
			</tr>

		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String month = request.getParameter("month");
			String month_num = "1";
			if(month == "feb") month_num = "2";
			else if(month == "mar") month_num = "3";
			else if(month == "apr") month_num = "4";
			else if(month == "may") month_num = "5";
			else if(month == "jun") month_num = "6";
			else if(month == "jul") month_num = "7";
			else if(month == "aug") month_num = "8";
			else if(month == "sep") month_num = "9";
			else if(month == "oct") month_num = "10";
			else if(month == "nov") month_num = "11";
			else if(month == "dec") month_num = "12";
			
			
			
			
			
			//Make a select statement for the Sells table:
			String findSales = "SELECT p.booking_fee, p.total_fare, (p.booking_fee+p.total_fare) FROM purchase p WHERE MONTH(p.buy_date) = ?;";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement psPast = con.prepareStatement(findSales);
			
			psPast.setString(1, month_num);
	
			ResultSet rsPast = psPast.executeQuery();
			
			
			while(rsPast.next()){
				%>
				<tr>
					<td style="padding: 25px"><p><%= rsPast.getFloat(1) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getFloat(2) %></p></td>
					<td style="padding: 25px"><p><%= rsPast.getFloat(3) %></p></td>
				</tr>
		<%	}; %>
		
				<tr>
					<td style="padding: 25px"><p>Sum(Booking Fees) </p></td>
					<td style="padding: 25px"><p>Sum(Total Fares) </p></td>
					<td style="padding: 25px"><p>Sum(Booking Fees + Total Fares)</p></td>
				</tr>

		<%
			
			String sumSales = "SELECT sum(p.booking_fee), sum(p.total_fare), sum(p.booking_fee+p.total_fare) FROM purchase p WHERE MONTH(p.buy_date) = ?";
			
			PreparedStatement psSum = con.prepareStatement(sumSales);
			psSum.setString(1, month_num);
			ResultSet rsSum = psSum.executeQuery();
			
			while(rsSum.next()){
				%>
				<tr>
					<td style="padding: 25px"><p><%= rsSum.getFloat(1) %></p></td>
					<td style="padding: 25px"><p><%= rsSum.getFloat(2) %></p></td>
					<td style="padding: 25px"><p><%= rsSum.getFloat(3) %></p></td>
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