<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>ѧ����Ϣ�б�</title>

	</head>
	<body>
	<center>
			<table align="center" width="360" border="0">
			<tr>
				<td align="center">
					<h1>ѧ����Ϣ�б�</h1>
				</td>
				<td align="center">
				<a href="jsp/studentinsert.jsp">����</a>
				</td>

<%--				<form onsubmit="uploadFile(); return false;"> <!-- ��ֹ��Ĭ���ύ��Ϊ -->--%>
<%--					&lt;%&ndash;											<label for="excelFile">ѡ��Excel�ļ�:</label>&ndash;%&gt;--%>
<%--					<input type="file" class="btn btn-info ѡ��" id="excelFile" name="excelFile" accept=".xlsx, .xls"><br>--%>
<%--					<input type="submit" value="����α�" class="btn btn-info ����">--%>

<%--				</form>--%>

			<%--	<h2>���������ļ�</h2>
				<form action="../ImportStudentservlet.do" method="post" enctype="multipart/form-data">
					<input type="file" name="file" multiple>
					<input type="submit" value="�ϴ�">
				</form>--%>
				<h1>������������</h1>
				<form action="ImportStudentservlet.do" method="post" enctype="multipart/form-data">
					<input type="file" name="file" accept=".csv, .xls, .xlsx" required>
					<input type="submit" value="�ϴ�������">
				</form>
			</tr>
		</table>
		<table align="center"  width="660" border="1" cellspacing="0" cellpadding="5" bordercolor="#000">
			<tr>
				<th width="50px">   ѧ��</th>
				<th width="100px">	���� </th>
				<th width="50px">	����	</th>
				<th width="150px">	�༶	</th>
				<th width="50px">	�ɼ�	</th>
				<th width="50px">	�޸�	</th>
				<th width="50px">	ɾ��	</th>
			</tr>
			<c:forEach var="studentitem" items="${studentlist}">
				<tr>
					<td >
						${studentitem.id}
					</td>
					<td >
						${studentitem.name}
					</td>
					<td >
						${studentitem.age}
					</td>
					<td >
						${studentitem.grade}
					</td>
					<td >
						${studentitem.score}
					</td>
					<td >
						<a href="UpdateStudentservlet.to?id=${studentitem.id}">�޸�</a>
					</td>
					<td >
						<a href="showStudent.do?id=${studentitem.id}">ɾ��</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</center>
<script language="application/javascript" type="text/javascript">
	function uploadFile() {
		var fileInput = document.getElementById('excelFile');
		var file = fileInput.files[0];
		var formData = new FormData();
		formData.append('file', file); // 'file' �Ƿ��������������ֶ�����������Ҫ������ĺ�˽ӿڵ���

		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'http://localhost:8080/jspm0afw5/kechengbiao/import', true);
		// xhr.setRequestHeader("Token",window.sessionStorage.getItem("token"))
		xhr.onload = function () {
			if (this.status === 200) {
				alert('�α���ɹ�');
				// getDataList();
			} else {
				var error = new Error('�α���ʧ��');
				error.status = this.status;
				console.error(error);
				alert('�α���ʧ�ܣ���ѡ���ļ�');
			}
		};

		xhr.onerror = function () {
			alert('��������з�������');
		};

		// ��������
		xhr.send(formData);
	}
</script>
	</body>
</html>

