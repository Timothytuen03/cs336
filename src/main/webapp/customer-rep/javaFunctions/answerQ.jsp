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
		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			HttpSession httpSession = request.getSession();
			
			String answer = request.getParameter("answer");
			
            String rep = ""+httpSession.getAttribute("user");
            String q_id = request.getParameter("q_id");
			//Make a select statement for the Sells table:
			String updateAns = "UPDATE q_a SET answer = ?, rep_id = ? WHERE q_id = ?";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement psAns = con.prepareStatement(updateAns);
			psAns.setString(1, answer);
			psAns.setString(2, rep);
			psAns.setString(3, q_id);
	
			int res = psAns.executeUpdate();
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			response.sendRedirect("http://localhost:8080/cs336FinalProject/customer-rep/ansQ.jsp");
			
		} catch (Exception ex) {
			out.println(ex);
		}
		%>
	</body>
</html>