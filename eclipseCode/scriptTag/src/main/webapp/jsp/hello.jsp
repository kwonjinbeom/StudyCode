<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar" %>
<%!
	/* ���� ���ϴ� �޼��� */
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
	<h1>JSP ������ ����</h1>
	<p>JSP ������ �ݵ�� ���� ���Ϸ� ��ȯ�ȴ�.</p>
	<p>���� ������ Ŭ���� ���Ϸ� �����ϵȴ�.</p>
	<p>�����ϵ� ������ �ٽ� �޸𸮿� ����ǰ� �ν��Ͻ� ���� �� jspService() �޼��带 ȣ���Ͽ� ����ڿ��� �����ϰ� �ȴ�.</p>

	<h4>JSP�� ������ ������ - ���� �Է¹޾� �ش��ϴ� �ܸ� ���1</h4>
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
	<h4>JSP�� ������ ������ - ���� �Է¹޾� �ش��ϴ� �ܸ� ���2</h4>
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
		// ���� ������ ���ϴ� �޼���
		public double getArea(double r){
			return r * r * 3.14;
	}
	 %>
	 <!-- ���� �±״� �������� �޼����� �����̳� ��������� �����ϰ��� �� �� ���. -->
	 �������� <%= radius %>��
	 ���� ������ <%= getArea(radius) %>�̴�.
	 
	 <%!
	 	char getKorDay(){
		 char result = ' ';
		 int day = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
		 switch(day){
		 case 1 : result = '��'; break;
		 case 2 : result = '��'; break;
		 case 3 : result = 'ȭ'; break;
		 case 4 : result = '��'; break;
		 case 5 : result = '��'; break;
		 case 6 : result = '��'; break;
		 case 7 : result = '��'; break;
		 
		 }
		 return result;
	 }
	 %>
	<p>������ <%= getKorDay() %>�����Դϴ�.</p>
	 
	<p>
	 	<% int i = 0; %>
		<label>[��������] i = <%= ++i %></label>
	</p>
	<p>
		<label>[��������/�ʵ�] memi = <%= ++memi %></label>
		<%! int memi = 0; %>
	</p>
	<!-- 1���� 10������ �� ���ϱ� (sum �޼��� ����) -->
	<p>
		<%= "1���� 10���� ���� " + sum(1,10) + "�Դϴ�" %>
	</p>

	
</body>
</html>