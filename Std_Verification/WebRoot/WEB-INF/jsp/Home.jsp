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
  #search {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
  	font-size: 15px;
}

#watermark{
  position: absolute;
  z-index: 1;  
  height:100%;
  width:100%;
  opacity: 0.18;
  color:lightgrey;
  text-align:center;
}

.row{
padding: 10px;
padding-bottom: 10px;
}

#text_middle{
text-align: center;

}

#reg_middle{
text-align: right;

}

#Std_img{
text-align:center;
}

#registration_Number{
text-align:center;
font-weight: bold;
border-style: double;
border-radius: 5px;
border-width: 3px;
}
#session{
text-align:center;
font-weight: bold;
border-style: double;
border-radius: 5px;
border-width: 3px;
}

  </style>
  
  <%@ taglib prefix="s" uri="/struts-tags" %>
  
  <script>
$( document ).ready(function() {
    console.log( "ready!" );
    //$("#myTable").DataTable();
    $('#courseValue').change(function(){
    	
    	var courseValue = $("#courseValue").val();
    	
    	$('#sessValue').find('option').remove();
    	$('#sessValue').append('<option>Select Session</option>');
    	//console.log( courseValue );
    	$.ajax({
			type : "GET",
			url : "selectSession.action",
			//data : "firstName=" + firstName + "&lastName=" + lastName + "&email=" + email	+ "&pass=" + pass + "&confPass=" + confPass,
			data : {courseValue:courseValue},
			datatype: "text",
			success: function(data) {
					//var ht = data.msg;
					//$("#resp").html(ht);
					//console.log(data.std_image);
				 // var d = eval(data);
				  //alert(d.msg);
	  			  //var tblData="";
				  $.each(data.sessionList, function() {	
				  			console.log(this.s_sess);
				  		$('#sessValue').append('<option value="' + this.s_sess +'">' + this.s_sess + '</option>');
				  
				});
				//$("#tbody").html(tblData);
			},
			error : function(data) {
			console.log(courseValue);
				alert("User Searching Failed. Please Try Again.");
			}
		});
    	
    	
    	
    	
    });
    
}); 

function downloadCSVFile(csv_data) {
 		var courseName = $("#courseValue").val();
		var sessVal = $("#sessValue").val();
            // Create CSV file object and feed
            // our csv_data into it
            CSVFile = new Blob([csv_data], {
                type: "text/csv"
            });
 
            // Create to temporary link to initiate
            // download process
            var temp_link = document.createElement('a');
 			let date = new Date().toJSON().slice(0, 10);
 			let time = new Date().toJSON().slice(11, 23);
            // Download csv file
            temp_link.download = courseName+ "_"+ sessVal + "_" +date+"_"+ time +".csv";
            var url = window.URL.createObjectURL(CSVFile);
            temp_link.href = url;
 
            // This link should not be displayed
            temp_link.style.display = "none";
            document.body.appendChild(temp_link);
 
            // Automatically click the link to
            // trigger download
            temp_link.click();
            document.body.removeChild(temp_link);
        }

 
function Search() {
		//var regNo = $("#regNo").val();
		var courseValue = $("#courseValue").val();
		var sessValue = $("#sessValue").val();
		
		$.ajax({
			type : "GET",
			url : "searchAct.action",
			//data : "firstName=" + firstName + "&lastName=" + lastName + "&email=" + email	+ "&pass=" + pass + "&confPass=" + confPass,
			data : {courseValue:courseValue, sessValue:sessValue},
			datatype: "text",
			success: function(data) {
					//var ht = data.msg;
					//$("#resp").html(ht);
					//console.log(data.std_image);
				 // var d = eval(data);
				  //alert(d.msg);
				  
				table =  $("#myTable").DataTable({
				       	bDestroy: true, 
				        data: data.list,
				        columns: [
				            { data: "regNo" },
				            { data: "studentName" },
				            { data: "fatherName" },
				            { data: "motherName" },
				            { data: "sub" },
				            { data: "s_sess" },
				            { data: "stdEmail" },
				        ],
				    });
				   // table.destroy();
				    
				    //$("#myTable").destroy();
	  			/*  var tblData="";
				  $.each(data.list, function() {	
				  console.log(this.regNo);
				  
					  tblData += "<tr><td>" + this.regNo + "</td>" + 
						"<td>" + this.studentName + "</td>" + 
						"<td>" + this.fatherName + "</td>" + 
						"<td>" + this.motherName + "</td>" +
						"<td>" + this.sub + "</td>" +
						//"<td>" + this.Session + "</td>" +
						"<td>" + this.s_sess + "</td>" +
						"<td>" + this.stdEmail + "</td></tr>";
					});
				$("#tbody").html(tblData);*/
				//$("#myTable").DataTable(tblData);
				
				  // Variable to store the final csv data
            var csv_data = [];
 
            // Get each row data
            var rows = document.getElementsByTagName("tr");
            for (var i = 0; i < rows.length; i++) {
 
                // Get each column data
                var cols = rows[i].querySelectorAll("td,th");
 
                // Stores each csv row data
                var csvrow = [];
                for (var j = 0; j < cols.length; j++) {
 
                    // Get the text data of each cell
                    // of a row and push it to csvrow
                    csvrow.push(cols[j].innerHTML);
                }
 
                // Combine each column value with comma
                csv_data.push(csvrow.join(","));
            }
 
            // Combine each row data with new line character
            csv_data = csv_data.join("\n");
 
            // Call this function to download csv file 
				 
				//alert("Data Successfully Downloaded. Please check the Desktop Screen.");
				if(data.list.length === 0){
				//document.getElementById("successMessage").innerHTML = "New Data Not Found";
					document.getElementById("successMessage").innerHTML = "<span style='color: red;'>Already Downloaded. To See Archive </span><br>";
					let a = document.createElement("a");
					a.innerHTML = "Click Here";

					a.href="searchArc";
					document.getElementById("successMessage").appendChild(a);
				}
				else{
				document.getElementById("successMessage").innerHTML ="<span style='color: green;'>Data Successfully Downloaded. Please check the Download Folder.</span>";
				downloadCSVFile(csv_data);
				}
				//$("#search_message").text("Data Successfully Downloaded. Please check the Desktop Screen.");
  			//$("#search_message").html("Data Successfully Downloaded. Please check the Desktop Screen.");
  		
	
			},
			error : function(data) {
			console.log(courseValue);
				alert("User Searching Failed. Please Try Again.");
			}
		});
	}
 
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
    <!--  <form action="logout" method="post">
      <span class="navbar-button">  -->

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
                            <a href="ChangePassword.jsp" class="dropdown-item">Change Password</a>
                            <div class="dropdown-divider"></div>
                            <a href="logout" class="dropdown-item">Logout</a>
                        </div>
                    </li>
                </ul>
		  
   <!--   </span>
      </form> -->
    </div>
  </div>
