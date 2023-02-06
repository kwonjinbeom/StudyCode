<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>Insert title here</title>

<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />
		
<!--[if lt IE 9]>
<script src="../js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#loginBtn").click(function(){
			$("#loginForm").attr({
				"method":"post",
				"action":"/board/insertBoard.do"
			});
			$("#loginForm").submit();
		});
	});
</script>
</head>
<body>
	<form id="loginForm">
	<table>
		<tr>
			<td>id</td>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="text" name="pw"/></td>
		</tr>
		<tr>
			<td>
				<button type="button" id="loginBtn">login</button>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>