<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"type="text/javascript"></script>
	<script>
	
		/*$(document).ready(function() {
        	$('#getResponse').click(function() {
        		var Name = $('#name').val();
                var Uname = $('#userName').val();
                var pass = $('#password').val();
                $.get('GetUserServlet1', {
                							myName:Name,
                        					myUserName :Uname,
                        					myPassword:pass
                						}, 
                		function(responseText) {
                        $('#ajaxGetUserServletResponse').text(responseText);
                });
        	});
		});
		*/
		
		$(document).ready(function() {
			$('#getResponse').click(function() {
				$.ajax({
					url : 'GetUserServlet1',
					data : {
						myName:$('#name').val(),
						myUserName :$('#userName').val(),
						myPassword:$('#password').val()
					},
					success : function(responseText) {
						$('#ajaxGetUserServletResponse').text(responseText);
					}
				});
			});
		});
		
	</script>
</head>
<body>

	<form name="myForm">
		Enter Your Name: <input type="text" id="name" />
		Enter Your UserName: <input type="text" id="userName" />
		Enter Your Password: <input type="text" id="password" />
		                     <input type="button" id="getResponse" value="submit" />
	</form>
	<br>
	<strong>Ajax Response</strong>
	<div id="ajaxGetUserServletResponse"></div>
</body>
</html>