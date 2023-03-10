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
	<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.min.css" />
		
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
				
				
				$("#exam02ListBtn").click(function(){
					$("#exam02ListForm").attr({
						method:"get",
						action:"/sample/exam02List"
					});
					$("#exam02ListForm").submit();
				});
				
				$("#exam02ArrayBtn").click(function(){
					$("#exam02ArrayForm").attr({
						method:"get",
						action:"/sample/exam02Array"
					});
					$("#exam02ArrayForm").submit();
				});
				
				$("#exam02BeanBtn").click(function(){
					$("#exam02BeanForm").attr({
						method:"get",
						action:"/sample/exam02Bean"
					});
					$("#exam02BeanForm").submit();
				});
					
				$("#exam03Btn").click(function(){
					$("#exam03Form").attr({
						method:"get",
						action:"/sample/exam03"
					});
					$("#exam03Form").submit();
				});
				
				$("#jsonBtn").click(function(){
					$.ajax({
						url: "/sample/getExample2",
						type : "get",
						dataType : "json",
						error : function(xhr, textStatus, errorThrown){
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
							
						},
						success : function(resultData){
							let no = resultData.no;
							let name = resultData.name;
							let phone = resultData.phone;
							
							let noLi = $("<li>").html(no);
							let nameLi= $("<li>").html(name);
							let phoneLi = $("<li>").html(phone);
							
							$("#dataArea").append(noLi).append(nameLi).append(phoneLi);
						}
					});
				});
				$("#jsonListBtn").click(function(){
					$("#list").css("display","block");
					$("#listData").html("");
					
					$.getJSON('/sample/getList', function(data){
						$(data).each(function(){
							let no = this.no;
							let name = this.name;
							let phone = this.phone;
							
							let noTd = $("<td>").html(no);
							let nameTd = $("<td>").html(name);
							let phoneTd = $("<td>").html(phone);
							
							let tr = $("<tr>").append(noTd).append(nameTd).append(phoneTd);
							$("#listData").append(tr);
						});
					}).fail(function(xhr, status, errorThrown){
						alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
					});
				});
				
				
			}) // $() ??????
		</script>
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>??? MVC ?????? ??????</h3></div>
			
			<h5>???????????? ?????? ??????</h5>
			<form id = "exam01Form" class ="form-inline">
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-control" name = "name" id = "name" placeholder="?????? ??????" />
				</div>
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-contorl" name = "age" id="age" placeholder="?????? ??????"/>
				</div>
				<button type="button" id="exam01Btn" class="btn btn-success">exam01 ?????? ??????</button>
				<button type="button" id="exam02Btn" class="btn btn-success">exam02 ?????? ??????</button>
			</form>
			
			<h5>???????????? ?????? List ????????? ?????? ??????</h5>
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
				<button type="button" id="exam02ListBtn" class="btn btn-success">exam02ListBtn ?????? ??????</button>
			</form>
		
		
			<h5>???????????? ?????? ??????(Array) ?????? ??????</h5>
			<form id="exam02ArrayForm">
				<label class="checkbox-inline">
					<input type="checkbox" name="hobby" value="??????"> ??????
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" name="hobby" value="??????, ????????? ??????"> ??????, ????????? ??????
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" name="hobby" value="??????"> ??????
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" name="hobby" value="??????"> ??????
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" name="hobby" value="?????? ??????"> ?????? ??????
				</label>
				<button type="button" id="exam02ArrayBtn" class="btn btn-success">exam02Array ?????? ??????</button>
			</form>
			
			<h5> SampleDTOList ??? ?????? ??????</h5>
			<form id="exam02BeanForm" class="form-inline">
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-control" name="list[0].name" id="list[0].name" placeholder="?????? ??????" />
				</div>
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-control" name="list[0].age" id="list[0].age" placeholder="?????? ??????" />
				</div>
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-control" name="list[1].name" id="list[1].name" placeholder="?????? ??????" />
				</div>
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-control" name="list[1].age" id="list[1].age" placeholder="?????? ??????" />
				</div>
				<button type="button" id="exam02BeanBtn" class="btn btn-success">exam02Bean ?????? ??????</button>
			</form>
			
			
			
			<h5> DTO??? ?????? ???????????? ??? ?????? ??????</h5>
			<form id="exam03Form" class="form-inline">
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-control" name="name" placeholder="?????? ??????" />
				</div>
				<div class="form-group">
					<label class="sr-only">??????</label>
					<input type="text" class="form-control" name="age" placeholder="?????? ??????" />
				</div>
				<div class="form-group">
					<label class="sr-only">????????????</label>
					<input type="text" class="form-control" name="number" id="number" placeholder="???????????? ??????" />
				</div>
				<button type="button" id="exam03Btn" class="btn btn-success">exam03 ?????? ??????</button>
			</form>
			
			<h5>XML/JSON ??? ?????? ??????</h5>
			<dl class="dl-horizontal">
				<dt>??????????????? ??????(?????? ?????????)&nbsp;</dt>
				<dd><a href="http://localhost:8080/sample/getText">getText</a></dd>
				
				<dt>??????????????? ??????(xml)&nbsp;</dt>
				<dd><a href="http://localhost:8080/sample/getExample">getExample</a></dd>
				
				<dt>??????????????? ??????(json-1)</dt>
				<dd><a href="http://localhost:8080/sample/getExample2">getExample2</a></dd>
				
				<dt>??????????????? ??????(json-2)</dt>
				<dd><a href="http://localhost:8080/sample/getExample3">getExample3</a></dd>
				
				<dt>??????????????? ??????(json-3)</dt>
				<dd><a href="http://localhost:8080/sample/getList">getList</a></dd>
				
                <dt>get ????????? post ??????</dt>
				<dd><a href="http://localhost:8080/sample/examMethod">???????????? ??????</a></dd>
			</dl> 
			
			<h5>Ajax??????</h5>
			<button type="button" id = "jsonBtn" class= "btn btn-success">json ????????? ??????</button>
			<ul id = "dataArea" class="list-inline"></ul>
			<button type="button" id = "jsonListBtn" class= "btn btn-success">List ????????? ??????</button><br />
			<div class="row col-sm-6" id="list">
				<table class="table table-striped">
				<thead>
					<tr>
						<th>??????</th>
						<th>??????</th>
						<th>?????????</th>
					</tr>
				</thead>
				<tbody id="listData"></tbody>
				</table>
			</div>
		</div>
	</body>
</html>
