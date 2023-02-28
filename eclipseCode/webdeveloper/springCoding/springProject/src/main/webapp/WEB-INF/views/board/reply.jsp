<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/common.jspf" %>   
	<style>
		#item-template{display:none;}
		.inline{disply:lnline-block;}
	</style>
	<script type="text/javascript">
		let message = "작성 시 입력한 비밀번호를 입력해 주세요.", btnKind="";
	$(function(){
		$("form[name='pwdForm']").hide();
		
		/* 기본 덧글 목록 불러오기 */
		 let b_num = ${detail.b_num};
		 listAll(b_num);
		
		
		/* $("[data-btn=upBtn]").click(function(){
			 console.log("hello");
		 }) */
		
		 /* 글입력을 위한 Ajax 연동 처리 */
		 //$("#replyFormBtn").click(function(){
		 $(document).on("click", "#replyInsertBtn", function(){
			 let insertUrl = "/replies/replyInsert";
			 /* JSON.stringify(): JAvaScript 값이나 객체를 JSON 문자열로 변환. */
			 let value= JSON.stringify({
				 b_num : b_num,
				 r_name:$("#r_name").val(),
				 r_pwd:$("#r_pwd").val(),
				 r_content:$("#r_content").val()
			 });
			 
			 $.ajax({
					url  : insertUrl,
					type : "post",
					headers : {
						"Content-Type":"application/json"
					},
					dataType:"text",
					data : value,
					error 	: function(xhr, textStatus, errorThrown) {
						alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				    },
				    beforeSend	: function() {
				    	 if(!checkForm("#r_name", "작성자를")) return false;
				    	else if(!checkForm("#r_pwd", "비밀번호를")) return false;
				    	else if(!checkForm("#r_content", "댓글내용을")) return false; 
				    },
				    success : function(result){
				    	if(result=="SUCCESS"){
				    		alert("댓글 등록이 완료되었습니다.");
				    		dataReset();
				    		listAll(b_num);
				    	}
				    }
				});
		 });
		 
		 /* 수정 및 삭제 전 비밀번호 화면 출력을 위한 처리 */
		 $(document).on("click", "button[data-btn]", function(){
			dataReset();
			$("form[name='pwdForm']").show();
			let $pwdView = $("#pwdForm").clone().removeAttr('id');
			$("form.")
		 })
		 }
	});
	 
	/* 댓글 목록 보여주는 함수 */
		function listAll(b_num){
			$(".reply").detach(); // detach(): 선택한 요소를 DOM 트리에서 삭제
			
			let url = "/replies/all/"+b_num; // /replies/all/2
			
			$.getJSON(url, function(data){
				$(data).each(function(){
					let r_num = this.r_num;
					let r_name = this.r_name;
					let r_content = this.r_content;
					let r_date = this.r_date;
					r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
					template(r_num, r_name, r_content, r_date);
				});
			}).fail(function(){
				alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.")				
			})
		
	}
	/* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
		function template(r_num, r_name, r_content, r_date){
			let $div = $('#reviewList');
			
			let $element= $('#item-template').clone().removeAttr('id');
			$element.attr("data-num", r_num); //<div data-num="1" class="panel" panel-success reply">
			$element.addClass("reply");
			$element.find('.panel-heading > .panel-title > .name').html(r_name);
			$element.find('.panel-heading > .panel-title > .date').html(" / " + r_date);
			$element.find('.panel-body').html(r_content);
			
			$div.append($element);
		}
	</script>
</head>
	<body>
		<div id="replyContainer">
			<!-- 댓글 입력 화면 -->
			<form id = "replyForm" class="form-inline">
				<table class="table table-bordered">
					<tr class="success">
						<td class="col-md-3">작성자</td>
							<td class="col-md-3"><input type="text" name="r_name" id="r_name" class="form-control"></td>
						<td class="col-md-3">비밀 번호</td>
						<td class="col-md-3"><input type="password" name="r_pwd" id="r_pwd" class="form-control">
							<input type="hidden" name="b_num" value= "${detail.b_num}">
						</td>
					</tr>
					<tr class="success">
						<td class="col-md-3">댓글 내용</td>
						<td class="col-md-3"><textarea name="r_content" id="r_content" class="form-control"></textarea></td>
					</tr>
					<tr class="success">
						<td class="col-md-3">
							<button id = "replyInsertBtn" class="btn btn-default gap">저장</button>
						</td>
					</tr>
				</table>
			</form>
			<!-- 비밀번호 확인 -->
			<form name = "pwdForm" id = "pwdForm" class="form-inline inline passwdArea">
				<div class="form-group">
					<label for = "passwd">비밀번호 : </label>
					<input type="password" name="passwd" class="form-control passwd gap" />
				</div>
				<button type="button" class="btn btn-default pwdCheckBtn gap">확인</button>
				<button type="button" class="btn btn-default pwdResetBtn gap">취소</button>
				<span class="msg"></span>
			</form>
			<!-- 리스트 영역 -->
			<div id="reviewList">
				<div id="item-template" class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="name"></span>
							<span class="date"></span>
							<button type="button" data-btn="upBtn" class="btn btn-default gap">수정하기</button>
							<button type="button" data-btn="delBtn" class="btn btn-default gap">삭제하기</button>
						</h3>
					</div>
					<div class="panel-body"></div>
				</div>
			</div>
		</div>
	</body>
</html>