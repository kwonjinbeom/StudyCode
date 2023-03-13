<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/common.jspf" %> 
	<script>
		$(function(){
			let errorMsg = "${errorMsg}";
			if(errorMsg!=""){
				alert(errorMsg);
				errorMsg="";
			}
			$("#loginBtn").click(function(){
				if(!chkData("#a_id","아이디를")) return;
				else if(!chkData("#a_pwd", "비밀번호를")) return;
				else{
					$("#loginForm").attr({
						"method":"post",
						"action":"/admin/login"
					});
					$("#loginForm").submit();
				}
			})
		})
	</script>

<div class="container">
	<form class="form-signin" id="loginForm">
		<h2 class="form-signin-heading">관리자 로그인</h2>
		<label for="a_id" class="sr-only">아이디</label>
		<input type="text" id="a_id" name ="a_id" class="form-control" placeholder="아이디">
		
		<label for = "inputPassword" class="sr-only">Password</label>
		<input type="password" id="a_pwd" name="a_pwd" class="form-control" placeholder="비밀번호">
		<button class="btn btn-lg btn-primary btn-block" type="button" id="loginBtn">로그인</button>
	</form>
</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
	</body>