<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Insert title here</title>

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#insertBtn").click(function(){
					//입력값 체크
					if(!checkForm("#s_num", "학과번호를"))return;
					else if(!checkForm("#s_name","학과명을"))return;
					else{
						$("#insertForm").attr({
							"method" : "get",
							"action":"/subject/subjectInsert"
						});
						$("#insertForm").submit();
					}
					
				});
				$("#cancelBtn").click(function(){
					$("#insertForm").each(function(){
						this.reset();
					})
				})
			/* 	$("#insertBtn").click(function(){
					$("#insertForm").attr({
						method:"get",
						action:"/subject/insertForm"
					});
					$("#insertForm").submit();
				});
				 */
			}) // $() 종료
		</script>
	</head>
	<body>
	
<!-- 		<h5> insertForm화면</h5>
			<form id="insertForm" class="form-inline">
				<div class="form-group">
					<label class="sr-only">번호</label>
					<input type="text" class="form-control" name="no" placeholder="번호 입력" />
				</div>
				<div class="form-group">
					<label class="sr-only">학과번호</label>
					<input type="text" class="form-control" name="n_num" placeholder="학과번호 입력" />
				</div>
				<div class="form-group">
					<label class="sr-only">학과명</label>
					<input type="text" class="form-control" name="n_name" placeholder="학과명 입력" />
				</div>
				<button type="button" id="insertBtn" class="btn btn-success">제출</button>
			</form> -->
			<div class="col-xs-12">
				<div class="text-center"><h5>학과테이블등록</h5></div>
					<form id="insertForm" name ="insertForm" class="form-horizontal">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td>학과번호</td>
									<td class="text-left"><input type="text" name="s_num" id="s_num" class="form_control"/></td>
								</tr>
								<tr>
									<td>학과명</td>
									<td class="text-left"><input type="text" name="s_name" id="s_name" class="form_control"/></td>
								</tr>
							</tbody>
						</table>
						<div class="text-right">
							<input type="button" value="저장" id="insertBtn" class="btn btn btn-info"/>
							<input type="button" value="취소" id="cancelBtn" class="btn btn btn-info"/>
						</div>
					</form>
				</div>
	</body>
</html>
