package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;  

import com.action.search.searchAction;
import com.sql.connection.connectionProvider;

public class searchDAO {
	
	
	public ResultSet sessData(String CourseId) throws SQLException, Exception
	{
		Connection c= connectionProvider.getConnection();
		ResultSet rs = null;
		try
		{	
			if(CourseId.equals("hons"))
			{
				//PreparedStatement ps = c.prepareStatement("SELECT DISTINCT sess FROM hons");
				PreparedStatement ps = c.prepareStatement("SELECT DISTINCT sess FROM registration.hons ORDER BY convert(sess, integer) DESC LIMIT 5");
				rs = ps.executeQuery();
			}
			return rs;
		}
			catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		//return null;
	}
	
	
	public ResultSet archiveData() throws SQLException, Exception
	{
		Connection c= connectionProvider.getConnection();
		ResultSet rs = null;
		try
		{	
			
				//PreparedStatement ps = c.prepareStatement("SELECT DISTINCT sess FROM hons");
				PreparedStatement ps = c.prepareStatement("SELECT DISTINCT File_Name FROM email_delivary.delivered_data");
				rs = ps.executeQuery();
			
			return rs;
		}
			catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		//return null;
	}
	
	
	public String InsertData(String CourseId , String sessValue, String file_name) throws SQLException, Exception
	{
		Connection c= connectionProvider.getConnection();
		try
		{	
			/*PreparedStatement ps = c.prepareStatement("INSERT INTO email_data (Reg_No,Student_Name,Father_Name,Mother_Name,Subject,Status,S_Sess,Email)"+
            "SELECT hons.reg_no,hons.applicant_name,hons.father_name,hons.mother_name,hons.sub_name,'',hons.sess,concat('s', hons.reg_no ,'@nu.ac.bd') FROM hons where hons.sess=? AND NOT EXISTS(SELECT Reg_No FROM email_data WHERE email_data.Reg_No = hons.reg_no)");
			*/
			PreparedStatement ps = c.prepareStatement("INSERT INTO email_delivary.delivered_data (Reg_No,Student_Name,Father_Name,Mother_Name,Subject,Status,S_Sess,Email, File_Name)"+
		            "SELECT hons.reg_no,hons.applicant_name,hons.father_name,hons.mother_name,hons.sub_name,'',hons.sess,concat('s', hons.reg_no ,'@nu.ac.bd'),? FROM registration.hons where hons.sess=? AND NOT EXISTS(SELECT Reg_No FROM email_delivary.delivered_data WHERE delivered_data.Reg_No = hons.reg_no)");
			ps.setString(1, file_name);
			ps.setString(2, sessValue);
			ps.executeUpdate();
			
			return "SUCCESS";
		}
			catch (Exception e) {
				e.printStackTrace();
				return e.getMessage();
			}
		
	}
	
	
	public ResultSet report(String CourseId, String sessValue) throws SQLException, Exception {
		Connection c= connectionProvider.getConnection();
		ResultSet rs = null;
		try {
			
			if(CourseId.equals("hons"))
			{
				//System.out.println(CourseId);
				PreparedStatement ps = c.prepareStatement("SELECT * FROM email_delivary.delivered_data where S_Sess=? AND Status !='Downloaded' ");
				ps.setString(1, sessValue);
				//ps.setString(2, regNo);
				rs = ps.executeQuery();
				
				PreparedStatement ps2 = c.prepareStatement("Update email_delivary.delivered_data set Status ='Downloaded' where Status !='Downloaded' ");
				ps2.executeUpdate();
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

}
