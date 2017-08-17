/*package com.login;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	static Connection con;
	public static Connection generateConnection()
	{
		System.out.println("inside generate conn function");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver found");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","Skkavya13#");
		}
		catch(Exception E)
		{
			System.out.println("Driver failed to load");
		}
		return con;

	}
}
*/