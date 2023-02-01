package com.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.action.search.archiveAction;
import com.dao.searchDAO;

public class archiveService {
	List<archiveAction> archiveData = null;
	
	public List<archiveAction> getArchiveData() {
		return archiveData;
	}
	public void setArchiveData(List<archiveAction> archiveData) {
		this.archiveData = archiveData;
	}

	archiveAction sh= null;
	
	public String archive() throws Exception{
		searchDAO search = new searchDAO();
		System.out.println("Archive Called....");
		ResultSet rs = null;
		
		archiveData = new ArrayList<archiveAction>();
		/*try {
			rs1 = search.archiveData();
			if (rs1.next() == false) {
				System.out.println("Resultset Emptyyyy");
		      } else {
		        do {
		        	sh = new searchAction();
					sh.setFileName(rs1.getString("File_Name"));
					archiveData.add(sh);
		        } while (rs1.next());
		       
		      }*/
		try {	

			rs = search.archiveData();
			if (rs != null) {
				while (rs.next())
				{
					sh = new archiveAction();	
					sh.setFileName(rs.getString("File_Name"));
					archiveData.add(sh);
					
					
				}
				System.out.println(archiveData);
				
			}
		}
	
			catch (Exception e) {
				e.printStackTrace();
			}
		
		return "SUCCESS";
	}
	
}
