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
        <li><a href="index.jsp">Home <span class="sr-only"></span></a></li>
         <% 
        String userName=(String)session.getAttribute("username");
        	if(userName==null || userName==""){
        
        %>
        <li><a href="SignUp.jsp">User Registration Page</a></li>
         
        <li><a href="SignIn.jsp">Login</a></li>
        
        <% }
        	else{
        		
        		%>
        		
         
       			 <li class="active"><a href="Profile.jsp">Profile</a></li>
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
<body>
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

<%
	String uid=null,fullname=null,email=null,mobile=null,birthday=null;
	try 
	{
   	 	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://192.168.35.103:3315/trainee_dev", "trainee_dev", "trainee_dev");
		Statement stmt=con.createStatement();
		ResultSet profileSet=stmt.executeQuery("select * from hakit_AL183 where user_name='"+userName+"'");
		if(profileSet.next()){
			uid=profileSet.getString("user_id");
			fullname=profileSet.getString("user_fullname");
			email=profileSet.getString("user_email");
			mobile=profileSet.getString("user_mobileno");
			birthday=profileSet.getString("user_birthday");
		}
	}catch(Exception e){
		System.out.println(e);
	}
%>
<div class="container">
<br><br><br><br>

<div class="panel panel-primary" align="center">
  <div class="panel-heading">
    <h3 class="panel-title"><b><%=userName %>'s Profile</b></h3>
  </div>
  <div class="panel-body">
   
<table class="table table-bordered" width="600px">
	<tr class="danger">
		<td>User ID</td>
		<td><%=uid %></td>
	</tr>
	<tr class="success">
		<td>User Name</td>
		<td><%=userName %></td>
	</tr>
	<tr class="warning">
		<td>Full Name</td>
		<td><%=fullname %></td>
	</tr>
	<tr class="info">
		<td>Password</td>
		<td><small>Encrypted and secured</small></td>
	</tr>
	<tr>
		<td>Email Address</td>
		<td><%=email %></td>
	</tr>
	<tr class="danger">
		<td>Phone Number</td>
		<td><%=mobile %></td>
	</tr>
	<tr class="warning">
		<td>Date of Birthday</td>
		<td><%=birthday %></td>
	</tr>
	<tr>
		<td colspan="2"><a href="EditProfile.jsp"><input type="submit" class="btn btn-success" value="Click to update profile information" id="confirm_submit"/> </a></td>
	</tr>
</table>
  

  </div>

</div>
</div>
</body>
</html>