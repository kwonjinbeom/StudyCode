<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page errorPage = "/error/viewErrorMessage.jsp" %> --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>예제 처리 - readParameter.jsp</title>
		
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->	
	</head>
	<body>
		<p>name 파라미터 값:
		<%=request.getParameter("name").toUpperCase() %>
		
		<%-- <% try{ %>
			<p> name 파라미터 값:
			<%= request.getParameter("name").toUpperCase() %></p>
		<% } catch(NullPointerException ne){ %>
			<p> 파라미터 값을 정상적으로 받지 못하였습니다.</p>
		<% } %>
		
		<%
		String name = request.getParameter("name");%>
		<% if(name != null) { %>
			<p> name 파라미터 값: <%= name.toUpperCase() %></p>
		<% } else { %>
			<p> 파라미터 값을 정상적으로 받지 못하였습니다.</p>
		<% }  %> --%>
	</body>
</html>