package com.service;
import java.io.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*;  

import com.opensymphony.xwork2.ActionSupport;
public class archiveDownload extends ActionSupport {

	private InputStream inputStream;
    private String fileName;
 

	private long contentLength;

    

	public String execute() throws FileNotFoundException {
        
		 System.out.println(fileName);
		
		//String serverPath = "C:/Users/Md. Muhaimenur/Desktop/Email Data File/"+fileName;
		String serverPath= System.getProperty("user.home")+ "\\" + "Desktop"+"\\"+"Email Data File\\"+fileName;
		//String file = request.getParameter("fileName");
		File fileToDownload = new File(serverPath);
      
 
        inputStream = new FileInputStream(fileToDownload);
        fileName = fileToDownload.getName();
        contentLength = fileToDownload.length();
       
         
        return SUCCESS;
    }
     
    public long getContentLength() {
        return contentLength;
    }
    public String getFileName() {
 		return fileName;
 	}

 	public void setFileName(String fileName) {
 		this.fileName = fileName;
 	}
 
    public InputStream getInputStream() {
        return inputStream;
    }  
}
