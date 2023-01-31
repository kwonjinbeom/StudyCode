<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="/WEB-INF/common/common.jsp" %>
		<style type="text/css">
			#boardPwdBut{margin-bottom: 8px;}
			.table-height{height: 200px;}
			.table-height .text-vertical{vertical-align: middle;}
		</style>
		<script type="text/javascript">
			$(function(){
				$("#updateForm").click(function(){
						$("#f_data").attr({
							"method":"post",
							"action":"/board/updateForm.do"
						});
						$("#f_data").submit();
					});
				

				$("#boardDelete").click(function(){
						$("#f_data").attr({
							"method":"post",
							"action":"/board/deleteBoard.do"
						});
						$("#f_data").submit();
					});
				
				$("#boardListBtn").click(function(){
					location.href="/board/getBoardList.do";
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>게시판 상세화면</h3></div>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="num" value="${detail.num}">
			</form>
			
			<%-- ========= 비밀번호 확인 버튼 및 버튼 추가 시작 ====== --%>
			<div id="boardPwdBut" class="row text-center">
				<div id="pwdChk" class="col-md-9 text-left">	

				</div>
				<div class="col-md-3 text-right">
					<button type="button" id="updateForm" class="btn btn-primary btn-sm" >수정</button>
					<button type="button" id="boardDelete" class="btn btn-primary btn-sm">삭제</button>
					<button type="button" id="boardReply" class="btn btn-primary btn-sm">답변</button>
					<button type="button" id="boardListBtn" class="btn btn-primary btn-sm">목록</button>
				</div>
			</div> 
			<%--========= 비밀번호 확인 버튼 및 버튼 추가 종료 ========= --%>
			
			<%-- =============== 상세 정보 보여주기 시작 ============ --%>
			<div class="text-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="col-md-3">글번호</td>
							<td class="col-md-3 text-left">${detail.num} <label>(조회수: ${detail.readcnt})</label></td>
							<td class="col-md-3">작성일</td>
							<td class="col-md-3 text-left">${detail.writeday}</td>
						</tr>
						<tr>
							<td class="col-md-3">작성자</td>
							<td colspan="3" class="col-md-9 text-left">${detail.author}</td>
						</tr>
						<tr>
							<td class="col-md-3">글제목</td>
							<td colspan="3" class="col-md-9 text-left">${detail.title}</td>
						</tr>
						<tr class="table-height">
							<td class="text-valign">글내용</td>
							<td colspan="3" class="text-left">${detail.content}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>

	</body>
</html>