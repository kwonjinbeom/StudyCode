<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>EL 예제 - scopeEL.jsp</title>
		
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
		<h2>저장된 객체 추출</h2>
		<hr />
		<% 
			pageContext.setAttribute("message1", "PageContext 객체에 저장된 문자열객체"); 
			request.setAttribute("message", "HttpServletRequest 객체에 저장된 문자열객체");
			session.setAttribute("message3", "HttpSession 객체에 저장된 문자열객체");
			application.setAttribute("message", "ServletContext 객체에 저장된 문자열객체");
			
			//out.println(pageContext.getAttribute("message1") + "<br />");
			//out.println(request.getAttribute("message") + "<br />"); ...
		%>
		pageScope 객체에서 추출 : ${ pageScope.message1 }<br />
		requestScope 객체에서 추출 : ${ requestScope.message }<br />
		sessionScope 객체에서 추출 : ${ sessionScope.message3 }<br />
		applicationScope 객체에서 추출 : ${ applicationScope.message }<br />
		<hr />
		message 추출 : ${message}
	</body>
</html>