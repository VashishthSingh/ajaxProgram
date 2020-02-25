<%@ page import="java.sql.*"%>
<!DOCTYPE html>  
<html>  
<head>  
    <style>  
    	div.box{margin:2px;border:1px solid pink;padding:10px;background-color:#e3e3e3}  
    </style>  
</head>  
<body>  
    <%  
    	String comment=request.getParameter("comment");  
    	String email=request.getParameter("email");  
    	if(comment==null||email==null||comment.trim().equals("")||email.trim().equals("")){  
    		out.print("<p><h2>Please write comment</h2></p>");  
    	}else{  
    		try{  
    			Class.forName("com.mysql.jdbc.Driver");  
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/report?useSSL=false","root","password");   
    			PreparedStatement ps=con.prepareStatement("insert into usercomment(comment,email) values(?,?)");  
    			ps.setString(1,comment);  
    			ps.setString(2,email);  
    			int i=ps.executeUpdate();  
      			ps.close();
      			
    			PreparedStatement ps2=con.prepareStatement("select * from usercomment");  
    			ResultSet rs=ps2.executeQuery();  
      
    			out.print("<hr/><h2>Comments:</h2>");  
    			while(rs.next()){  
    				out.print("<div class='box'>");  
    				out.print("<p>"+rs.getString(1)+"</p>");  
    				out.print("<p><strong>By: "+rs.getString(2)+"</strong></p>");  
    				out.print("</div>");  
    			}  
    			con.close();  
    		}catch(Exception e){
    			out.print(e);
    		}  
    	}//end of else  
    %>  
</body>  
</html>  
    
    
    