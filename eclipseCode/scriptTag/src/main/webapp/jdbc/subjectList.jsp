<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.subject.SubjectVO" %>
<%	
	ArrayList<SubjectVO> list = (ArrayList<SubjectVO>)request.getAttribute("list");
	int counter = list.size();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>자바 빈즈를 이용한 subject테이블 조회  예제 : subjectList.jsp</title>
		
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			body{font:12px/2em "돋움" }
			
			div#subjectList{width:600px; float: left;}
			div#subjectList table{border-collapse:collapse; width:600px; margin:0 auto; margin-top:8px;}
			div#subjectList thead > div#subjectList tr{background-color:#ececec}
			div#subjectList th, div#subjectList td{border:1px solid black;}
			
			.tc{text-align:center;}
			.tl{text-align:left;}
			.tr{text-align:right;}

		</style>
		<script type="text/javascript" src="/scriptTag/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				// 학과 정보 등록 버튼 제어 
				$("#subjectInsert").click(function(){
					location.href="<%=request.getContextPath()%>/jdbc/subjectForm.jsp";
				});
			});
		</script>
	</head>
	<body>
		<h3> 자바 빈즈 SubjectDAO를 통해 subject 테이블 조회 프로그램 </h3>
		<hr />
		<div id="subjectList">
			<div class="tr"><input type="button" value="학과정보등록" id="subjectInsert" /></div>
			<table>
				<thead>
					<tr>
				        <th>번호</th>
						<th>학과번호</th>
						<th>학과명</th>
				    </tr>
				</thead>
				<tbody>	
				<% if (counter > 0) { 
					for( SubjectVO sub : list ) {
					/* for(int i=0; i<counter;i++){
						SubjectVO sub = list.get(i); */
				%>
					    <tr class="tc" data-no="<%= sub.getNo() %>">
					    	<td><%= sub.getNo()%></td>
					        <td><%= sub.getS_num()%></td>
	       					<td><%= sub.getS_name() %></td>
					    </tr>
				<%
					}
				   } else{
				%>
						<tr>
							<td colspan="3" class="tc">조회된 학과 정보가 존재하지 않습니다.</td>
						</tr>
				<% } %>
				</tbody>
			</table>
			<div class="tr">조회된 학과 수는 <span id="counter"><%=counter%></span>입니다.</div>
		</div>

	</body>
</html>