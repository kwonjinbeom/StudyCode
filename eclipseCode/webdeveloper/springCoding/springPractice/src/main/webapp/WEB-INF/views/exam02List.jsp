<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Insert title here</title>

		<link rel="shortcut icon" href="/resources//image/icon.png" />
		<link rel="apple-touch-icon" href="/resources//image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->

	</head>
	<body>
		<div>
			<h3>내가 배운 언어들</h3>
			<ul>
				<c:forEach var="lang" items="${language}">
					<li>${lang}</li>
				</c:forEach>
			</ul>
		</div>
	</body>
</html>
