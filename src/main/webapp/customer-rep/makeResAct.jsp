<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.*"%>
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
		/* int u_id =  (Integer)httpSession.getAttribute("user"); */
		String u_id = request.getParameter("u_id");
		String ticket_num = request.getParameter("ticket_num");
		
		String getPrice = "SELECT ticket_price FROM ticket";
		PreparedStatement psPrice = con.prepareStatement(getPrice);
		/* psPrice.setString(1, ticket_num); */
		
		ResultSet ticket_price_result = psPrice.executeQuery();
		String ticket_price = "";
		if(ticket_price_result.next()) {
			ticket_price = ticket_price + ticket_price_result.getFloat("ticket_price"); 
			
		}
		
		out.print(ticket_price);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = dateFormat.format((new java.util.Date())).toString();
		/* String time = ""+(new java.util.Date()).getTime(); */
		/* String today = (new java.util.Date()).toString(); */
		
		//Make an insert statement for the Sells table:
		String ins = "INSERT INTO purchase VALUES(?, ?, ?, 0, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(ins);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, u_id);
		ps.setString(2, ticket_num);
		ps.setString(3, today);
		ps.setString(4, ticket_price);
		int result = ps.executeUpdate();
		if(result == 0) {
			out.print("there was an error!");
		} else {
			out.print("insert successful");
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("http://localhost:8080/cs336FinalProject/customer-rep/repHome.jsp");
		
		
	} catch (Exception ex) {
		out.println(ex);
		out.println("Creation of new user failed");
	}
%>
</body>
</html>