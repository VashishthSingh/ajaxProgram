<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table{border:2px solid gray;text-align:center;}
		tr{border:1px solid silver;padding:3px;}
		th{border:1px solid silver;padding:3px;}
		td{border:1px solid silver;padding:3px;}
	</style>
</head>
<body>

		<% 
		 try{
			String rollNo=request.getParameter("val");
			rollNo=rollNo.trim();
			if(rollNo==null || rollNo.equals(""))
				out.println("<h2>plz.. Enter Your VTU NO e.g. 7077</h2>");
			else{
				int rollNumber=Integer.parseInt(rollNo);
				try{  
					Class.forName("com.mysql.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/report?useSSL=false","root","password");  
					PreparedStatement ps=con.prepareStatement("select * from stuRec where id=?");  
					ps.setInt(1,rollNumber);  
					ResultSet rs=ps.executeQuery();  
					boolean flag=rs.next();
					if(flag){
						int r=rs.getInt(1);
						String name=rs.getString(2);
						String mentor=rs.getString(3);

		%>
					<br><br>
					<table>
						<tr>
							<th>RollNo</th>
							<th>Name</th>
							<th>Mentor Name</th>
						</tr>
						<tr>
							<td><%=r%></td>
							<td><%=name%></td>
							<td><%=mentor%></td>
						</tr>
					</table>
		<%

					}
					else{
						out.print("This user doesn't exist");
					}
					con.close();  
				 }catch(Exception e){
					e.printStackTrace();
				 }  
			}
		 }
		 catch(NumberFormatException nfe){
			out.println("<h2>Invalid VTU Number..\nVTU number: e.g. 7077</h2>" +nfe);
		 }
		%>

</body>
</html>