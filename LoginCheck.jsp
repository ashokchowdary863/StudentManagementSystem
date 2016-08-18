<%@page import ="jsp.*,java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alacriti Infosystems Pvt Ltd</title>
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
        <li><a href="SignUp.jsp">User Registration Page</a></li>
             <!--  <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
   
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        -->
        <li><a href="SignIn.jsp">Login</a></li>
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
	String uname=request.getParameter("username");
    String pwd=request.getParameter("password");
    try{
    	 Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://192.168.35.103:3315/trainee_dev", "trainee_dev", "trainee_dev");
         con.setAutoCommit(true);
         Statement stmt=con.createStatement();
         HttpSession sesson=request.getSession();
         ResultSet resultSet=stmt.executeQuery("select * from hakit_AL183 where user_name='"+uname+"'");
    	if(resultSet.next()){
    		if(resultSet.getString(3).equals(pwd)){
    				
    				session.setAttribute("username", uname);
    				%>
    				<script type="text/javascript">
    					alert("Successfully Logged in");
    					window.location="welcome.jsp";
    				
    				</script>
    				<%
    				
    		}
    		else{
    			%>
				<script type="text/javascript">
					alert("Invalid Password...Try Again");
					window.location="SignIn.jsp";
				</script>
				<%
    		}
    	}
    	else{
    		%>
			<script type="text/javascript">
				alert("Username Doesn't match with records");
				window.location="SignIn.jsp";
			</script>
			<%
    	}
    	resultSet.close();
    	stmt.close();
    	con.close();
    }catch(Exception e){
    	System.out.println(e);
    }
   
%>



</body>
</html>