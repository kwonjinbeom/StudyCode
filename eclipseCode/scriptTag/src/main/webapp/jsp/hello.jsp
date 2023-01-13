<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar" %>
<%!
	/* 합을 구하는 메서드 */
	public int sum(int start, int end){
		int result = 0;
		for (int i = start; i <= end; i++){
			result += i;
		}
		return result;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP 페이지 실행</h1>
	<p>JSP 파일은 반드시 서블릿 파일로 변환된다.</p>
	<p>서블릿 파일은 클래스 파일로 컴파일된다.</p>
	<p>컴파일된 파일은 다시 메모리에 적재되고 인스턴스 생성 후 jspService() 메서드를 호출하여 사용자에게 응답하게 된다.</p>

	<h4>JSP로 구현된 구구단 - 단을 입력받아 해당하는 단만 출력1</h4>
	<%
	int dan = 5;
	if(request.getParameter("dan") != null){
		dan = Integer.parseInt(request.getParameter("dan"));
	}	
	
	if(dan>=1 && dan <= 9){
		for (int i = 1; i<=9; i++){
			out.println(dan+" x " + i + "=" +  (dan*i) + "<br />");
		}
	}
	%>
	<h4>JSP로 구현한 구구단 - 단을 입력받아 해당하는 단만 출력2</h4>
	<%
	if(dan>=1 && dan<=9){
		for(int i = 1; i<=9; i++){
	%>
		<%= dan %> x <%=i %> = <%=dan*i %><br />
	<%
		}
	}
	%>
	
	<%!double radius = 4.8; %>
	<%!
		// 원의 면적을 구하는 메서드
		public double getArea(double r){
			return r * r * 3.14;
	}
	 %>
	 <!-- 위의 태그는 선언문으로 메서드의 선언이나 멤버변수를 정의하고자 할 때 사용. -->
	 반지름이 <%= radius %>인
	 원의 면적은 <%= getArea(radius) %>이다.
	 
	 <%!
	 	char getKorDay(){
		 char result = ' ';
		 int day = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
		 switch(day){
		 case 1 : result = '일'; break;
		 case 2 : result = '월'; break;
		 case 3 : result = '화'; break;
		 case 4 : result = '수'; break;
		 case 5 : result = '목'; break;
		 case 6 : result = '금'; break;
		 case 7 : result = '토'; break;
		 
		 }
		 return result;
	 }
	 %>
	<p>오늘은 <%= getKorDay() %>요일입니다.</p>
	 
	<p>
	 	<% int i = 0; %>
		<label>[지역변수] i = <%= ++i %></label>
	</p>
	<p>
		<label>[전역변수/필드] memi = <%= ++memi %></label>
		<%! int memi = 0; %>
	</p>
	<!-- 1부터 10까지의 합 구하기 (sum 메서드 선언) -->
	<p>
		<%= "1부터 10까지 합은 " + sum(1,10) + "입니다" %>
	</p>

	
</body>
</html>