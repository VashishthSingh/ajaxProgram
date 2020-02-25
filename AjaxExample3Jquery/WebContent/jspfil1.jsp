<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"type="text/javascript"></script> 
	<script>

// 		$(document).ready(function() {
//         	$('#getResponse').click(function() {
//         		var comment1=$('#messageArea').val();
//                 var email1=$('#myEmail').val();
//                 $.get('GetUserServlet', {
//                 							comment:comment1,
//                 							email :email1
//                 						}, 
//                 		function(responseText) {
//                         $('#ajaxGetUserServletResponse').text(responseText);
//                 });
//         	});
// 		});		

		$(document).ready(function() {
			$('#getResponse').click(function() {
				$.ajax({
					url : 'GetUserServlet',
					data : {
						comment:$('#messageArea').val(),
						email:$('#myEmail').val()
					},
					success : function(responseText) {
						$('#ajaxGetUserServletResponse').text(responseText);
					}
				});
			});
		});
		
	</script>
	<style type="text/css">
		#messageArea{border: 1px solid gray;}
	</style>
</head>
<body>
	<b>Enter Comment:</b><br>
	<textarea rows="2" cols="60" name="message" id="messageArea"></textarea><br><br>
	<b>Enter Email:</b><br>
	<input type="text" name="email" id="myEmail"/><br><br>
	<input type="button" id="getResponse" value="Post Comment"/>
	<div id="ajaxGetUserServletResponse"></div>
</body>
</html>