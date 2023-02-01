package com.service;


import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dao.searchDAO;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.action.search.searchAction;

public class searchService {
	
	private String msgDAO, courseValue, sessValue;

	public String getSessValue() {
		return sessValue;
	}
	public void setSessValue(String sessValue) {
		this.sessValue = sessValue;
	}
	public String getCourseValue() {
		return courseValue;
	}
	public void setCourseValue(String courseValue) {
		this.courseValue = courseValue;
	}

	List<searchAction> list = null; 
	List<searchAction> sessionList = null; 
	
	
	public List<searchAction> getSessionList() {
		return sessionList;
	}
	public void setSessionList(List<searchAction> sessionList) {
		this.sessionList = sessionList;
	}
	public String getMsgDAO() {
		return msgDAO;
	}
	public void setMsgDAO(String msgDAO) {
		this.msgDAO = msgDAO;
	}
	
	
	searchAction sh= null;
	searchDAO searchdao = new searchDAO();
	ResultSet rs = null;
	
	public String selectSess() throws Exception
	{
		//String CourseId  = courseValue;
		searchDAO search = new searchDAO();
		//msgDAO= search.sessData(courseValue);
		sessionList = new ArrayList<searchAction>();
		
		try {	

			rs = search.sessData(courseValue);
			if (rs != null) {
				while (rs.next())
				{
					sh = new searchAction();	
					sh.setS_sess(rs.getString("sess"));
					sessionList.add(sh);
					
				}
				
			}
		}
			catch (Exception e) {
				e.printStackTrace();
			}
		
	   return "SUCCESS";
	}
	
	
	

	public String chkCourse() throws Exception
	{
		
		String CourseId  = courseValue;
		//System.out.println(courseValue);
		
		searchDAO search = new searchDAO();
		DateFormat dateFormat = new SimpleDateFormat("hh_mm_ss");
        Date date = new Date();
		String time=dateFormat.format(date);
		String file_name= courseValue+"_"+sessValue+"_"+time+".csv";
		String path= System.getProperty("user.home")+ "\\" + "Desktop"+"\\"+"Email Data File\\"+file_name;
		msgDAO= search.InsertData(courseValue, sessValue, file_name);
		list = new ArrayList<searchAction>();
		
		rs = search.report(courseValue, sessValue);
		try {
			if (rs.next() == false) {
				System.out.println("Resultset Emptyyyy");
		      } else {
		    	/*    DateFormat dateFormat = new SimpleDateFormat("hh_mm_ss");
		            Date date = new Date();
		            String time=dateFormat.format(date);

					String path= System.getProperty("user.home")+ "\\" + "Desktop"+"\\"+"Email Data File\\"+courseValue+"_"+sessValue+"_"+time+".csv";
					System.out.println(path);*/
					PrintWriter pw = new PrintWriter(new File(path));
					StringBuilder sb = new StringBuilder();
					sb.append("Reg_No");
					sb.append(",");
					sb.append("Student_Name");
					sb.append(",");
					sb.append("Father_Name");
					sb.append(",");
					sb.append("Mother_Name");
					sb.append(",");
					sb.append("Subject");
					sb.append(",");
					sb.append("Session");
					sb.append(",");
					sb.append("Email");
					sb.append("\r\n");
		        do {
		        	sh = new searchAction();
					sh.setRegNo(rs.getString("Reg_No"));
					sh.setStudentName(rs.getString("Student_Name"));
					sh.setFatherName(rs.getString("Father_Name"));
					sh.setMotherName(rs.getString("Mother_Name"));
					sh.setSub(rs.getString("Subject"));
					//sh.setSession(rs.getString("Std_Session"));
					sh.setS_sess(rs.getString("S_Sess"));
					sh.setStdEmail(rs.getString("Email"));
					
					sb.append(rs.getString("Reg_No"));
					sb.append(",");
					sb.append(rs.getString("Student_Name"));
					sb.append(",");
					sb.append(rs.getString("Father_Name"));
					sb.append(",");
					sb.append(rs.getString("Mother_Name"));
					sb.append(",");
					sb.append(rs.getString("Subject"));
					sb.append(",");
					//sh.setSession(rs.getString("Std_Session"));
					sb.append(rs.getString("S_Sess"));
					sb.append(",");
					sb.append(rs.getString("Email"));
					sb.append("\r\n");
					
					list.add(sh);
		        } while (rs.next());
		        pw.write(sb.toString());
				pw.close();
				System.out.println("Finished");
		      }
			
		
		    System.out.println(sh.getSession());
			System.out.println(list.toString());
	
		}

	
			catch (Exception e) {
				e.printStackTrace();
			}
	 return "SUCCESS";
	}
	public List<searchAction> getList() {
		return list;
	}
	public void setList(List<searchAction> list) {
		this.list = list;
	}

	public String archive(){
		
		return "SUCCESS";
	}
	
}
