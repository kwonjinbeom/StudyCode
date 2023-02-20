<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/common.jspf" %>    
		<style type="text/css">
			#content{resize: none;}
		</style>

		<script type="text/javascript">
			$(function(){
				let msg = "${errorMsg}";
				if(msg!=""){
					alert(msg);
				}
				
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#boardUpdate").click(function(){
					//입력값 체크
					if (!chkData("#b_title","제목을"))	return;
					else if (!chkData("#b_content","작성할 내용을"))	return;
					else {
						$("#f_updateForm").attr({
							"method":"post",
							"action":"/board/boardUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#boardListBtn").click(function(){
					location.href="/board/boardList";
				});
			});
		</script>		
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>글수정</h3></div>
			
			<div class="text-center">
				<form id="f_updateForm" name="f_updateForm">
				    <input type="hidden" name="b_num" id="b_num" value="${updateData.b_num}">
					<table class="table table-bordered">
						<tr>
							<td class="text-center">글번호</td> 
							<td class="text-left">${updateData.b_num} <span>(조회수: ${updateData.readcnt})</span></td>
							<td class="text-center">작성일</td> 
							<td class="text-left">${updateData.b_date}</td> 
						</tr>
						<tr>
							<td class="text-center">작성자</td>
							<td colspan="3" class="text-left">${updateData.b_name}</td>
						</tr>
						<tr>
							<td class="text-center">글제목</td>
							<td colspan="3"><input type="text" name="b_title" id="b_title" value="${updateData.b_title}" 
							class="form-control" /></td>
						</tr>
						<tr>
							<td class="text-center">글내용</td>
							<td colspan="3"><textarea name="b_content" id="b_content" rows="8" 
							class="form-control">${updateData.b_content}</textarea></td>
						</tr>
						<tr>
							<td class="text-center">비밀번호</td>
							<td colspan="3"><input type="password" name="b_pwd" id="b_pwd" 
							class="form-control" placeholder="기존 비밀번호가 아니라 수정할 비밀번호를 입력해 주세요."/></td>
						</tr>	
					</table>
				</form>
			</div>
			
			<div class="text-right">
				<button type="button" id="boardUpdate" class="btn btn-primary btn-sm">수정</button>
				<button type="button" id="boardListBtn" class="btn btn-primary btn-sm">목록</button>
			</div>
		</div>	
	</body>
</html>