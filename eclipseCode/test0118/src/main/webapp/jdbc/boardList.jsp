<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.board.Board" %>
<%	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	int counter = list.size();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>boardList.jsp</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/test0118/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				// 학과 정보 등록 버튼 제어 
				$("#boardInsert").click(function(){
					location.href="<%=request.getContextPath()%>/jdbc/boardForm.jsp";
				});
			});
		</script>
	</head>
	<body>
		<div id="boardList">
			<div class="tr"><input type="button" value="정보등록" id="boardInsert" /></div>
			<table>
				<thead>
					<tr>
				        <th>게시판 번호</th>
						<th>게시판 작성자</th>
						<th>게시판 제목</th>
						<th>게시판 내용</th>
						<th>게시판 작성일</th>
				    </tr>
				</thead>
				<tbody>	
				<% if (counter > 0) { 
					for( Board sub : list ) {
					/* for(int i=0; i<counter;i++){
						SubjectVO sub = list.get(i); */
				%>
					    <tr class="tc" data-no="<%= sub.getBoardNum() %>">
					    	<td><%= sub.getBoardNum()%></td>
					        <td><%= sub.getBoardWriter()%></td>
	       					<td><%= sub.getBoardTitle() %></td>
	       					<td><%= sub.getBoardContent() %></td>
	       					<td><%= sub.getBoardDate() %></td>
					    </tr>
				<%
					}
				   } else{
				%>
						<tr>
							<td colspan="3" class="tc">조회된 board 정보가 존재하지 않습니다.</td>
						</tr>
				<% } %>
				</tbody>
			</table>
		</div>

	</body>
</html>