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
int fare = Integer.parseInt(request.getParameter("price"));
int numbookings = Integer.parseInt(session.getAttribute("no_of_bookings").toString());
int totalfare = res + (fare*numbookings);
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
<form class="formholder" action="fourth.jsp" method = "post">
<%@ page import = "java.io.*" %>
<%@ page import = "javax.sql.*" %>
<ul>
	  <li><a href="home.html">Home</a></li>
	  <li><a  href="flight_bookings.html">Book Flights</a></li>
	  <li><a class="active" href="review.html">Flight Details</a></li>
	  <li><a href="#contact">Contact</a></li>
	  <li><a href="#about">About</a></li>
	</ul>

	<h2>Your Flight Details</h2>
	 <div class="w3-container">
	  
	  <table class="w3-table-all w3-card-4" style="width:100%">
	    <tr>
	      <th colspan="3">Passenger</th>
	      <th colspan="3">Fare</th>
	      <th colspan="3">Departure</th>
	      <th colspan="4">Tax,Fees and Carrier charges</th>
	      <th colspan="5">Total Price</th>
		 </tr>
		   <tr>
		   	<td colspan="3"><%out.println(session.getAttribute("no_of_bookings"));%>
		  	<td colspan="3"><%out.println(request.getParameter("price"));%>
		    <td colspan="3"><%out.println(session.getAttribute("dep_date1"));%>
		    <td colspan="4"><%out.println(20);%>
		    <td colspan="5"><%out.println(totalfare);%>
		    
		  </tr> 
	 </table>  
	</div>
	<br><br>
		<input type="submit" name="bookticket" value="Confirm" >
		<button type="button" name="back" onclick="history.back()">Back</button>
		
		
		 
</form>
</body>

</html>