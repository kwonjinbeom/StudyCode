<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, com.subject.SubjectVO" %>
<%
	ArrayList<SubjectVO> list = (ArrayList<SubjectVO>)request.getAttribute("list");
	int counter = list.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Insert title here</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
		
<!--[if lt IE 9]>
<script src="../js/html5shiv.js"></script>
<![endif]-->
		
<script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
<script>
	$(function(){
		$("#?").click(function(){
			location.href = "/scriptTag/jdbc/subjectForm.jsp"
		})
	})
	
	$().click(function(){
		$().attr({
			"method" : "post",
			"action" : "/scriptTag/"
		})
	})
</script>
</head>
<body>
	<%
	if(counter>0){
		for(int i = 0 ; i< counter; i++){
			SubjectVO vo = list.get(i);
	%>
		<tr>
			<td><%= vo.getNo()%></td>
			<td><%= vo.getS_num()%></td>
			<td><%= vo.getS_name()%></td>
		</tr>
	<%
	}
		}else{
			%>
			<tr>
				<td>존재 x</td>
			</tr>
		<%} %> 
</body>
</html>