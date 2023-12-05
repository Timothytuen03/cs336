package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.cs336.pkg.ApplicationDB;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

/**
 * Servlet implementation class dispUsers
 */
@WebServlet("/getUsers")
public class getUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public getUsers() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		response.getWriter().println("Retrieve users");
		try {
	
			response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a select statement for the Sells table:
			String find = "SELECT u_id, username FROM user";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(find);
	
			ResultSet rs = ps.executeQuery();
			
			
			ArrayList al = null;
			ArrayList userList = new ArrayList();
			
			while(rs.next()){
				al = new ArrayList();
				al.add(rs.getInt(1));
				al.add(rs.getString(2));
				userList.add(al);
			}
			out.println(userList);
			
			out.println("userList size: " + userList.size());
			request.setAttribute("userList", userList);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewAcc.jsp");
	        dispatcher.forward(request,response);
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
//			out.println(ex);
			response.getWriter().println(ex);
		}
	}

}
