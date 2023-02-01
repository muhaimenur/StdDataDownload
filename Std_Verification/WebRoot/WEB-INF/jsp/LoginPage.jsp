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
 
  
  
#login {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
  	font-size: 15px;
  	border:2px solid black;
}



  </style>
  
  <%@ taglib prefix="s" uri="/struts-tags" %>
  
  <script>
/*$(document).ready(function() {  
  var loader = document.getElementById("preloader");
  
  window.addEventListener("load", function(){
  	loader.style.display = "none";
  });
  });*/
  
	
  
function generateNewCaptcha() {		
		document.getElementById("capImg").setAttribute("src", "");
		document.getElementById("capImg").setAttribute("src", "loadCaptcha?date="+new Date());
	}	


var button = document.getElementById("loginBtn");
button.addEventListener("keypress", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
    document.getElementById("loginBtn").click();
  }	
});  


  </script>

  
  </head>
  
  <body>
  <!-- <div id="preloader"> </div>  -->
  
    <div class="container">
  		<img src="images/NU.png" class="img-fluid" alt="NU Banner">
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Student Data Download</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Title_1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Title_2</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</div>

<br>
  <div class="container" id="login">
    <form action="loginAct" method="post">
          <div class="modal-header">
            <h5 class="modal-title">Please, Log In With Email & Password</h5>
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
                <label>Captcha<span class="text-danger">*</span></label>
                <input type="text" name="captcha" class="form-control" id="captcha" placeholder="Enter captcha">
            </div>
            
            <div class="mb-3">
            <img id="capImg" src="loadCaptcha" /> <button type="button"	onclick="generateNewCaptcha();">Refresh</button>
             </div>
             
            <div class="mb-3">
                <input class="form-check-input" type="checkbox" value="" id="remember" required>
                <label class="form-check-label" for="remember">Remember Me</label>
                <a href="#" class="float-end">Forgot Password</a>
            </div>
          </div>
          
      
         <h6 style="color:RED; text-align: center;">
  			<s:property value="msg"/>
  		 </h6>
  		
          
          
       <!--     <div class="mb-3">
          <h5><s:property value="msg" /></h5>
           </div>
           
           -->
           
          <div class="modal-footer pt-4">                  
            <button type="submit" class="btn btn-success mx-auto w-100" id="loginBtn" onclick="loginUser();">Login</button>
          </div>
          <p class="text-center">Not yet account, <a href="Register.jsp">Signup</a></p> 
      </form>  
      
</div>



<br>
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
        
    </div>
  </div>
</div>



<!-- Modal Form For Search -->



  </body>
</html>