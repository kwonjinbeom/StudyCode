<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			/* 글쓰기 버튼 클릭 시 처리 이벤트 */
			$("#insertFormBtn").click(function(){
				location.href="/board/writeForm";
			});
			
			$(".goDetail").click(function(){
				//let num = $(this).parents("tr").children().eq(0).html();
				// 이벤트가 발생한 자기 자신. 자신을 포함한 부모 요소중 tr을 찾아 trdㅢ 속성인 data-num의 값을 읽ㅇ옴
				let num = $(this).parents("tr").attr("data-num");
				//console.log("num = "+num);
				
				location.href="/board/boardDetail?num="+num;
			})
		}); // $ 함수 종료문
	</script>
</head>
<body>
	<div class="contentContainer container">
		<div class="contentTit page-header"><h3 class="text-center">게시판 리스트</h3></div>
		
		<%-- ==========리스트시작================== --%>
		<div id="boardList" class="table-height"> 
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr>
						<th data-value="b_num" class="order text-center col-md-1">글번호</th>
						<th class="text-center col-md-4">글제목</th>
						<th class="text-center col-md-2">작성자</th>
						<th data-value="b_date" class="order col-md-1">작성일</th>
					</tr>
				</thead>
				<tbody id="list" class="table-striped">
					<!--데이터 출력 -->
					<c:choose>
						<c:when test="${not empty boardList}">
							<c:forEach var="board" items="${boardList}" varStatus="status">
								<tr class="text-center" data-num="${board.b_num}">
									<td>${board.b_num}</td>
									<td class="goDetail text-left">${board.b_title}</td>
									<td class="name">${board.b_name}</td>
									<td class="text-left">${board.b_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				
				</tbody>
			</table>
		</div>
		<!-- ========리스트 종료 ==================== -->
		
		<!-- ========글쓰기 버튼 출력 시작==================== -->
		<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn btn-info"/>
	</div>
	
</body>

