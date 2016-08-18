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
        <li><a href="#">Home <span class="sr-only"></span></a></li>
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
<div class="container">
<br><br>
<div class="panel panel-success">
  <div class="panel-heading">
    <h3 class="panel-title"><b><%=userName %>'s InBox</b></h3>
  </div>
  <div class="panel-body">
  
    			<%
    			String messageOutput="";
    			try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://192.168.35.103:3315/trainee_dev", "trainee_dev", "trainee_dev");
               		Statement stmt=con.createStatement();
               		ResultSet listSet=stmt.executeQuery("select * from hakit_messages_AL183 where receiver='"+userName+"' order by date DESC");
               		while(listSet.next()){
               			messageOutput+= "<div class='panel panel-warning'>";
               			messageOutput+="<div class='panel-heading'><h3 class='panel-title'>From : "+listSet.getString("sender")+"</h3>";
               			messageOutput+="</div>";
               			messageOutput+="<div class='panel-body'>";
               			messageOutput+="<b><h4>"+listSet.getString("message")+"</h4></b></br>";
						messageOutput+="<small>Date:"+listSet.getString("date")+", IP Address :"+listSet.getString("ip")+"</small>";
						messageOutput+="</div>";
						messageOutput+="</div>";
               		}
               		stmt.close();
               		con.close();
                }catch(Exception e){
                	System.out.println(e);
                }
    			
    			%>
    			
    			<%=messageOutput %>
			</table>
  </div>
</div>
</div>
</body>
</html>