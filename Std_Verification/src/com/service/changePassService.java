package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.action.register.passChangeAction;
import com.dao.registerDAO;

public class changePassService {
	
	private String email, newPass, confPass, msg;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public String getConfPass() {
		return confPass;
	}

	public void setConfPass(String confPass) {
		this.confPass = confPass;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	ResultSet rs = null;
	public String execute() throws SQLException, Exception{
		
		if(newPass.equals(confPass))
		{
			registerDAO regDAO = new registerDAO();
			msg = regDAO.UpdateUser(email, newPass);
			return msg;
		}
		else
		{
			msg= "Update Failed";
			System.out.println(msg);
			return msg;
		}

	}

}
