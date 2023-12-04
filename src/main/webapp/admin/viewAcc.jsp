<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>CS336 Project: Admin - Edit Users</title>
		
		<script language="javascript">
			const deleteData = (id) => {
				console.log("delete data! " + id)
				location.href = "/cs336FinalProject/admin/deleteUser.jsp?id="+id;
			}
		
		
		</script>
	</head>
	
	<body>
		<table>
			<th>
				<td>User ID</td>
				<td>Username</td>
				<td>Admin Perms?</td>
				<td>Cust. Rep. Perms?</td>
			</th>
		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a select statement for the Sells table:
			String find = "SELECT u_id, username, isAdmin, isRep FROM user";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(find);
	
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()){
				%>
				<tr>
					<td><p><%= rs.getInt(1) %></p></td>
					<td><p><%= rs.getString(2) %></p></td>
					<td><p><%= rs.getBoolean(3) %></p></td>
					<td><p><%= rs.getBoolean(4) %></p></td>
					<td><button onclick="deleteData(<%=rs.getInt(1)%>)">Delete</button></td>
				</tr>
		<%	}
			
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.println(ex);
		}
		%>
	
		</table>
		<button onclick="location.href ='/cs336FinalProject/admin/addUser.jsp'">Add new User</button>
	</body>
</html>