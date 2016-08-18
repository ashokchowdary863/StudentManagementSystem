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
        <li ><a href="index.jsp">Home <span class="sr-only"></span></a></li>
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
       			 <li ><a href="EditUserDetails.jsp">Update/Delete User</a></li>
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
<%
	 userName=(String)session.getAttribute("username");
    if(userName==null || userName==""){
    	%>
		<script type="text/javascript">
			alert("Your are not logged in");
			window.location="SignIn.jsp";
		
		</script>
		<%
    }
%>
<body>
<div class="container">
	<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Send Message</h3>
  </div>
  <div class="panel-body">
   <br>
<div class="alert alert-success">
  <strong>Important Note:</strong> If you don't know the exact Username of the reciptant use search box.
</div>
<br>
<form class="form-horizontal" action="SendingLogs.jsp" method="post">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">From</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="sender" name="sender" value="<%=userName %>" required disabled>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">To</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="reciever" name="reciever" placeholder="Enter reciptant username" required>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Message</label>
    <div class="col-sm-4">
      <textarea class="form-control" rows="5" id="message" name="message" required></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-6">
      <button type="submit" class="btn btn-success">Click to send the message</button>
    </div>
  </div>
</form>

  </div>


</div>

</body>
</html>