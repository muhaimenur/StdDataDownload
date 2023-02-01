package com.service;

import java.sql.SQLException;

import com.action.register.registerAction;
import com.dao.registerDAO;

public class registerService {
	
	private String msgDAO, firstName, lastName, email, pass,confPass ;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getConfPass() {
		return confPass;
	}

	public void setConfPass(String confPass) {
		this.confPass = confPass;
	}

	public String getMsgDAO() {
		return msgDAO;
	}

	public void setMsgDAO(String msgDAO) {
		this.msgDAO = msgDAO;
	}


	public String registerInsert() throws SQLException, Exception
	{
		
		
		if(pass.equals(confPass))
		{
			registerDAO regDAO = new registerDAO();
			msgDAO = regDAO.registerUser(firstName, lastName, email, pass);
			return msgDAO;
		}
		else
		{
			return "failed";
		}
		
	}
}
