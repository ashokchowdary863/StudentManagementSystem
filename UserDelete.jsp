<%@page import ="jsp.*,java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String uname=request.getParameter("user");
	try 
	{
   	 	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://192.168.35.103:3315/trainee_dev", "trainee_dev", "trainee_dev");
		con.setAutoCommit(true);
    	Statement stmt=con.createStatement();
		stmt.executeUpdate("delete  from hakit_AL183 where user_name='"+uname+"'");
		%>
		<script type="text/javascript">
				alert("Error Occured");
			
			</script>
		<%
		response.sendRedirect("EditUserDetails.jsp");
		
		stmt.close();
		con.close();
	}catch(Exception e){
		System.out.println(e);
	}
%>
