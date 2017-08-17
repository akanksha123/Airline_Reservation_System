<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<%
int res = 20;
String s = session.getAttribute("price").toString();
int numbookings = Integer.parseInt(session.getAttribute("no_of_bookings").toString());
String dep_date = session.getAttribute("dep_date1").toString();
String booking_ref = session.getAttribute("bookingref").toString();
int totalfare = 0;
%>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 20px 26px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}

</style>
</head>
<body>
<form class="formholder" action="fifth.jsp" method = "post">
<%@ page import = "java.io.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.sql.*" %>
<%

	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
	Statement smt = con.createStatement();
	

	/* Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
	Statement smt = con.createStatement(); */
	
	//String ink = "Select * from route_details where source_airport='"+source1+"'"+"and dest_airport='"+dest1+"'"+";";
	String ink ="select * from special_event_details where event_date ='"+dep_date+"'"+";";
	// select * from route_details r,airline_details a where r.source_airport = 'IAD' and r.dest_airport = 'LHR'and r.airline_iata  = a.airline_iata;
	//String ink = "select r.dept_time,r.arr_time,r.class,r.price,a.airline_name from route_details r, airline_details a where a.airline_iata = r.airline_iata and class is not null" +";";
	//String sql_demo = "Select * from user where email="+user_id+" "+"and pwd="+password+"";
	System.out.println(ink);
	ResultSet rs = smt.executeQuery(ink);
	if(rs.next())
	{
		
		out.println("User has been given special discount of $20");
		int fare = Integer.parseInt(s);
		 totalfare = (res + (fare*numbookings)) - 20;
	}
	else
	{
		int fare = Integer.parseInt(s);
		totalfare = res + (fare*numbookings);
	}
	request.setAttribute("price",80);
	
	%>

<ul>
	  <li><a href="home.html">Home</a></li>
	  <li><a  href="flight_bookings.html">Book Flights</a></li>
	  <li><a  href="review.html">Flight Details</a></li>
	  <li><a class="active" href="#contact">Contact</a></li>
	  <li><a href="#about">About</a></li>
	</ul>

	<h2>Booking Receipt</h2>
	 <div class="w3-container">
	  
	  <table class="w3-table-all w3-card-4" style="width:100%">
	    <tr>
	      <th colspan="3">Total Price</th>
	      <td colspan="3"><%out.println(totalfare);%>
	     </tr>
	     <tr>
	      <th colspan="3">Passenger Name</th>
	      <th colspan="3">No. of Bookings</th>
	      <th colspan="3">Booking Reference No</th>
	      <th colspan="3">Depart</th>
	      <th colspan="4">Flight Operated By</th>
	      </tr>
		   <tr>
		   <td colspan="3"><%out.println(session.getAttribute("passenger_name"));%>
		   	<td colspan="3"><%out.println(session.getAttribute("no_of_bookings"));%>
		  	<td colspan="3"><%out.println(session.getAttribute("bookingref"));%>
		  	<%-- <td colspan="5"><%out.println(totalfare);%> --%>
		    <td colspan="3"><%out.println(session.getAttribute("dep_date1"));%>
		    <td colspan="3"><%out.println(session.getAttribute("airline_name"));%>
		   </tr> 
	 </table>  
	 <input type="submit" name="bookticket" value="Booking Cancellation" >
	</div>
	<br><br>
		
		
		
		 
</form>

</body>

</html>