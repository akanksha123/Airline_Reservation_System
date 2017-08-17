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
Booking has been cancelled.
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
Statement smt = con.createStatement();
String deletequery ="delete from booking_details where booking_id ='"+booking_ref+"'"+";";
System.out.println(deletequery);
Statement smt1 = con.createStatement();
int rs1 = smt.executeUpdate(deletequery);
%>
</body>
</html>