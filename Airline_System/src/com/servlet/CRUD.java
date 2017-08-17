
package com.servlet;
//import com.login.DbConnection;
import com.mysql.jdbc.Connection;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;

import com.servlet.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CRUD
 */


public class CRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int p_id =3;
	 /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String username;
		String arr_date1="";
		String arr_date2="";
		username  = request.getParameter("firstname").toString();
		//String s = request.getParameter("ddate");
		//HttpSession session = new HttpSession();
		
		
		LocalDate arr_date11 = null;
		LocalDate arr_date12 = null;
		p_id++;
		LocalDate pdate = null;
		LocalDate pdate1 = null;
		PrintWriter out = response.getWriter();
		out.print("inside servlet");
		username  = request.getParameter("firstname").toString();
		out.print("Servlet received user:"+username);
		String bookings_no = request.getParameter("bookings").toString();
		String trip_type = request.getParameter("trip_type").toString();
		String dep_date1 = request.getParameter("ddate");
		out.print("Servlet received bookings:"+bookings_no);
		out.print("Servlet received trip type:"+trip_type);
		out.print("Servlet received dep date 1:"+dep_date1);
		String dep_date2 = request.getParameter("adate");
		String arr_date = request.getParameter("adate");
		out.print("Servlet received dep date 2:"+dep_date2);
		if(trip_type.equals("return"))
		{
			out.println("inside validation");
			 
			 pdate = LocalDate.parse(dep_date1);
			 arr_date11 = pdate.plusDays(1);
			 arr_date1 = arr_date11.toString();
			//out.println("new date is" + arr_date1);
			 pdate1 = LocalDate.parse(dep_date2);
			 arr_date12 = pdate1.plusDays(1);
			arr_date2 = arr_date12.toString();
			
		}
		
		String source1 = request.getParameter("airportName").toString();
		String dest1 = request.getParameter("destairportName").toString();
		String class1 = request.getParameter("class").toString();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("Driver found");
		java.sql.Connection con = null;
		try {
			Boolean autocommit = false;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
			System.out.println("connection established");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//String ink = "insert into passenger_details values('"+p_id+"','"+username+"','"+bookings_no+"','"+dep_date1+"','"+arr_date1+",'"+arr_date2+"','"+source1+"','"+dest1+"','"+trip_type+"','"+class1+"')";
		//String ink = "insert into test values('"+username+"',"+dep_date1+")";
		//System.out.println("Formed query is:"+ ink);
		try {
			//Statement smt = con.createStatement();
			PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO passenger_details (p_id,p_name,no_of_bookings,dep_date1,arr_date1,dep_date2,arr_date2,source1,dest1,class,trip_type)" +
					" values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"+";");
			//pstmt.setString(1, p_id);
			pstmt.setInt(1, p_id);
			pstmt.setString(2, username);
			//java.sql.Date sqlDate = new java.sql.Date(dep_date1.getDate()); // Notice the ".sql." (not "util") in package name.
			pstmt.setString( 3, bookings_no);
			pstmt.setString(4, dep_date1);
			pstmt.setString(5, arr_date1);
			pstmt.setString(6, dep_date2);
			pstmt.setString(7, arr_date2);
			pstmt.setString(8, source1);
			pstmt.setString(9, dest1);
			pstmt.setString(10, class1);
			pstmt.setString(11, trip_type);
			System.out.println("Query is:"+pstmt);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession(); 
	     session.setAttribute("passenger",request.getParameter("bookings"));
	     session.setAttribute("passenger_id",p_id);
	     session.setAttribute("passenger_name",username);
	   //  session.setAttribute("passenger_name",username);
	     session.setAttribute("no_of_bookings",bookings_no);
	     session.setAttribute("trip_type",trip_type);
	     session.setAttribute("dep_date1",dep_date1);
	     session.setAttribute("arr_date1",arr_date1);
	     session.setAttribute("dep_date2",arr_date1);
	     session.setAttribute("arr_date2",arr_date2);
	     session.setAttribute("route_id",24);
	     //session.setAttribute("bookings_no", bookings_no);
	     //session.setAttribute("price",80);
		RequestDispatcher rd=request.getRequestDispatcher("second.jsp");  
        rd.forward(request,response);
		
	}

	
}
