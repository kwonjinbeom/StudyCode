<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
		<script type="text/javascript">
			$(function(){
				/* 글쓰기 버튼 클릭 시 처리 이벤트 */		
				$("#writeForm").click(function(){
					//console.log("글쓰기 버튼 클릭");
					location.href = "/board/insertForm.do";
				});
				$(".goDetail").click(function(){
					//let num = $(this).parents("tr").children().eq(0).html();
					// 이벤트가 발생한 자기 자신. 자신을 포함한 부모 요소중 tr을 찾아 trdㅢ 속성인 data-num의 값을 읽ㅇ옴
					let num = $(this).parents("tr").attr("data-num");
					//console.log("num = "+num);
					
					location.href="/board/detailBoard.do?num="+num;
				})
			});
		</script>	
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>게시판 리스트</h3></div>

			<%-- =================== 리스트 시작  ================== --%>
			<div id="boardList">
				<table summary="게시판 리스트" class="table">
					<thead>
						<tr>
						   <th class="col-md-1 text-center">번호</th>
						   <th class="col-md-6 text-center">제목</th>
						   <th class="col-md-2 text-center">작성자</th>
						   <th class="col-md-2 text-center">날짜</th>
						   <th class="col-md-1 text-center">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty list}" >
								<c:forEach var="vo" items="${list}">
									<tr class="text-center" data-num="${vo.num}">
									   <td>${vo.num}</td>
									   <%-- <td class="text-left"><span class="goDetail">${vo.title}</span></td>  --%>
									   <td class="text-left">
										   <c:if test="${vo.repStep>0}"><%-- 답변글이면 --%>
										   		<c:forEach begin="1" end="${vo.repIndent}"><%-- 답변의 계층번호에 따라 공백설정(기본값 공백3칸)--%>
													&nbsp;&nbsp;&nbsp;
						   						</c:forEach>
						   						<img src="/image/re.png" style="width:15px;height:15px;"/><%-- 답변이미지 출력 --%>
						   					</c:if>
									   		<span class="goDetail">${vo.title}</span>
									   </td>
									   <td>${vo.author}</td>
									   <td>${vo.writeday}</td>
									   <td>${vo.readcnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="5" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
							</c:otherwise>
						</c:choose>		
					</tbody>
				</table>
			</div>
			
			<%-- ================ 글쓰기 버튼 출력 시작 =============== --%>
			<div class="contentBtn text-right">
				<button type="button" id="writeForm"  class="btn btn-primary btn-sm">글쓰기</button>
			</div>
		</div>
	</body>
</html>