<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>NU STUDENT DATABASE</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
	
  <style>

.center {
  margin-left: auto;
  margin-right: auto;
}

table, td, th {border: 1px solid black; text-align: center; }
table {border-collapse: collapse;width: 60%;}
th {height: 30px;}

.button-update {background-color: #008CBA;color: white;}

  </style>
  
  <%@ taglib prefix="s" uri="/struts-tags" %>
  
  <script>
$(document).ready(function() {
    $('#downloadTable').DataTable( {
        
    });
});
  </script>

  
  </head>
  
  <body>
    <div class="container">
  		<img src="images/NU.png" class="img-fluid" alt="NU Banner">
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="Home.jsp">Student Data Download</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Title_1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Title_2</a>
        </li>
      </ul>
      <ul class="nav navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link data-toggle" data-bs-toggle="dropdown">
                        	<h6 style="color:GREEN;">
                        		<!-- <s:property value="name"/> -->
                        		More Feature
                        	</h6>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <a href="#" class="dropdown-item">Profile</a>
                            <a href="Register.jsp" class="dropdown-item">Register</a>
                            <a href="#" class="dropdown-item">Change Password</a>
                            <div class="dropdown-divider"></div>
                            <a href="logout" class="dropdown-item">Logout</a>
                        </div>
                    </li>
                </ul>
    </div>
  </div>
</nav>
</div>
	
<div class="container">	
	<div style="margin-top: 20px;">
			<table class="center" id="downloadTable">
				<thead>
					<tr style="background-color: #E0E0E1;">
						<th>File Name</th>
						<th>Download Link</th>
						
					</tr>
				</thead>
				<s:iterator value="archiveData">
					<tr>
						<td><s:property value="fileName" /></td>
						<td>
						<a href="download?fileName=<s:property value="fileName"/>">
								<button class="button-update">Download</button>
							</a>
						<!-- 	<a href="archiveDownload?fileName=<s:property value="fileName"/>">
								<button class="button-update">Download</button>
							</a>
						 -->
						</td>
					</tr>
				</s:iterator>
			</table>

	</div>

</div>




 
<div class="container">
<section class="">
  <!-- Footer -->
  <footer class="text-center text-white" style="background-color: #0a4275;">
  
    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      © National University, Bangladesh<br>
      Admission & Registration Cell
      <a class="text-white" href=""></a>
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->
</section>	
</div>	


  </body>
</html>