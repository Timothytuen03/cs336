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
		<select name="month">
			<option value="jan">January</option>
  			<option value="feb">February</option>
			<option value="mar">March</option>
			<option value="apr">April</option>
			<option value="may">May</option>
  			<option value="jun">June</option>
			<option value="jul">July</option>
			<option value="aug">August</option>
			<option value="sep">September</option>
  			<option value="oct">October</option>
			<option value="nov">November</option>
			<option value="dec">December</option>
		</select>
		
		<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//Make a select statement for the Sells table:
		String getRev = "SELECT * FROM user WHERE username = (?) AND password = (?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(getRev);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		/* ps.setString(1, username); */
		ResultSet result = ps.executeQuery();

		out.print(result);
		
		/* int id = result.getInt("idcustomer"); */
		/* out.print(" user's id: " + id + "   "); */
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