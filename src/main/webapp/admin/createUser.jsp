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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String isAdmin = request.getParameter("isAdmin");
		String isRep = request.getParameter("isRep");
		
		out.print(isAdmin);
		out.print(isRep);


		//Make an insert statement for the Sells table:
		String ins = "INSERT INTO user (username, password, isAdmin, isRep) VALUES(?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(ins);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, username);
		ps.setString(2, password);
		if(isAdmin != null) {
			ps.setBoolean(3, true);
		} else {
			ps.setBoolean(3, false);
		}
		if(isRep != null) {
			ps.setBoolean(4, true);
		} else {
			ps.setBoolean(4, false);
		}
		int result = ps.executeUpdate();
		if(result == 0) {
			out.print("there was an error!");
		} else {
			out.print("insert successful");
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("http://localhost:8080/cs336FinalProject/admin/viewAcc.jsp");
		
		
	} catch (Exception ex) {
		out.println(ex);
		out.println("Creation of new user failed");
	}
%>
</body>
</html>