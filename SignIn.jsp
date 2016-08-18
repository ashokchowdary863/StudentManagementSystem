<%@page import ="jsp.*,java.sql.*" %>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String userName=(String)session.getAttribute("username");
	if(userName!=null){
		response.sendRedirect("welcome.jsp");
	} %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alacriti:Login</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
  
      <a class="navbar-brand" href="index.jsp"><img alt="Brand" src="icons/logo.png" height="30"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">Home <span class="sr-only"></span></a></li>
        <% 
       
        	if(userName==null || userName==""){
        
        %>
        <li><a href="SignUp.jsp">User Registration Page</a></li>
         
        <li class="active"><a href="SignIn.jsp">Login</a></li>
        
        <% }
        	else{
        		
        		%>
        		
         
       			 <li><a href="Profile.jsp">Profile</a></li>
       			 <li> <a href="#">Welcome <b> <%=userName %></a></b></li>
        		
        		<%
        	}
        %>
      </ul>
     <form class="navbar-form navbar-right" role="search" action="Search.jsp" method="POST">
        <div class="form-group">
          <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Search the User">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<body>





<div class="container">
<br><br><br><br>

<div class="panel panel-primary" align="center">
  <div class="panel-heading">
    <h3 class="panel-title">User Login Form</h3>
  </div>
  <div class="panel-body">
   
<br><br>
<form class="form-horizontal" action="LoginCheck.jsp" method="post" align="center">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">User Name</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="username" name="username" placeholder="Enter Your username" required>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="password" name="password" placeholder="Enter Your Password" required>
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-6">
      <button type="submit" class="btn btn-success">Click here to Login</button>
    </div>
  </div>
</form>

  </div>

</div>
</body>
</html>