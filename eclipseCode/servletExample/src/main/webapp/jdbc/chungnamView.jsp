<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList,com.chungnam.ChungnamVO"%>
<%
	ArrayList<ChungnamVO> list = (ArrayList<ChungnamVO>)request.getAttribute("list");
	int counter =list.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chungnam 정보 리스트 예제</title>
<link rel='stylesheet' type='text/css' href='/servletExample/css/chungnam.css' />
<link rel='icon' href='data:,'>
<script type='text/javascript' src='/servletExample/js/jquery-3.6.2.min.js'></script>
<script type='text/javascript'>
	$(document).on('click','#delBtn',function(){
		const mngVal = $(this).parents('li').data('no');
		location.href='delete?mng_no='+mngVal;
	})
</script>



</head>
<body>
	<h1 class='title'>충남관광 - 관광명소</h1>
	<div class='btn'><a href='/servletExample/jdbc/chungnamForm.jsp'>정보등록</a></div>
	<ul id='list'>
	<%
	if (counter > 0) {
		// for(int i=0; i < counter; i++) { // 인덱스 접근 시
		// ChungNamVO cvo = list.get(i);
		for( ChungnamVO cvo : list ) {
			out.println("<li class='item' data-no='" + cvo.getMng_no() + "'>");
			out.println("<span class='item-thumb'><img src='" + cvo.getList_img() + "' /></span>");
			out.println("<span class='text'>");
			out.println("<span class='item-type'>" + cvo.getType() + "</span>");
			out.println("<span class='item-title'>" + cvo.getNm());
			out.println("<input type='button' value ='삭제' id = 'delBtn'>");
			out.println("</span>");
			out.println("<span class='item-sub'>" + cvo.getNm_sub() + "</span>");
			out.println("<span class='item-content'>" + cvo.getDescription() + "</span>");

			out.println("</li>");
		}
	}
	%>
	</ul>
</body>
</html>