<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/common.jspf" %>    
		<script type="text/javascript">
		$(function(){
			let msg = "${errorMsg}";
			if(msg!=""){
				alert(msg);
			}
			
			/* 저장 버튼 클릭 시 처리 이벤트 */
			$("#boardInsert").click(function(){
				//입력값 체크
				if (!chkData("#b_name","이름을"))	return;
				else if (!chkData("#b_title","제목을"))	return;
				else if (!chkData("#b_content","작성할 내용을"))	return;
				else if (!chkData("#b_pwd","비밀번호를"))	return;
				else {
					$("#f_writeForm").attr({
						"method":"get",
						"action":"/board/boardInsert"
					});
					$("#f_writeForm").submit();
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
	
<!-- 		<div class="text-center"><h5>boardTable</h5></div>
					<form id="writeForm" name ="writeForm" class="form-horizontal">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td>작성자</td>
									<td class="text-left"><input type="text" name="b_name" id="b_name" class="form_control"/></td>
								</tr>
								<tr>
									<td>글제목</td>
									<td class="text-left"><input type="text" name="b_title" id="b_title" class="form_control"/></td>
								</tr>
								<tr>
									<td>글내용</td>
									<td class="text-left"><input type="text" name="b_content" id="b_content" class="form_control"/></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td class="text-left"><input type="text" name="b_pwd" id="b_pwd" class="form_control"/></td>
								</tr>
							</tbody>
						</table>
						<div class="text-right">
							<input type="button" value="저장" id="writeBtn" class="btn btn btn-info"/>
							<input type="button" value="취소" id="cancelBtn" class="btn btn btn-info"/>
						</div>
					</form> -->
		<div class="col-xs-12">
			<div class="text-center"><h3>게시판 입력화면</h3></div>
				<form class="form-horizontal" id="f_writeForm">
	  				<div class="form-group">
	    				<label for="b_name" class="col-sm-2 control-label">작 성 자</label>
	    				<div class="col-sm-10">
	      				<input type="text" class="form-control" id="b_name" name="b_name" placeholder="작성자 입력" maxlength="6" />
				    </div>
				  </div>
				  <div class="form-group">
	    				<label for="b_title" class="col-sm-2 control-label">글 제 목</label>
	    				<div class="col-sm-10">
	      				<input type="text" class="form-control" id="b_title" name="b_title" placeholder="글제목 입력" />
				    </div>
				  </div>
				  <div class="form-group">
	    				<label for="b_content" class="col-sm-2 control-label">글 내 용</label>
	    				<div class="col-sm-10">
	      				<textarea name="b_content" id="b_content" class="form-control" rows="8"></textarea>
				    </div>
				  </div>
				  <div class="form-group">
	    				<label for="b_pwd" class="col-sm-2 control-label">비밀번호</label>
	    				<div class="col-sm-10">
	      				<input type="password" class="form-control" id="b_pwd" name="b_pwd" placeholder="비밀번호 입력" />
				    </div>
				  </div>
				</form>
				<div class="text-right">
					<button type="button" class="btn btn-primary" id="boardInsert">저장</button>
					<button type="button" class="btn btn-primary" id="boardListBtn">목록</button>
				</div>
			</div>
	</body>
</html>
