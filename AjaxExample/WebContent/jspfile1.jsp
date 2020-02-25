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
 			int n=Integer.parseInt(request.getParameter("val"));
			for(int i=1;i<=10;i++)
			out.print(i*n+"<br>");
		%>

	<table>
		<tr>
			<th>time</th>
			<th>date</th>
		</tr>
		<tr>
			<td>12:20:20</td>
			<td>2020:02:19</td>
		</tr>
	</table>

</body>
</html>