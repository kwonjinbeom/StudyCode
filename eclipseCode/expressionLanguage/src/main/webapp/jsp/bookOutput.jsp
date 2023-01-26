<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>책정보 출력 페이지 예제 : bookOutput.jsp</title>
		
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
	<%
		com.book.BookVO b =(com.book.BookVO)request.getAttribute("book");
		out.print(b.getTitle());
		out.print(b.getAuthor());
		out.print(b.getPublisher());
		out.print("<br />");
	%>
		<label>책제목 : </label> ${requestScope.book.title} <br /> 
		<label>책저자 : </label> ${requestScope.book.author} <br />
		<label>출판사 : </label> ${requestScope.book.publisher}
	</body>
</html>