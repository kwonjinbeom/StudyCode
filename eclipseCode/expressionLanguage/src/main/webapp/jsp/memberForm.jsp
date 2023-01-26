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

<style type="test/css">
	table{width:600px;margin:0px;auto;}
	input[type="text"], input[type="password"]{width:250px;}
	td{padding:5px;}
	.text-left{text-align:left;}
	.text-center{text-align:center;}
</style>

<script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#submitBtn").click(function(){
		if(!chkData('#id', "아이디를")) return;
		else if (!chkData('#pwd', "비밀번호를")) return;
		else if (!chkData('#name', "이름을")) return;
		else if (!chkData('#email', "이메일을")) return;
		else if (!chkData('#zipcode', "우편번호를")) return;
		else if (!chkData('#city', "주소를")) return;
		else{
			$("#frm").attr({
				"method":"post",
				"action" :"/expressionLanguage/member"
			});
			$("#frm").submit();
		}
	})
})
</script>

</head>
<body>
	<h1 class="text-center">회원 정보 입력</h1>
	<form name="frm" id="frm">
		<table class="text-center">
			<colgroup>
				<col width="200" />
				<col width="400" />
			</colgroup>
		    <tr>
		       <td>아이디</td>
		       <td class="text-left"><input type="text" name="id" id="id" /></td>
		    </tr>
		    <tr>
		        <td>비밀번호</td>
		        <td class="text-left"><input type="password" name="pwd" id="pwd" /></td>
		    </tr>
		    <tr>
		        <td>이름</td>
		        <td class="text-left"><input type="text" name="name" id="name" /></td>
		    </tr>
		    <tr>
		        <td>이메일</td>
		        <td class="text-left"><input type="text" name="email" id="email" /></td>
		    </tr>
		    <tr>
		        <td>우편번호</td>
		        <td class="text-left"><input type="text" name="zipcode" id="zipcode" /></td>
		    </tr>
		    <tr>
		        <td>주소</td>
		        <td class="text-left"><input type="text" name="city" id="city" /></td>
		    </tr>
		    <tr>
		        <td colspan="2" class="text-center">
					<button type="button" id="submitBtn">가입하기</button>
					<button type="reset">다시입력</button>
		  		</td>
		    </tr>
		</table>
	</form>

</body>
</html>