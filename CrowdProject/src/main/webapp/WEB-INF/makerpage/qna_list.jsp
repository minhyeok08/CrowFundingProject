<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.makerpagemainrow{
	border: 2px solid #a6d8ce;
	height: 900px;
	overflow-y: auto;
	
}
#qnatable{
	width: 1000px;
	height: 700px;
	border: 2px solid #a6d8ce;
	margin: 0px auto;
}
</style>
</head>
<body>
<div class="makerpagemainrow">
	<div style="height: 50px;"></div>
	<h2 class="text-center">고객 문의</h2>
	<div id="qnatable">
		<table class="table">
			<tr>
				<td class="inline text-end">
			        <select ref="wfno" v-model="fdno">
			            <option value="1">제목</option>
			            <option value="2">프로젝트명</option>
			            <option value="3">제목+내용</option>
			        </select>
			    </td>
			</tr>
		</table>
	</div>	
</div>
</body>
</html>