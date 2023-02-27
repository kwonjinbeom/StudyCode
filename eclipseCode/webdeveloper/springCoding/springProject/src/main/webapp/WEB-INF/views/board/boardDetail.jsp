<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix= "fn" uri= "http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file = "/WEB-INF/views/common/common.jspf" %>   
		<style type="text/css">
			#pwdChk{visibility:hidden;}
			#boardPwdBut{margin-bottom: 8px;}
			.table-height{height: 200px;}
			.table-height .text-vertical{vertical-align: middle;}
		</style>
		<script type="text/javascript">
			let buutonCheck =""; //buttonCheck는 수정버튼과 삭제버튼을 구별하기 위한 변수
			$(function(){
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#updateForm").click(function(){
						/*  $("#f_data").attr({
							"method":"post",
							"action":"/board/updateForm"
						});
						$("#f_data").submit();  */
						
						// 비밀번호 확인 후 처리
						
						$("#pwdChk").css("visibility", "visible");
						$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
						buttonCheck = "updateButton"; 
						console.log("수정버튼눌림");
					});
				
				// 삭제 버튼 클릭 시 처리 이벤트 
				 $("#boardDelete").click(function(){
						/*  $("#f_data").attr({
							"method":"post",
							"action":"/board/boardDelete"
						});
						$("#f_data").submit();   */
						
						// 비밀번호 확인 후 처리
 						$("#pwdChk").css("visibility", "visible");
						$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
						buttonCheck = "deleteButton"; 
						
					});
				
				// 비밀번호 확인 버튼 클릭 시 처리 이벤트
 				$("#pwdBut").click(function(event){
					boardPwdConfirm();
				});
				
				$("#pwdButCancel").click(function(){
					$("#b_pwd").val("");
					$("#pwdChk").css("visibility", "hidden");
					buttonCheck = "";
				}) 
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#boardListBtn").click(function(){
					location.href="/board/boardList";
				});
				
				/* 답변 버튼 클릭 시 처리 이벤트 */
				$("#boardReply").click(function(){
					$("#f_data").attr({
						"method":"post",
						"action":"/board/replyForm"
					});
					$("#f_data").submit();
				})
			});
			
			/* 비밀번호 클릭시 실질적인 처리 함수 */
			function boardPwdConfirm(){
				if(!chkData('#b_pwd', "비밀번호를")) return;
				else{
					$.ajax({
						url : "/board/boardPasswdChk", //전송 url
						type : "post", //전송 시 method 방식
						data : $("#f_pwd").serialize(), // 폼전체 데이터 전송
						dataType : "text",
						error : function(){ // 실행시 오류가 발생하였을 경우
							alert('시스템 오류 입니다. 관리자에게 문의 하세요');
						}, // 정상적으로 실행이 되었을 경우
						success : function(resultData){
							let goUrl=""; // 이동할 경로를 저장할 변수
							
							if(resultData==0){ // 일치하지 않는 경우
								$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
								$("#b_pwd").select();
							}else if(resultData==1){ // 일치할 경우
								$("#msg").text("");
								//console.log("비밀번호 일치");
								console.log("비밀번호 일치");
								if(buttonCheck == "updateButton"){ // 수정버튼 클릭
									console.log("if통과");
									goUrl = "/board/updateForm";
									$("#f_data").attr("action", goUrl);
									$("#f_data").submit();
								}else if(buttonCheck=="deleteButton"){ // 삭제버튼 클릭
									if(confirm("정말 삭제하시겠습니까?")){
										goUrl="/board/boardDelete";
										$("#f_data").attr("action",goUrl);
										$("#f_data").submit();
									}
								}
							}
						}
					})
				}
				
			}
			
			
		</script>
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>게시판 상세화면</h3></div>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="b_num" value="${detail.b_num}">
				<input type="hidden" name="b_file" value="${detail.b_file}">
				<input type="hidden" name="b_thumb" value="${detail.b_thumb}">
			</form>
			
			<%-- ========= 비밀번호 확인 버튼 및 버튼 추가 시작 ====== --%>
			<div id="boardPwdBut" class="row text-center">
				<div id="pwdChk" class="col-md-9 text-left">
					<form name="f_pwd" id="f_pwd" class="form-inline">
						<input type="hidden" name="b_num" id="b_num" value="${detail.b_num}"/>
						<label for ="b_pwd" id="l_pwd">비밀번호: </label>
						<input type="password" name="b_pwd" id="b_pwd" class="form-control" />
						
						<button type="button" id="pwdBut" class="btn btn-default btn-sm">확인</button>
						<button type="button" id="pwdButCancel" class="btn btn-default btn-sm">취소</button>
						<span id="msg"></span>
					</form>	
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
							<td class="col-md-3 text-left">${detail.b_num} <label>(조회수: ${detail.readcnt})</label></td>
							<td class="col-md-3">작성일</td>
							<td class="col-md-3 text-left">${detail.b_date}</td>
						</tr>
						<tr>
							<td class="col-md-3">작성자</td>
							<td colspan="3" class="col-md-9 text-left">${detail.b_name}</td>
						</tr>
						<tr>
							<td class="col-md-3">글제목</td>
							<td colspan="3" class="col-md-9 text-left">${detail.b_title}</td>
						</tr>
						<tr class="table-height">
							<td class="text-valign">글내용</td>
							<td colspan="3" class="text-left">${detail.b_content}</td>
						</tr>
						<tr>
							<td class="col-md-3">이미지</td>
							<td colspan="3" class="col-md-9 text-left">
								<c:if test="${not empty detail.b_file}">
									<img src="/uploadStorage/board/${detail.b_file}"/>
								</c:if>
								<c:if test="${empty detail.b_file}">
									<img src="/resources/images/common/nonimage.png"/>
								</c:if>
							</td>
							
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 상세 정보 보여주기 종료 -->
			<jsp:include page="reply.jsp"/>
		</div>

	</body>
</html>