</nav>
</div>
  
  <div class="container" id="search">

    <form action="search" method="post">
    
		<h2>Student Data Searching</h2>
		<p class="hint-text">Please, Search With Course and Session.</p>
        <!--  
        <div class="form-group">
        	<input type="number" class="form-control" name="regNumber" id="regNo" placeholder="Registration Number" required="required">
        </div>	
        -->
        <select class="form-select" id="courseValue" aria-label="Default select example" >
		  <option  selected >Select Course</option>
		  <option  value="hons">Honours</option>
		  <option value="hprof" >Honours Professional</option>
		  <option value="degree" >Degree</option>
		</select>
		<br>
		<select class="form-select" id="sessValue" aria-label="Default select example" >
		  <option  selected>Select Session</option>
		</select>
        
        <br>
        <h6 style="color:RED; text-align: center;">
  			<s:property value="search_message"/>	
  		</h6>
        
        <div class="form-group">
		<div class="d-grid gap-2 col-6 mx-auto">
            <button  type="button" class="btn btn-success btn-lg btn-block" data-bs-toggle="modal" data-bs-target="#SearchModalForm" onclick="Search()">Search & Download</button>
        </div>
        </div>
        <br>
          <h5 id="successMessage" align="center"> </h5>
    </form>
    
</div>

  <div class="container">
		<table id="myTable" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
		   <thead>
		    <tr>
		      <th scope="col">REG_NO</th>
		      <th scope="col">STUDENT_NAME</th>
		      <th scope="col">FATHER_NAME</th>
		       <th scope="col">MOTHER_NAME</th>
		       <th scope="col">SUBJECT</th>
		     <!-- <th scope="col">STATUS</th> -->
		     <th scope="col">STD_SESSION</th>
		       <th scope="col">EMAIL</th>
		    </tr>
		  </thead> 
		<!--  <tbody id="tbody">
			
		  </tbody> -->
		</table>
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
    
<!-- Modal Form -->
<div class="modal fade" id="ModalForm" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
        <!-- Login Form -->
        <form action="login" method="post">
          <div class="modal-header">
            <h5 class="modal-title">Log In Form</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
                <label for="Email">Email<span class="text-danger">*</span></label>
                <input type="text" name="email" class="form-control" id="Email" placeholder="Enter Email">
            </div>

            <div class="mb-3">
                <label for="Password">Password<span class="text-danger">*</span></label>
                <input type="password" name="password" class="form-control" id="Password" placeholder="Enter Password">
            </div>
            <div class="mb-3">
                <input class="form-check-input" type="checkbox" value="" id="remember" required>
                <label class="form-check-label" for="remember">Remember Me</label>
                <a href="#" class="float-end">Forgot Password</a>
            </div>
          </div>
          <div class="modal-footer pt-4">                  
            <button type="submit" class="btn btn-success mx-auto w-100">Login</button>
          </div>
          <p class="text-center">Not yet account, <a href="Register.jsp">Signup</a></p> 
      </form>
    </div>
  </div>
</div>



<!-- Modal Form For Search -->



  </body>
</html>