package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sql.connection.connectionProvider;

public class registerDAO {
	public String registerUser(String firstName, String lastName,String email,String pass) throws SQLException, Exception
	{
		Connection c= connectionProvider.getConnection();
		try
		{	
			PreparedStatement ps = c.prepareStatement("INSERT INTO users (fName,lName,Email,Password) values(?,?,?,?)");
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, email);
			ps.setString(4, pass);
			ps.executeUpdate();
			return "Registration Successful";
		}
			catch (Exception e) {
				e.printStackTrace();
				return e.getMessage();
			}
		
	}
	
	public String UpdateUser(String email, String newPass) throws SQLException, Exception
	{
		Connection c= connectionProvider.getConnection();
		try
		{	
			PreparedStatement ps = c.prepareStatement("UPDATE users SET Password=? WHERE Email=?");
			ps.setString(1, newPass);
			ps.setString(2, email);
			ps.executeUpdate();
			return "Update Successful";
		}
			catch (Exception e) {
				e.printStackTrace();
				return e.getMessage();
			}
		
	}
}
