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
	
	<script>
		let type = "";
		let seat = "";
	
		const setType = (dropdown) => {
			type = dropdown.options[dropdown.selectedIndex].value;
			console.log(type);
		}
		
		const setSeat = (dropdown) => {
			seat = dropdown.options[dropdown.selectedIndex].value;
			console.log(seat);
		}
		
		const movePage = (tix_num) => {
			console.log("move page");
			const address = "/cs336FinalProject/customer-rep/editResAction.jsp?ticket_num="+encodeURIComponent(tix_num)+"&type="+ encodeURIComponent(type) +"&seat_num="+ encodeURIComponent(seat);
			document.location.href = address;
		}
		
	</script>
	
	<body>
		
		<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a select statement for the Sells table:
			String find = "SELECT p.*, t.id_num, t.ticket_type, t.seat_num, t.ticket_price FROM purchase p INNER JOIN" + 
			" ticket t on p.ticket_num = t.ticket_num where t.ticket_num = ?";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(find);
			
			String ticketNum = request.getParameter("ticket_num");
			String tix_type = request.getParameter("type");
			ps.setString(1, ticketNum);
			ResultSet rs = ps.executeQuery();
			
			
			
			
			
			String get_flight = "SELECT tf.flight_num from ticket_flight tf inner join ticket t on tf.ticket_num = t.ticket_num AND t.ticket_num = (?)";
			PreparedStatement psFlight = con.prepareStatement(get_flight);
			psFlight.setString(1, ticketNum);
			ResultSet rsFlight = psFlight.executeQuery();
			String flight_num = "-1";
			if(rsFlight.next()) {
				flight_num = ""+rsFlight.getInt("flight_num");
			}
			
			
			String seats_avail = "SELECT t.seat_num FROM ticket_flight tf INNER JOIN ticket t on tf.ticket_num = t.ticket_num WHERE flight_num = (?)";
			
			PreparedStatement psSeats = con.prepareStatement(seats_avail);
			psSeats.setString(1, flight_num);
			ResultSet rsSeats = psSeats.executeQuery();
			
			ArrayList<Integer> seats_taken = new ArrayList<Integer>();
			while(rsSeats.next()){
				seats_taken.add(rsSeats.getInt(1));
			}
			
			String total_seats = "SELECT a.num_seats FROM aircraft a INNER JOIN flight f on a.aircraft_id = f.aircraft_id AND f.flight_num = (?)";
			PreparedStatement psTotalSeats = con.prepareStatement(total_seats);
			psTotalSeats.setString(1, flight_num);
			ResultSet rsTotSeats = psTotalSeats.executeQuery();
			int seats_num = -1;
			if(rsTotSeats.next()) {
				seats_num = rsTotSeats.getInt(1);
			}; 
			
			
			while(rs.next()) {
				int tix_num = rs.getInt(2);
				%>
					<div style="display:flex">
						<p style="padding: 20px"><%= rs.getInt(1) %></p>
						<p style="padding: 20px"><%= rs.getInt(2) %></p>
						<p style="padding: 20px"><%= rs.getDate(3) %></p>
						<p style="padding: 20px"><%= rs.getFloat(4) %></p>
						<p style="padding: 20px"><%= rs.getFloat(5) %></p>
						<p style="padding: 20px"><%= rs.getInt(6) %></p>
						<%-- <p style="padding: 20px"><%= rs.getString(7) %></p> --%>
						<select onchange="setType(this)">
							<option value="" disabled selected>Select your option</option>
							<option value="Economy" >Economy</option>
							<option value="Business" >Business</option>
							<option value="FirstClass" >First Class</option>
						</select>
						<p style="padding: 20px"><%= rs.getInt(8) %></p>
						<select onchange="setSeat(this)">
							<option value="<%= rs.getInt(8) %>"><%= rs.getInt(8) %></option>
							<%
								for(int i = 1; i <= seats_num; i++) {
									out.print(i);
									if(seats_taken.contains(i)) {
										out.print(i);
										continue;
									}
									else {
							%>		
										<option value="<%=i%>"><%= i %></option>	
							<%
									}
								}
							
							%>
						</select>
						<p style="padding: 20px"><%= rs.getFloat(9) %></p>
						<button onclick="movePage(<%=tix_num%>)">Save</button>
					</div>
			<%	}
			
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.println(ex);
		}
		%>

	</body>
</html>