<%@page import ="jsp.*,java.sql.*" %>

<%
		String userName=(String)session.getAttribute("username");
		String user_name=request.getParameter("user_name");
    		String user_fullname=request.getParameter("user_fullname");
    		String user_password=request.getParameter("user_password");
    		String user_email=request.getParameter("user_email");
    		String user_mobileno=request.getParameter("user_mobileno");
    		String user_birthday=request.getParameter("user_birthday");
    		int status=0;
    		Connection con=null;
			PreparedStatement st=null;
    		try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://192.168.35.103:3315/trainee_dev", "trainee_dev", "trainee_dev");
                con.setAutoCommit(true);
                String query="update hakit_AL183 set user_fullname='"+user_fullname+"' , user_email='"+user_email+"' ,  user_mobileno='"+user_mobileno+"' , user_birthday='"+user_birthday+"',user_password='"+user_password+"' where user_name='"+user_name+"'";
                st=con.prepareStatement(query);
                status=st.executeUpdate();
                

               
            } 

            catch (Exception e) 
            {
                System.out.println(e);
            }
    		if(status<=0){ %>
    			<script type="text/javascript" >
 

    	        alert("Update Failed");
    	    </script>
    	    
    		<%
    		response.sendRedirect("EditUserDetails.jsp");
    		}
    		else{
    			%>
    			<script type="text/javascript" >
 

    	        alert("Details Updated Successfully");
    	    </script>
    	    
    		<%
    			response.sendRedirect("EditUserDetails.jsp");
    		}
    		try{
    			
    			
    			st.close();
    			con.close();
    		}catch(Exception e){
    			System.out.println(e);
    		}
    		
 %>