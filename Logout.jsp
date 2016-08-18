<%@page import ="jsp.*,java.sql.*" %>
<%
	
	session.invalidate();
%>
	<script>
		alert("Logged out successfully....");
		window.location="index.jsp";
	</script>
<%
%>