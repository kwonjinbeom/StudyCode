<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); //post 방식의 한글처리 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>책정보 처리 페이지 예제 : bookResult.jsp</title>
		
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
	<%-- 액션태그 --%>
	<jsp:useBean id="book" class="com.book.BookVO" /> <%-- com.book.BookVO book = new com.book.BookVO();와 같은 표현 --%>
	<%-- 이 작업을 아래 한 문장으로 가능
		<jsp:setProperty name="book" property="title" param="title" />
		<jsp:setProperty name="book" property="author" param="author" /> 
		<jsp:setProperty name="book" property="publisher" param="publisher" />  
	--%>
	<jsp:setProperty name="book" property="*" />
	<%
		request.setAttribute("book", book); // request 객체의 속성 설정.
	%>
	<jsp:forward page="bookOutput.jsp" />	
	</body>
</html>