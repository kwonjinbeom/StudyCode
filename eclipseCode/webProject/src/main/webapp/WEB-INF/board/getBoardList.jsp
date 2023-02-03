<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
		<script type="text/javascript">
			$(function(){
				/* 검색 후 검색 대상과 검색 단어 출력 - 검색여부는 키워드(keyword)의 값 존재여부로 제어 */
				if('${param.keyword}'!=""){
					$('#keyword').val('${param.keyword}');
					$('#search').val('${param.search}');
				}
				/* 입력 양식 enter 제거 또는 검색 기능 부여 */
				$("#keyword").bind("keydown",function(event){
					if(event.keyCode == 13){
						event.preventDefault(); // 아래부분이 주석이면 enter가 입력되어도 아무런 작업을 하지않음
						$("#searchData").click(); // 이 부분 주석 해제하면 검색단어 입력 후 enter로 검색기능 가능하도록 설정.
					}
				})
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function(){
					if($("#serach").val()!="all"){
						if(!chkData("#keyword","검색어를")) return;
					}else if($("#search").val() == "all"){
						$("#keyword").val("");
					}
					$("#f_search").attr({
						"method" : "post",
						"action" : "/board/getBoardList.do"
					});
					$("#f_search").submit();
				})
				
				/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
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
				<div id="boardSearch" class="text-right">
					<form id = "f_search" name ="f_search" class="form-inline">
						<div class="form-group">
						<label>검색조건</label>
						<select id = "search" name="search" class="form-control">
							<option value="all">전체<option>
							<option value="all2">전체조건<option>
							<option value="title">제목<option>
							<option value="content">내용<option>
							<option value="author">작성자<option>
						</select>
						<input type="text" name = "keyword" id ="keyword" placeholder="검색어를 입력하세요" class="form-control"/>
						<button type="button" id="searchData" class = "btn btn-primary">검색</button>
						</div>
					</form>	
				</div>
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