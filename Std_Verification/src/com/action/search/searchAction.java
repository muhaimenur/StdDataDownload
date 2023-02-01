package com.action.search;


import com.opensymphony.xwork2.ActionSupport;


public class searchAction extends ActionSupport{

	private static final long serialVersionUID = -3827439829486925185L;
	private String courseValue, msg, regNo, studentName, fatherName, motherName, sub, Session, stdEmail, s_sess;
	public String getS_sess() {
		return s_sess;
	}
	public void setS_sess(String s_sess) {
		this.s_sess = s_sess;
	}
	public String getSession() {
		return Session;
	}
	public void setSession(String session) {
		Session = session;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getStdEmail() {
		return stdEmail;
	}
	public void setStdEmail(String stdEmail) {
		this.stdEmail = stdEmail;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCourseValue() {
		return courseValue;
	}
	public void setCourseValue(String courseValue) {
		this.courseValue = courseValue;
	}
	
	
	
	
	
/*public String searchMethod() throws Exception {
	
		
		searchService searService = new searchService();
		msg = searService.chkCourse(regNo);
		System.out.println("Admission Roll = "+getAdmission_roll());
		System.out.println("MSG = "+msg);
		//request.setAttribute("message",msg);
		return "SUCCESS";
	}*/
	
}
