<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Insert title here</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			a{text-decoration: none;}
		</style>
		<script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
	</head>
	<body>
		<div>
			<%= (String)request.getAttribute("message") %>
		</div>
		<div>
			<a href="/test0118/boardList">리스트로 이동</a>
		</div>
		
	</body>
</html>