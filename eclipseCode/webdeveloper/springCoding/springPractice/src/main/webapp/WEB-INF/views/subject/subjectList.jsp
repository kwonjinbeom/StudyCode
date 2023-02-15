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

		<link rel="shortcut icon" href="/resorces/image/icon.png" />
		<link rel="apple-touch-icon" href="/resorces/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.min.css" />
		
		
		<script type="text/javascript" src="/resources/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
			}) // $() 종료
		</script>
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>학과테이블 정보</h3></div>
				<div class="row">
					<div class="col-xs-6">
				
						<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>학과번호</th>
								<th>학과명</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty subjectList}">
									<c:forEach var = "subject" items="${subjectList}">
										<tr>
											<td>${subject.no}</td>
											<td>${subject.s_num}</td>
											<td>${subject.s_name}</td>
										</tr>
										
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3">등록된 학과 정보가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					</div>
				<div class="col-xs-6">
					<c:import url="http://localhost:8080/subject/insertForm"/>
				</div>
			</div>
		</div>
	</body>
</html>
