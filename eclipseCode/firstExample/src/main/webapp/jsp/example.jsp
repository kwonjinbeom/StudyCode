<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>Insert title here</title>
</head>
<body>
	<h2>숫자를 저장한 변수 3개(7,5,9)를 정의하고 최대값 구하기</h2>
	<%
		int a = 7;
		int b = 5;
		int c = 9;
		int max = 0;
		if(a>b && a>c){
			max = a;
		}else{
			if(b>c){
				max = b;
			}else{
				max = c;
			}
		}
	
		System.out.println(max);
	%>
	<p> 최대값은 : <%=max%>
	</p>
	
	<h2>배열의 값(12, 26, 68, 98, 76, 54, 8, 6, 4) 중 최대값과 최소값 구하기</h2>
	<%
		int[] arrayValue = {12, 26, 68, 98, 76, 54, 8, 6, 4};
		int MaxValue = arrayValue[0];
		int MinValue = arrayValue[0];
		for(int i=0; i < arrayValue.length; i++){
			if(MaxValue < arrayValue[i]){
				MaxValue = arrayValue[i];
			}
			if(MinValue > arrayValue[i]){
				MinValue = arrayValue[i];
			}
		}
		System.out.println(MaxValue);
		System.out.println(MinValue);
	%>
	<p> 최대값은 : <%=MaxValue%>, 최소값 : <%=MinValue%>
	</p>
	<h2>문자열 추출하기</h2>
	<% 
		String str = "동해 물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세";
		String text = "닳";
	
	%>
	<p> <%=str%> => <%=str.length()%>이며, '닳'은 <%=str.indexOf('닳')%>번째 있다.</p>
	
	<p> <%=str%>의 15번째 문자는 <%=str.charAt(15) %>이다.</p>
</body>
</html>