<%@page import ="jsp.*,java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Confirmation</title>
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
    		String user_name=request.getParameter("user_name");
    		String user_fullname=request.getParameter("user_fullname");
    		String user_password=request.getParameter("user_password");
    		String user_email=request.getParameter("user_email");
    		String user_mobileno=request.getParameter("user_mobileno");
    		String user_birthday=request.getParameter("user_birthday");
    		int status=0;
    		Connection con=null;
    		Statement st1=null,st2=null,st3=null,st4=null;
    		PreparedStatement st=null;
    		try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://192.168.35.103:3315/trainee_dev", "trainee_dev", "trainee_dev");
                String query = "insert into hakit_AL183"+" VALUES"+"(?,?,?,?,?,?,?)";
                con.setAutoCommit(true);
                 st1=con.createStatement();
                 st2=con.createStatement();
                 st3=con.createStatement();
                 st4=con.createStatement();
                ResultSet rs=st1.executeQuery("select max(user_id) from hakit_AL183");
                ResultSet checkUserName=st2.executeQuery("select * from hakit_AL183 where user_name='"+user_name+"'");
                ResultSet checkUseremail=st3.executeQuery("select * from hakit_AL183 where user_email='"+user_email+"'");
                ResultSet checkUsermobile=st4.executeQuery("select * from hakit_AL183 where user_mobileno='"+user_mobileno+"'");

                int max_Id=0;
                if(rs.next()){
                	max_Id=rs.getInt("max(user_id)")+1;
                }
                if(checkUserName.next()){
                	%>
                	<script type="text/javascript" >
    	        alert("UserName Already Exists...Choose another one");
    	        window.location="SignUp.jsp";
    	 		
    	       System.exit(0);
    	    </script>
    	    <% 
                }
                if(checkUseremail.next()){
                	%>
                	<script type="text/javascript" >
    	        alert("Email Address Already Exists...Choose another one");
    	        window.location="SignUp.jsp";
    	       System.exit(0);
    	    </script>
    	    <% 
                }
                if(checkUsermobile.next()){
                	%>
                	<script type="text/javascript" >
    	        alert("Mobile Number Already Exists...Choose another one");
    	        window.location="SignUp.jsp";
    	      System.exit(0);
    	    </script>
    	    <% 
                }
                
                
                 st = con.prepareStatement(query);
                st.setInt(1,max_Id);
                st.setString(2,user_name);
                st.setString(3,user_password);
                st.setString(4,user_fullname);
                st.setString(5,user_email);
                st.setString(6,user_mobileno);
                st.setString(7,user_birthday);
               status= st.executeUpdate();
               rs.close();
               checkUseremail.close();
               checkUsermobile.close();
               checkUserName.close();
               
            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
    		if(status<=0){ %>
    			<script type="text/javascript" >
    	        alert("Registration Failed");
    	        window.location="SignUp.jsp";
    	    </script>
    		<%  }
    		try{
    			
    			st1.close();
    			st.close();
    			con.close();
    		}catch(Exception e){
    			System.out.println(e);
    		}
    		
 %>
 
 <div class="container">
 <center><h3>Registration Details</h3></center>
 	<table class="table table-bordered" width="600px">
	<tr class="success">
		<td>User Name</td>
		<td><%= user_name %></td>
	</tr>
	<tr class="warning">
		<td>Full Name</td>
		<td><%= user_fullname %></td>
	</tr>
	<tr class="info">
		<td>Password</td>
		<td><small>Encrypted and secured</small></td>
	</tr>
	<tr>
		<td>Email Address</td>
		<td><%= user_email %></td>
	</tr>
	<tr class="danger">
		<td>Phone Number</td>
		<td><%= user_mobileno %></td>
	</tr>
	<tr class="warning">
		<td>Date of Birthday</td>
		<td><%= user_birthday %></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" class="btn btn-success" value="Registration Status : Success" id="confirm_submit"/> </td>
	</tr>
</table>
</div>
</body>
</html>