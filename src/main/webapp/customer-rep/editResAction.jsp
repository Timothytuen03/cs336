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
		
		String newType = request.getParameter("type");
		String newSeat = request.getParameter("seat_num");
		out.print(newSeat);

		String ticket_num = request.getParameter("ticket_num");
		String find_orig = "SELECT ticket_num, ticket_type, seat_num FROM ticket where ticket_num = ?";
		PreparedStatement psOrig = con.prepareStatement(find_orig);
		psOrig.setString(1, ticket_num);
		ResultSet rsOrig = psOrig.executeQuery();
		rsOrig.next();
		String orig_type = rsOrig.getString(2);
		int orig_seat = rsOrig.getInt(3);
			

		/* if (newType != orig_type && newSeat != "" && Integer.parseInt(newSeat) != orig_seat && newType != "") {
			String update = "UPDATE ticket SET ticket_type = ?, seat_num = ? WHERE ticket_num = ?";
			PreparedStatement ps = con.prepareStatement(update);
			ps.setString(1, newType);
			ps.setString(2, newSeat);
			ps.setString(3, ticket_num);
			int res = ps.executeUpdate();
		}
		else { */
			if(newType != orig_type && newType != "") {
				String updateType = "UPDATE ticket SET ticket_type = ? WHERE ticket_num = ?";	
				PreparedStatement psType = con.prepareStatement(updateType);
				psType.setString(1, newType);
				psType.setString(2, ticket_num);
				int res = psType.executeUpdate();
			}
		
			if(newSeat != "" && Integer.parseInt(newSeat) != orig_seat){
				String updateSeat = "UPDATE ticket SET seat_num = ? WHERE ticket_num = ?";
				PreparedStatement psSeat = con.prepareStatement(updateSeat);
				psSeat.setString(1, newSeat);
				psSeat.setString(2, ticket_num);
				int resSeat = psSeat.executeUpdate();
			}
		//}
		
		
		
		if(orig_type == "Economy" && orig_type != newType && newType != "") {
			//Add $100 fee
			String updateCost = "UPDATE purchase SET total_fare = total_fare+100 WHERE ticket_num = ?";
			PreparedStatement psFee = con.prepareStatement(updateCost);
			psFee.setString(1, ticket_num);
			int resFee = psFee.executeUpdate();
		}
		

		
		response.sendRedirect("http://localhost:8080/cs336FinalProject/customer-rep/viewRes.jsp");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("select succeeded");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("select failed");
	}
%>
</body>
</html>