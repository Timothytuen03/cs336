import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/dispUser")
public class dispUser extends HttpServlet {
//	public dispUser() {
//	    super();
//	    // TODO Auto-generated constructor stub
//	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("Request received by the servlet. URL: " + request.getRequestURL());
	    doPost(request, response);
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("Retrieve users");
//		try {
//	
//			response.setContentType("text/html");
//		    PrintWriter out = response.getWriter();
//			
//			
//			//Get the database connection
//			ApplicationDB db = new ApplicationDB();	
//			Connection con = db.getConnection();
//	
//			//Create a SQL statement
//			Statement stmt = con.createStatement();
//			
//			//Make a select statement for the Sells table:
//			String find = "SELECT u_id, username FROM user";
//			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
//			PreparedStatement ps = con.prepareStatement(find);
//	
//			ResultSet rs = ps.executeQuery();
//			
//			
//			ArrayList al = null;
//			ArrayList userList = new ArrayList();
//			
//			while(rs.next()){
//				al = new ArrayList();
//				al.add(rs.getInt(1));
//				al.add(rs.getString(2));
//				userList.add(al);
//			}
//			out.println(userList);
//			
//			out.println("userList size: " + userList.size());
//			request.setAttribute("userList", userList);
//			
//			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewAcc.jsp");
//	        dispatcher.forward(request,response);
//			
//			
//			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
//			con.close();
//			
//		} catch (Exception ex) {
////			out.println(ex);
//			response.getWriter().println(ex);
//		}
	}
}