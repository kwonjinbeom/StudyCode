<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("input[type='button']").click(function(){
			const regName = /\s/g;
			if(regName.test($("#mng_no").val()) || $("#mng_no").val() == 0){
				alert("�̸��� �Է����ּ���.")
				$("#mng_no").val("");
				$("#mng_no").focus();
				return;
			}/* else if($("#local_nm").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#local_nm").val("");
				$("#local_nm").focus();
				return;
			}
			}else if($("#type").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#type").val("");
				$("#type").focus();
				return;
			}
			}else if($("#nm").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#nm").val("");
				$("#nm").focus();
				return;
			}
			}else if($("#nm_sub").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#nm_sub").val("");
				$("#nm_sub").focus();
				return;
			}
			}else if($("#addr").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#addr").val("");
				$("#addr").focus();
				return;
			}
			}else if($("#lat").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#lat").val("");
				$("#lat").focus();
				return;
			}
			}else if($("#lng").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#lng").val("");
				$("#lng").focus();
				return;
			}
			}else if($("#description").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#description").val("");
				$("#description").focus();
				return;
			}
			}else if($("#list_img").val().replace(/\s/g,"")==""){
				alert("�ּҸ� �Է����ּ���.");
				$("#list_img").val("");
				$("#list_img").focus();
				return;
			} */
			
			/* ���� �Ӽ��� �߰��ϴ� �۾� - 1 */
			/* $("#dataForm").attr("method","post");
			$("#dataForm").attr("action","/setvletExample/getData");
			$("#dataForm").submit(); */
			
			/* $("#dataForm").attr("method","post").attr("action","/setvletExample/getData");
			$("#dataForm").submit(); */
			
			
			
			// ���� :  $("������").attr({"�Ӽ�":"��", "�Ӽ�":"��"});
			$("#dataForm").attr({
				"method" : "get",
				"action" : "/servletExample/ChungnamServlet"
			});
			$("#dataForm").submit();
		})
	})
</script>
</head>
<body>
	<form name = "dataForm" id="dataForm" action="/servletExample/ChungnamServlet.java">
		<table>
			<tr>
				<td><label>���� ��ȣ : </label></td>
				<td><input type="text" placeholder="�̸� �Է�" name = "mng_no" id = "mng_no"/></td>
			</tr>
			<tr>
				<td><label>������ : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "local_nm" id = "local_nm"/></td>
			</tr>
			<tr>
				<td><label>Ÿ��(�з�) : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "type" id = "type"/></td>
			</tr>
			<tr>
				<td><label>��Ҹ� : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "nm" id = "nm"/></td>
			</tr>
			<tr>
				<td><label>��Ҹ�(��) : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "nm_sub" id = "nm_sub"/></td>
			</tr>
			<tr>
				<td><label>��� �ּ� : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "addr" id = "addr"/></td>
			</tr>
			<tr>
				<td><label>��ġ �ּ� : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "lat" id = "lat"/></td>
			</tr>
			<tr>
				<td><label>��ġ ���� : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "lng" id = "lng"/></td>
			</tr>
			<tr>
				<td><label>��� ���� : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "description" id = "description"/></td>
			</tr>
			<tr>
				<td><label>�̹��� : </label></td>
				<td><input type="text" placeholder="�ּ� �Է�" name = "list_img" id = "list_img"/></td>
			</tr>
		</table>
		<input type="button" value="����">&nbsp;&nbsp;
		<input type="reset" value="���">

	</form>
</body>
</html>