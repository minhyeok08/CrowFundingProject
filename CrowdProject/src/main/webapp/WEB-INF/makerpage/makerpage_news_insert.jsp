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
	height: 1000px;
	margin: auto 0px;
}
#newstable{
	width: 1000px;
	height: 600px;
	border: 2px solid #a6d8ce;
	margin: 0px auto;
}
</style>
</head>
<body>
<div class="row makerpagemainrow">
	<div style="height: 50px;"></div>
	<h2 class="text-center">새소식 등록</h2>
	<div style="height: 30px;"></div>
	<div id="newstable">
		<table class="table">
			<tr>
				<th width="15%" class="text-center success">이름</th>
				<td width="85"><input type=text name=name size=15 class="input-sm"></td> 
			</tr>
			<tr>
				<th width="15%" class="text-center success">제목</th>
				<td width="85"><input type=text name=subject size=50 class="input-sm"></td> 
			</tr>
			<tr>
				<th width="15%" class="text-center success">내용</th>
				<td width="85"><textarea rows="10" cols="50" name="content"></textarea></td> 
			</tr>
		</table>	
	</div>
</div>				
</body>
</html>