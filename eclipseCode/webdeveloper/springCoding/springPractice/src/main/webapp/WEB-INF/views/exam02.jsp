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
		<script type="text/javascript">
			$(function(){
				$("#exam02ListBtn").click(function(){
					$("#exam02ListForm").attr({
						method:"get",
						action:"/sample/exam02List"
					});
					$("#exam02ListForm").submit();
				});
				
			})
		</script>
		
	</head>
	<body>
		<div>
			<%-- <label>이름</label> ${sampleDTO.name} <br /> --%>
			<!-- model.addAttribute("dto",dto);이 구문을 주석처리하면 위에 구문으로 사용 가능 -->
			<label>이름</label> ${dto.name} <br />
			<label>나이</label> ${dto.age}
		</div>
		
		<h5>매개변수 값을 List 타입에 대입 예제</h5>
		<form id="exam02ListForm">
			<label class="checkbox-inline">
				<input type="checkbox" name ="language" value="java">java
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name ="language" value="jsp">jsp
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name ="language" value="oracle">oracle
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name ="language" value="spring">spring
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name ="language" value="jquery">jquery
			</label>
			<button type="button" id="exam02ListBtn" class="btn btn-success">exam02ListBtn 예제 확인</button>
		</form>
		
	</body>
</html>
