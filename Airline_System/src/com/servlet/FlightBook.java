package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import java.sql.*;

/**
 * Servlet implementation class FlightBook
 */
@WebServlet("/FlightBook")
public class FlightBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		java.sql.Connection con1 = null;
		Random rand = new Random();
		int  bookingref = rand.nextInt(5000) + 1;
		HttpSession session =  request.getSession();
		session.setAttribute("bookingref",bookingref);
	String price = request.getParameter("price");
	String airline_id = request.getParameter("airline_id");
	String airline_name = request.getParameter("airline_name");
		System.out.println("selected price is:"+ price);
		 //String bookings = session.getAttribute("no_of_bookings").toString();
	     String p_id = session.getAttribute("passenger_id").toString();
	     String username = session.getAttribute("passenger_name").toString();
	     //session.setAttribute("passenger_name",username);
	     String bookings_no = session.getAttribute("no_of_bookings").toString();
	     String trip_type=session.getAttribute("trip_type").toString();
	     String dep_date1 = session.getAttribute("dep_date1").toString();
	     String arr_date1 =session.getAttribute("arr_date1").toString();
	     String dep_date2 = session.getAttribute("dep_date2").toString();
	     String arr_date2 = session.getAttribute("arr_date2").toString();
	     String route_id = session.getAttribute("route_id").toString();
		
		//java.sql.Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
			System.out.println("Connection established");
			/*Statement smt = con.createStatement();
			String ink = "select * from route_details r,airline_details a where r.airline_iata = a.airline_iata and r.class is not null and r.price ='"+price+"'"+";";
			
			System.out.println("Formed query is:"+ ink);
			System.out.println("Before rs execute");
			ResultSet rs = smt.executeQuery(ink);*/
			//while(rs.next()){
			System.out.println("after rs execute");
			/*int airline_id = rs.getInt(2);
			System.out.println("airline id is"+ airline_id);*/
			if(trip_type.equalsIgnoreCase("one-way")){
			PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO booking_details (booking_id,p_id,p_name,airline_id,airline_name,departure_date1,arrival_date1,departure_date2,arrival_date2,no_of_bookings,trip_type,route_id,price)" +
					" values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)"+";");
			pstmt.setInt(1, bookingref);
			pstmt.setString(2, p_id);
			pstmt.setString(3, username);
			//java.sql.Date sqlDate = new java.sql.Date(dep_date1.getDate()); // Notice the ".sql." (not "util") in package name.
			pstmt.setString(4,airline_id);
			
			pstmt.setString(5, airline_name);
			pstmt.setString(6, dep_date1);
			//pstmt.setString(7, arr_date1);
			pstmt.setString(7, null);
			//pstmt.setString(8, dep_date2);
			pstmt.setString(8, null);
			//pstmt.setString(9, arr_date2);
			pstmt.setString(9, null);
			pstmt.setString(10,bookings_no );
			pstmt.setString(11, trip_type);
			pstmt.setString(12,route_id);
			pstmt.setString(13,price);
			System.out.println("Query is:"+pstmt);
			pstmt.executeUpdate();}
			else{
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO booking_details (booking_id,p_id,p_name,airline_id,airline_name,departure_date1,arrival_date1,departure_date2,arrival_date2,no_of_bookings,trip_type,route_id,price)" +
						" values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)"+";");
				pstmt.setInt(1, bookingref);
				pstmt.setString(2, p_id);
				pstmt.setString(3, username);
				//java.sql.Date sqlDate = new java.sql.Date(dep_date1.getDate()); // Notice the ".sql." (not "util") in package name.
				pstmt.setString(4,airline_id);
				
				pstmt.setString(5, airline_name);
				pstmt.setString(6, dep_date1);
				pstmt.setString(7, arr_date1);
				
				pstmt.setString(8, dep_date2);
				
				pstmt.setString(9, arr_date2);
				
				pstmt.setString(10,bookings_no );
				pstmt.setString(11, trip_type);
				pstmt.setString(12,route_id);
				pstmt.setString(13,price);
				System.out.println("Query is:"+pstmt);
				pstmt.executeUpdate();
			}
			}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	finally{ }
		RequestDispatcher rd=request.getRequestDispatcher("third.jsp");  
        rd.forward(request,response);
        session.setAttribute("airline_name", airline_name);
        session.setAttribute("price", price);
        session.setAttribute("bookings_no", bookings_no);
	}		

}
