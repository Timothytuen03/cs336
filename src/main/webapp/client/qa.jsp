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
			<tr>
				<td style="padding: 25px">Question ID</td>
				<td style="padding: 25px">User ID</td>
				<td style="padding: 25px">Rep ID</td>
				<td style="padding: 25px">Question</td>
				<td style="padding: 25px">Answer</td>
			</tr>

		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a select statement for the Sells table:
			String findWait = "SELECT * FROM q_a";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement psWait = con.prepareStatement(findWait);
	
			ResultSet rsWait = psWait.executeQuery();
			
			
			while(rsWait.next()){
				%>
				<tr>
					<td style="padding: 25px"><p><%= rsWait.getInt(1) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getInt(3) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getString(4) %></p></td>
					<td style="padding: 25px"><p><%= rsWait.getString(5) %></p></td>
					
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
		<form method="post" action="http://localhost:8080/cs336FinalProject/client/javaFunctions/qaKeyword.jsp">
			<label for="keyword">Search by keyword</label>
			<input type="text" name="keyword"/>
			<input type="submit"/>
		</form>
		<form method="post" action="http://localhost:8080/cs336FinalProject/client/javaFunctions/qaPost.jsp">
			<label for="question">Ask your question!</label>
			<input type="text" name="question"/>
			<input type="submit"/>
		</form>
	</body>
</html>