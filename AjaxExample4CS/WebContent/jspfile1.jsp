<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{border:2px solid gray;text-align:center;}
		tr,th,td{border:1px solid silver;padding:3px;}
	</style>
	
</head>
<body>
	<table>
		<tr>
			<th>dateTime</th>
			<th>ramUsed</th>
			<th>diskUsed</th>
			<th>cpuUsed</th>
		</tr>
	 <%    
	    double ram=0,disk=0,cpu=0;String dateTime=null;
    	try{  
    		Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/report?useSSL=false","root","password");   
    		PreparedStatement ps=con.prepareStatement("select * from MyTable");  
    		ResultSet rs=ps.executeQuery();  
    		
    		while(rs.next()){  
    			ram=rs.getDouble(1);
    			disk=rs.getDouble(2);
    			cpu=rs.getDouble(3);
    			dateTime=rs.getString(4);
     %>
     			<tr>
					<td><%=dateTime%></td>
					<td><%=ram%></td>
					<td><%=disk%></td>
					<td><%=cpu%></td>
				</tr>
     <%
    		}  
    		con.close();  
    		ps.close();
    		rs.close();
    	}catch(Exception e){
    		out.print(e);
    	}  
    %>  
    </table>
</body>
</html>