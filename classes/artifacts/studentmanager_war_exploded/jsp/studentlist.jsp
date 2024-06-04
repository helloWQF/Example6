<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>学生信息列表</title>

	</head>
	<body>
	<center>
			<table align="center" width="360" border="0">
			<tr>
				<td align="center">
					<h1>学生信息列表</h1>
				</td>
				<td align="center">
				<a href="jsp/studentinsert.jsp">新增</a>
				</td>

<%--				<form onsubmit="uploadFile(); return false;"> <!-- 阻止表单默认提交行为 -->--%>
<%--					&lt;%&ndash;											<label for="excelFile">选择Excel文件:</label>&ndash;%&gt;--%>
<%--					<input type="file" class="btn btn-info 选择" id="excelFile" name="excelFile" accept=".xlsx, .xls"><br>--%>
<%--					<input type="submit" value="导入课表" class="btn btn-info 导入">--%>

<%--				</form>--%>

			<%--	<h2>批量导入文件</h2>
				<form action="../ImportStudentservlet.do" method="post" enctype="multipart/form-data">
					<input type="file" name="file" multiple>
					<input type="submit" value="上传">
				</form>--%>
				<h1>批量导入数据</h1>
				<form action="ImportStudentservlet.do" method="post" enctype="multipart/form-data">
					<input type="file" name="file" accept=".csv, .xls, .xlsx" required>
					<input type="submit" value="上传并导入">
				</form>
			</tr>
		</table>
		<table align="center"  width="660" border="1" cellspacing="0" cellpadding="5" bordercolor="#000">
			<tr>
				<th width="50px">   学号</th>
				<th width="100px">	姓名 </th>
				<th width="50px">	年龄	</th>
				<th width="150px">	班级	</th>
				<th width="50px">	成绩	</th>
				<th width="50px">	修改	</th>
				<th width="50px">	删除	</th>
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
						<a href="UpdateStudentservlet.to?id=${studentitem.id}">修改</a>
					</td>
					<td >
						<a href="showStudent.do?id=${studentitem.id}">删除</a>
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
		formData.append('file', file); // 'file' 是服务器端期望的字段名，可能需要根据你的后端接口调整

		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'http://localhost:8080/jspm0afw5/kechengbiao/import', true);
		// xhr.setRequestHeader("Token",window.sessionStorage.getItem("token"))
		xhr.onload = function () {
			if (this.status === 200) {
				alert('课表导入成功');
				// getDataList();
			} else {
				var error = new Error('课表导入失败');
				error.status = this.status;
				console.error(error);
				alert('课表导入失败，请选择文件');
			}
		};

		xhr.onerror = function () {
			alert('导入过程中发生错误');
		};

		// 发送请求
		xhr.send(formData);
	}
</script>
	</body>
</html>

