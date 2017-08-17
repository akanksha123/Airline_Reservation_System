<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%-- <%@ page import = "com.login.DbConnection" %> --%>
We are on checking page
<% 
out.println("Heyyyyyyyyyy");
System.out.println("");
String user_id = request.getParameter("firstname");
String ink = "insert into test values(firstname)";


%>
<%= request.getParameter("email")%>
</body>
</html>