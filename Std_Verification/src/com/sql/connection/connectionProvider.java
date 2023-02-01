package com.sql.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public final class connectionProvider {

static Connection connection = null;
	
	private connectionProvider()
	{
		
	}
	
	public static Connection getConnection()
	{
		if(connection==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","");
				System.out.println("Connneeeected");
				return connection;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				
			}
		}
		else
		{
			return connection;
		}
		return connection;
	}
}
