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
		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			HttpSession httpSession = request.getSession();
			
			String keyword = request.getParameter("keyword");
			
			//Make a select statement for the Sells table:
			String updateAns = "SELECT * FROM q_a WHERE question LIKE ? OR answer LIKE ?";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement psAns = con.prepareStatement(updateAns);
			psAns.setString(1, '%'+keyword+'%');
			psAns.setString(2, '%'+keyword+'%');
	
			ResultSet rs = psAns.executeQuery();
			
			while(rs.next()){
				%>
				<tr>
					<td style="padding: 25px"><p><%= rs.getInt(1) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(2) %></p></td>
					<td style="padding: 25px"><p><%= rs.getInt(3) %></p></td>
					<td style="padding: 25px"><p><%= rs.getString(4) %></p></td>
					<td style="padding: 25px"><p><%= rs.getString(5) %></p></td>
					
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