 <%@page import ="jsp.*,java.sql.*,java.util.Date" %>
 
 <%	
 String userName=(String)session.getAttribute("username");
 	int status=0;
 			Date d=new Date();
 			String sender=userName;
 			String reciever=request.getParameter("reciever");
 			String message=request.getParameter("message");
 			String date=""+d;
 			String ip=request.getRemoteAddr();
    		try 
            {
                Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://192.168.35.103:3315/trainee_dev", "trainee_dev", "trainee_dev");
                String query = "insert into hakit_messages_AL183"+" VALUES"+"(?,?,?,?,?)";
                con.setAutoCommit(true);
               

               
                
               PreparedStatement  st = con.prepareStatement(query);
                st.setString(1,sender);
                st.setString(2,reciever);
                st.setString(3,message);
                st.setString(4,date);
                st.setString(5,ip);
               status= st.executeUpdate();
           
               if(status<=0){ %>
   			<script >
   	        alert("Message Sending Failed");
   	        window.location="SendLogs.jsp";
   	    </script>
   		<%  }else{
   		
   		 %>
			<script  >
	        alert("Message sent Successfully");
	        window.location="SentMessages.jsp";
	    </script>
		<%
   			
   		}
              st.close();
             con.close();  
            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
    		
    		
    		
    		
 %>
 <body><%=sender %></body>