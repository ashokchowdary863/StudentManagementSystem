<%@page import ="jsp.*,java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alacriti Infosystems Pvt Ltd</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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
        <li class="active"><a href="#">Home <span class="sr-only"></span></a></li>
        <% 
        String userName=(String)session.getAttribute("username");
        	if(userName==null || userName==""){
        
        %>
        <li><a href="SignUp.jsp">User Registration Page</a></li>
         
        <li><a href="SignIn.jsp">Login</a></li>
        
        <% }
        	else{
        		
        		%>
        		
         
       			 <li><a href="Profile.jsp">Profile</a></li>
       			 <li><a href="EditProfile.jsp">Update Profile</a></li>
       			 <li><a href="ListUsers.jsp">All Users</a></li>
       			 <li><a href="EditUserDetails.jsp">Update/Delete User</a></li>
       			  <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Messaging <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="SendLogs.jsp">Send Message</a></li>
            <li><a href="SentMessages.jsp">Sent Messages</a></li>
            <li><a href="RecievedMessages.jsp">Recieved Messages</a></li>
          </ul>
        </li>
       			 <li> <a href="#">Welcome <b> <%=userName %></a></b></li>
        		        		<li><a href="Logout.jsp">Logout</a></li> 
        		
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
<body background="icons/bg.png">
<div class="container">
<br><br>
<div class="panel panel-success">
  <div class="panel-heading">
    <h3 class="panel-title">Status Report of the Website</h3>
  </div>
  <div class="panel-body">
  		<!-- Features Implemented Upto now -->
  			<div class="panel panel-info">
  					<div class="panel-heading">
    						<h3 class="panel-title">Features Implemented</h3>
 					 </div>
  			<div class="panel-body">
 						<div class="list-group">
  								<button type="button" class="list-group-item">User Registration</button>
 							    <button type="button" class="list-group-item">Login System</button>
  								<button type="button" class="list-group-item">Session Management</button>
  								<button type="button" class="list-group-item">User Profile</button>
 								 <button type="button" class="list-group-item">Edit Profile</button>
 								 <button type="button" class="list-group-item">All users List</button>
 								 <button type="button" class="list-group-item">Search</button>
 								  <button type="button" class="list-group-item">Update/Delete User(Admin)</button>
 							 	 <button type="button" class="list-group-item">Messaging</button>
 								 
			</div>
			</div>
			</div>
  		<!-- End UptoNow Features -->
 <!-- Future Implementations -->
  			<div class="panel panel-info">
  					<div class="panel-heading">
    						<h3 class="panel-title">Features to be implemented</h3>
 					 </div>
  			<div class="panel-body">
 			<div class="panel-body">
 						<div class="list-group">
  								<button type="button" class="list-group-item">Admin Panels</button>
 							    <button type="button" class="list-group-item">User to Scrum Interaction Module</button>
  								<button type="button" class="list-group-item">User to Mentor Interaction Module</button>
  								<button type="button" class="list-group-item">User wise Logs(Status Reports)</button>
 								 <button type="button" class="list-group-item">Date wise Status Reports</button>
 						    	 <button type="button" class="list-group-item">etc..,</button>
 								 
						</div>
			</div>
			</div>
  		<!-- End Future Implementations -->
	
</div>
</div>

</div>
</body>
</html>