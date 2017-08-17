<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

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
<form class="formholder" action="FlightBook" method = "post">
<input type="hidden" name="price" value="80">
<input type="hidden" name="airline_name" value="American Airlines">
<input type="hidden" name="airline_id" value="24">
<ul>
	  <li><a href="home.html">Home</a></li>
	  <li><a class="active" href="flight_bookings.html">Book Flights</a></li>
	  <li><a href="review.html">Flight Details</a></li>
	  <li><a href="#contact">Contact</a></li>
	  <li><a href="#about">About</a></li>
	</ul>

	<h2>Your Flight Details</h2>
	<!--  <div class="w3-container">
	  
	  <table class="w3-table-all w3-card-4" style="width:100%">
	    <tr>
	      <th colspan="6">Source</th>
	      <th colspan="3">Destination</th>
	      <th colspan="3">Departure</th>
	      <th colspan="4">Arrival</th>
	      <th colspan="5">Airline Operator</th>
		  <th colspan="5">Travel Class</th> 
		  <th colspan="6">Price</th> 
		  <th colspan="6">Select Flight</th> </tr>
	    
	 </table>  

	</div> -->
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>

<%
String source1 = request.getParameter("airportName").toString();
String dest1 = request.getParameter("destairportName").toString();
String journey_type = request.getParameter("trip_type").toString();
String dep_date = request.getParameter("ddate").toString();
int chk_id = 0;
	//System.out.println("Radio button value"+ journey_type);
	//out.print("Radio button value"+ journey_type);
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
	Statement smt = con.createStatement();
	
try{
	/* Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
	Statement smt = con.createStatement(); */
	System.out.println(source1);
	System.out.println(dest1);
	if(journey_type.equalsIgnoreCase("one-way"))
	{
	//String ink = "Select * from route_details where source_airport='"+source1+"'"+"and dest_airport='"+dest1+"'"+";";
	String ink ="select * from route_details r,airline_details a where r.source_airport ='"+source1+"'"+"and dest_airport='"+dest1+"'"+"and r.airline_iata  = a.airline_iata order by r.price"+";";
	// select * from route_details r,airline_details a where r.source_airport = 'IAD' and r.dest_airport = 'LHR'and r.airline_iata  = a.airline_iata;
	//String ink = "select r.dept_time,r.arr_time,r.class,r.price,a.airline_name from route_details r, airline_details a where a.airline_iata = r.airline_iata and class is not null" +";";
	//String sql_demo = "Select * from user where email="+user_id+" "+"and pwd="+password+"";
	System.out.println(ink);
	ResultSet rs = smt.executeQuery(ink);

	while(rs.next()){
		%>
		<!--  <table style="width:100%"> -->
		<div class="w3-container">
		<table class="w3-table-all w3-card-4" style="width:100%">		
		  <tr>
	      <th colspan="3">Source</th>
	      <th colspan="3">Destination</th>
	      <th colspan="3">Departure</th>
	      <th colspan="3">Arrival</th>
	      <th colspan="3">Airline Operator</th>
		  <th colspan="3">Travel Class</th> 
		  <th colspan="3">Price</th> 
		  <th colspan="3">Select Flight</th> </tr>
		  <tr>
		   	<td colspan="3"><%out.println(rs.getString(3));%>
		  	<td colspan="3"><%out.println(rs.getString(4));%>
		    <td colspan="3"><%out.println(rs.getString(11));%>
		    <td colspan="3"><%out.println(rs.getString(12));%>
		    <td colspan="3"><%out.println(rs.getString(15));%>
		    <td colspan="3"><%out.println(rs.getString(13));%>
		    <td colspan="3"><%out.println(rs.getInt(9));%>
		    <input type="checkbox" name="book" value="bookticket">
		  </tr> 
	   	</table>
		</div> 
		<%
		request.setAttribute("price",80);
	}
	%>
	<%
}
	else if(journey_type.equalsIgnoreCase("return"))
	{
		
	//String ink = "Select * from route_details where source_airport='"+source1+"'"+"and dest_airport='"+dest1+"'"+";";
	String ink = "select * from route_details r,airline_details a where r.airline_iata = a.airline_iata and r.class is not null order by r.price"+";";
	// String ink = "select * from route_details r where  r.class is not null and r.dept_time like ('2016-12-03%') or r.dept_time like  '2016-12-15%' order by price";
	//String sql_demo = "Select * from user where email="+user_id+" "+"and pwd="+password+"";
	System.out.println(ink);
	ResultSet rs = smt.executeQuery(ink);

	while(rs.next()){
		%>
		 <!-- <table style="width:100%"> -->
		 <div class="w3-container">
		<table class="w3-table-all w3-card-4" style="width:100%">
		  <tr>
	      <th colspan="3">Source</th>
	      <th colspan="3">Destination</th>
	      <th colspan="3">Departure</th>
	      <th colspan="3">Arrival</th>
	      <th colspan="3">Airline Operator</th>
		  <th colspan="3">Travel Class</th> 
		  <th colspan="3">Price</th> 
		  <th colspan="3">Select Flight</th> </tr>
	  
		  <tr>
		  	<td colspan="3"><%out.println(rs.getString(3));%>
		  	<td colspan="3"><%out.println(rs.getString(4));%>
		    <td colspan="3"><%out.println(rs.getString(11));%>
		    <td colspan="3"><%out.println(rs.getString(12));%>
		    <td colspan="3"><%out.println(rs.getString(15));%>
		    <td colspan="3"><%out.println(rs.getString(13));%>
		    <td colspan="3"><%out.println(rs.getInt(9));%>
		    <input type="checkbox" name="book" value="<%chk_id++;%>">
		  </tr> 
		</table>
		</div> 
		<%
	}
		
	%>
	<%
}
	 %>
	 <br><br>
	 <input type="submit" name="bookticket" value="Continue" >
	 <button type="button" name="back" onclick="history.back()">Back</button>
	 <%	
	
}finally{}
%>

</form>
</body>
</html>