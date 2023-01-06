<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat" %>

<%@ page import = "example.Clock" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>JSP 예제 파일</title>
</head>
<body>
	<%
		Date nowDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		String formatDate = dateFormat.format(nowDate);
		
		
	%>
	<%-- <p> 일반적인 JSP 페이지의 형태로 아래와 같이 현재 날씨를 제공합니다.<br/>
		현재 날짜는 <%=formatDate%> 입니다.
	</p> --%>
	<%
		// example 패키지의 Clock 클래스를 생성하여 오늘 날짜와 시간을 출력해 주세요
		Clock dateTime = new Clock();
	%>
	<p> 일반적인 JSP 페이지의 형태로 아래와 같이 현재 날씨를 제공합니다.<br/>
		현재 날짜와 시간는 <%=dateTime.printDate()%> 입니다.
	</p>
</body>
</html>