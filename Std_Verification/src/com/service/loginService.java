package com.service;

import java.io.File;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.action.login.CaptchaAction;
import com.action.login.loginAction;
import com.action.search.searchAction;
import com.dao.loginDAO;
import com.dao.searchDAO;
import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;

public class loginService extends ActionSupport implements SessionAware {

	// Generate Getters and Setters...
		private String email, password, captcha, msg, name;


		public String getName() {
			return name;
		}


		public void setName(String name) {
			this.name = name;
		}


		private static final long serialVersionUID = -3434561352924343132L;
		private SessionMap<String, Object> sessionMap;
		
		
		@Override
		public void setSession(Map<String, Object> map) {
			sessionMap = (SessionMap<String, Object>) map;
		}
		

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}


		public String getCaptcha() {
			return captcha;
		}

		public void setCaptcha(String captcha) {
			this.captcha = captcha;
		}

		public String getMsg() {
			return msg;
		}

		public void setMsg(String msg) {
			this.msg = msg;
		}


		ResultSet rs = null;
		loginAction sh= null;

		private String sessionCaptcha = (String) ServletActionContext.getRequest().getSession().getAttribute(CaptchaAction.CAPTCHA_KEY);
	
		
		public String chkLogin() throws Exception {
			//HttpSession session = ServletActionContext.getRequest().getSession(true);
			loginDAO loginObj = new loginDAO();
			rs = loginObj.userLogin(email, password);
			try {
				if (rs.next() == false) {
					msg = "Login Failed. Please, Try Again.";
					 //System.out.println(msg);
					//System.out.print("fallssss");
					return ERROR;
			      } else {
			        do {
			        	sh = new loginAction();
			        	sh.setFirstName(rs.getString("fName"));
						sh.setLastName(rs.getString("lName"));
						sh.setEmail(rs.getString("Email"));
						sh.setPass(rs.getString("Password"));
			        } while (rs.next());
			      /*  System.out.println(sh.getEmail());
			        System.out.println(sh.getPass());
			        System.out.println(sessionCaptcha.equals(captcha));*/
			        
				        if(email.equals(sh.getEmail()) && password.equals(sh.getPass()) && sessionCaptcha.equals(captcha))
				        {
				        	/*System.out.println(sh.getEmail());
					        System.out.println(sh.getPass());
					        System.out.println(sessionCaptcha.equals(captcha)); */
				        	sessionMap.put("email", email);
				        	name= "Welcome, " + sh.getFirstName();
				        	System.out.println(name);
				        	/*System.out.println(session);
				        	System.out.println(sessionMap);*/
				        	return SUCCESS;
				        }
				        else {
				        	msg = "Login Failed. Please, Try Again.";
							return ERROR;
						}
			     
			      }
				
			}
				catch (Exception e) {
					e.printStackTrace();
					return ERROR;
				}
		/*	if (sessionCaptcha.equals(captcha)) {
				if (userId.equals("admin") && pass.equals("admin")) {
					msg = "Hello, " + userId + " You have successfully logedin.";
					return SUCCESS;
				} else {
					msg = "Wrong user id or password";
					return ERROR;
				}
			} else {
				msg = "Captcha not matched.";
				return ERROR;
			}
			*/
			
		}
		
		public String logout() {
			
			sessionMap.remove("email");
			sessionMap.invalidate();
			
			return "LOGOUT";
		}

		
		
}
