<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>목록보기</title>
		
		<link rel="shortcut icon" href="/image/icon.png" />
		<link rel="apple-touch-icon" href="/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/include/dist/css/bootstrap-theme.css" />
		
				
		<script type="text/javascript" src="/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/* 글쓰기 버튼 클릭 시 처리 이벤트 */		
				$("#writeForm").click(function(){
					//console.log("글쓰기 버튼 클릭");
					location.href = "/board/insertForm.do";
				});
			});
		</script>	
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>게시판 리스트</h3></div>

			<%-- =================== 리스트 시작  ================== --%>
			<div id="boardList">
				<table summary="게시판 리스트" class="table">
					<thead>
						<tr>
						   <th class="col-md-1 text-center">번호</th>
						   <th class="col-md-6 text-center">제목</th>
						   <th class="col-md-2 text-center">작성자</th>
						   <th class="col-md-2 text-center">날짜</th>
						   <th class="col-md-1 text-center">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty list}" >
								<c:forEach var="vo" items="${list}">
									<tr class="text-center" data-num="${vo.num}">
									   <td>${vo.num}</td>
									   <td class="text-left"><span class="goDetail">${vo.title}</span></td> 
									   <td>${vo.author}</td>
									   <td>${vo.writeday}</td>
									   <td>${vo.readcnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="5" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
							</c:otherwise>
						</c:choose>		
					</tbody>
				</table>
			</div>
			
			<%-- ================ 글쓰기 버튼 출력 시작 =============== --%>
			<div class="contentBtn text-right">
				<button type="button" id="writeForm"  class="btn btn-primary btn-sm">글쓰기</button>
			</div>
		</div>
	</body>
</html>