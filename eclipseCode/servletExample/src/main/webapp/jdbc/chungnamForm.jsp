<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("input[type='button']").click(function(){
			const regName = /\s/g;
			if(regName.test($("#mng_no").val()) || $("#mng_no").val() == 0){
				alert("이름을 입력해주세요.")
				$("#mng_no").val("");
				$("#mng_no").focus();
				return;
			}/* else if($("#local_nm").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#local_nm").val("");
				$("#local_nm").focus();
				return;
			}
			}else if($("#type").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#type").val("");
				$("#type").focus();
				return;
			}
			}else if($("#nm").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#nm").val("");
				$("#nm").focus();
				return;
			}
			}else if($("#nm_sub").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#nm_sub").val("");
				$("#nm_sub").focus();
				return;
			}
			}else if($("#addr").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#addr").val("");
				$("#addr").focus();
				return;
			}
			}else if($("#lat").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#lat").val("");
				$("#lat").focus();
				return;
			}
			}else if($("#lng").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#lng").val("");
				$("#lng").focus();
				return;
			}
			}else if($("#description").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#description").val("");
				$("#description").focus();
				return;
			}
			}else if($("#list_img").val().replace(/\s/g,"")==""){
				alert("주소를 입력해주세요.");
				$("#list_img").val("");
				$("#list_img").focus();
				return;
			} */
			
			/* 폼에 속성을 추가하는 작업 - 1 */
			/* $("#dataForm").attr("method","post");
			$("#dataForm").attr("action","/setvletExample/getData");
			$("#dataForm").submit(); */
			
			/* $("#dataForm").attr("method","post").attr("action","/setvletExample/getData");
			$("#dataForm").submit(); */
			
			
			
			// 형식 :  $("선택자").attr({"속성":"값", "속성":"값"});
			$("#dataForm").attr({
				"method" : "get",
				"action" : "/servletExample/ChungnamServlet"
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
				<td><input type="text" placeholder="주소 입력" name = "local_nm" id = "local_nm"/></td>
			</tr>
			<tr>
				<td><label>타입(분류) : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "type" id = "type"/></td>
			</tr>
			<tr>
				<td><label>명소명 : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "nm" id = "nm"/></td>
			</tr>
			<tr>
				<td><label>명소명(부) : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "nm_sub" id = "nm_sub"/></td>
			</tr>
			<tr>
				<td><label>명소 주소 : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "addr" id = "addr"/></td>
			</tr>
			<tr>
				<td><label>위치 주소 : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "lat" id = "lat"/></td>
			</tr>
			<tr>
				<td><label>위치 정보 : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "lng" id = "lng"/></td>
			</tr>
			<tr>
				<td><label>명소 설명 : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "description" id = "description"/></td>
			</tr>
			<tr>
				<td><label>이미지 : </label></td>
				<td><input type="text" placeholder="주소 입력" name = "list_img" id = "list_img"/></td>
			</tr>
		</table>
		<input type="button" value="전송">&nbsp;&nbsp;
		<input type="reset" value="취소">

	</form>
</body>
</html>