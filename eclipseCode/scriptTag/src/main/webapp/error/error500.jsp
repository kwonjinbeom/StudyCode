<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<h1>error500.jsp</h1>
		<div id="wrapper">
			<p>요청 처리 과정에서 예외가 발생하였습니다.<br />
			빠른 시간 내에 문제를 해결하도록 하겠습니다.</p>
			<div id = "imgView">
				<img src="../image/error.png" />
			</div>
			<div id ="msgView">
				<label>에러 타입:</label>
				<%= exception.getClass().getName() %><br />
				<label>에러 메시지:</label>
				<strong><%= exception.getMessage() %></strong>
				
			</div>
		</div>
	</body>
</html>