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
		
		$("#go").click(function(){
			const regName = /\s/g;
			if(regName.test($("#mng_no").val()) || $("#mng_no").val() == 0){
				alert("이름을 입력해주세요.")
				$("#mng_no").val("");
				$("#mng_no").focus();
				return;
			}
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
		</table>
		<input type="button" id  = "go" value="전송">&nbsp;&nbsp;
		<input type="reset" value="취소">

	</form>
</body> 
</html>