package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sql.connection.connectionProvider;

public class loginDAO {
	
	public ResultSet userLogin(String email, String pass) throws SQLException, Exception {
		Connection c= connectionProvider.getConnection();
		ResultSet rs = null;
		try {
			
				//System.out.println(CourseId);
				PreparedStatement ps = c.prepareStatement("SELECT fName, lName, Email, Password FROM users where Email=? AND Password =? ");
				ps.setString(1, email);
				ps.setString(2, pass);
				rs = ps.executeQuery();

				return rs;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

