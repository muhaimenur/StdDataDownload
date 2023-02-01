<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>NU STUDENT VARIFICATION</title>
    
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
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #007500;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  top: 30px;
  font-size: 18px;
}

#snackbarFailed {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #FF0000;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  top: 30px;
  font-size: 18px;
}

#snackbarFailed.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {top: 0; opacity: 0;} 
  to {top: 30px; opacity: 1;}
}

@keyframes fadein {
  from {top: 0; opacity: 0;}
  to {top: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {top: 30px; opacity: 1;} 
  to {top: 0; opacity: 0;}
}

@keyframes fadeout {
  from {top: 30px; opacity: 1;}
  to {top: 0; opacity: 0;}
}  
  
  
  
.form-control {
	height: 40px;
	box-shadow: none;
	color: #969fa4;
}
.form-control:focus {
	border-color: #5cb85c;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
  	font-size: 15px;
}
.signup-form h2 {
	color: #636363;
	margin: 0 0 15px;
	position: relative;
	text-align: center;
}
.signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 15%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
}	
.signup-form h2:before {
	left: 0;
}
.signup-form h2:after {
	right: 0;
}
.signup-form .hint-text {
	color: #999;
	margin-bottom: 30px;
	text-align: center;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group {
	margin-bottom: 20px;
}
.signup-form input[type="checkbox"] {
	margin-top: 3px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;		
	min-width: 140px;
	outline: none !important;
}
.signup-form .row div:first-child {
	padding-right: 10px;
}
.signup-form .row div:last-child {
	padding-left: 10px;
}    	
.signup-form a {
	color: #fff;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cb85c;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}  


</style>

<script type="text/javascript">

function UpdatePassword() {
		var email = $("#email").val();
		var newPass = $("#newPass").val();
		var confPass = $("#confPass").val();
		
		$.ajax({
			type : "POST",
			url : "passChangeAct.action",
			//data : "firstName=" + firstName + "&lastName=" + lastName + "&email=" + email	+ "&pass=" + pass + "&confPass=" + confPass,
			data : {email:email, newPass:newPass, confPass:confPass},
			datatype: "text",
			async: false,
			success: function(data) {
					var ht = data.msg;
					if(ht == "Update Successful"){
						$("#snackbar").html(ht);
						var x = document.getElementById("snackbar");
  						x.className = "show";
  						setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);		
					}
					else
					{
						$("#snackbarFailed").html(ht);
						var x = document.getElementById("snackbarFailed");
  						x.className = "show";
  						setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
					}
			},
			error : function(data) {
				alert("User Update Failed. Please Try Again.");
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
          <a class="nav-link" href="#">Title_1</a>
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
    
    
    
<!-- Modal Form -->
        <!-- Login Form -->
       <div class="signup-form">
    <form>
   <h6 style="color:Green; text-align: center;">
  </h6>
    
		<h2>Password Change</h2>
		<p class="hint-text">Change Your Password.</p>
      
        <div class="form-group">
        	<input type="email" class="form-control" name="email" id="email" placeholder="Email" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="newPass" id="newPass" placeholder="New Password" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="confPass" id="confPass" placeholder="Confirm Password" required="required">
        </div>        
		<div class="form-group">
			<div class="d-grid gap-2 col-6 mx-auto">
            <button onclick="UpdatePassword();" type="button"  class="btn btn-success btn-lg btn-block">Submit</button>
            </div>
        </div>
        
      
        
      <!-- <div class="text-center" id="resp" style="margin-top: 14px; color:Green; font-size:25px"></div> -->
    		<div id="snackbar"></div>
    		<div id="snackbarFailed"></div>
    	</div>
    </form>
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


