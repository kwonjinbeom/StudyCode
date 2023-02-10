<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Insert title here</title>

		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->

		<script type="text/javascript" src="/resources/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#exam01Btn").click(function(){
					$("#exam01Form").attr({
						method:"get",
						action:"/sample/exam01"
					});
					$("#exam01Form").submit();
				});
				
				$("#exam02Btn").click(function(){
					$("#exam01Form").attr({
						method:"get",
						action:"/sample/exam02"
					});
					$("#exam01Form").submit();
				});
				
			})
		</script>
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>웹 MVC 관련 예제</h3></div>
			
			<h5>매개변수 처리 예제</h5>
			<form id = "exam01Form" class ="form-inline">
				<div class="form-group">
					<label class="sr-only">이름</label>
					<input type="text" class="form-control" name = "name" id = "name" placeholder="이름 입력" />
				</div>
				<div class="form-group">
					<label class="sr-only">나이</label>
					<input type="text" class="form-contorl" name = "age" id="age" placeholder="나이 입력"/>
				</div>
				<button type="button" id="exam01Btn" class="btn btn-success">exam01 예제 확인</button>
				<button type="button" id="exam02Btn" class="btn btn-success">exam02 예제 확인</button>
			</form>
		</div>
	</body>
</html>
