<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#go").click(function(){
			/* const regName = /\s/g; */
			if($("#mng_no").val() == 0){
				alert("이름을 입력해주세요.")
				$("#mng_no").val("");
				$("#mng_no").focus();
				return;
			}else if($("#local_nm").val() == 0){
				alert("지역명을 입력해주세요.")
				$("#local_nm").val("");
				$("#local_nm").focus();
				return;
			}else if($("#type").val() == 0){
				alert("타입(분류)를 입력해주세요.")
				$("#type").val("");
				$("#type").focus();
				return;
			}else if($("#nm").val() == 0){
				alert("명소명을 입력해주세요.")
				$("#nm").val("");
				$("#nm").focus();
				return;
			}else if($("#nm_sub").val() == 0){
				alert("명소명(부)을 입력해주세요.")
				$("#nm_sub").val("");
				$("#nm_sub").focus();
				return;
			}else if($("#addr").val() == 0){
				alert("명소 주소를 입력해주세요.")
				$("#addr").val("");
				$("#addr").focus();
				return;
			}else if($("#lat").val() == 0){
				alert("위치 정보1을 입력해주세요.")
				$("#lat").val("");
				$("#lat").focus();
				return;
			}else if($("#lng").val() == 0){
				alert("위치 정보2을 입력해주세요.")
				$("#lng").val("");
				$("#lng").focus();
				return;
			}else if($("#description").val() == 0){
				alert("명소 설명을 입력해주세요.")
				$("#description").val("");
				$("#description").focus();
				return;
			}else if($("#list_img").val() == 0){
				alert("이미지를 입력해주세요.")
				$("#list_img").val("");
				$("#list_img").focus();
				return;
			}
			// 형식 :  $("선택자").attr({"속성":"값", "속성":"값"});
			$("#dataForm").attr({
				"method" : "get",
				"action" : "/servletExample/insert"
			}); 
			$("#dataForm").submit();
		})
		
		
	})
</script>
</head>
<body>
	<form name = "dataForm" id="dataForm" action="/servletExample/ChungnamServlet.java">
		<table>
			<tr>
				<td><label>구분 번호 : </label></td>
				<td><input type="text" placeholder="이름 입력" name = "mng_no" id = "mng_no"/></td>
			</tr>
			<tr>
				<td><label>지역명 : </label></td>
				<td><input type="text" placeholder="지역명 입력" name = "local_nm" id = "local_nm"/></td>
			</tr>
			<tr>
				<td><label>타입(분류) : </label></td>
				<td><input type="text" placeholder="타입(분류) 입력" name = "type" id = "type"/></td>
			</tr>
			<tr>
				<td><label>명소명 : </label></td>
				<td><input type="text" placeholder="명소명 입력" name = "nm" id = "nm"/></td>
			</tr>
			<tr>
				<td><label>명소명(부) : </label></td>
				<td><input type="text" placeholder="명소명(부) 입력" name = "nm_sub" id = "nm_sub"/></td>
			</tr>
			<tr>
				<td><label>명소 주소 : </label></td>
				<td><input type="text" placeholder="명소 주소 입력" name = "addr" id = "addr"/></td>
			</tr>
			<tr>
				<td rowspan="2"><label>위치 정보 : </label></td>
				<td><input type="text" placeholder="위치 정보 입력" name = "lat" id = "lat"/></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="위치 정보 입력" name = "lng" id = "lng"/></td>
			</tr>
			<tr>
				<td><label>명소 설명 : </label></td>
				<td><input type="text" placeholder="명소 설명 입력" name = "description" id = "description"/></td>
			</tr>
			<tr>
				<td><label>이미지 : </label></td>
				<td><input type="text" placeholder="이미지 입력" name = "list_img" id = "list_img"/></td>
			</tr>
		</table>
		<input type="button" id  = "go" value="전송">&nbsp;&nbsp;
		<input type="reset" value="취소">

	</form>
</body> 
</html>