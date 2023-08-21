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
	<h2 class="text-center">새소식</h2>
	<div id="newstable">
		<table class="table">
			<tr>
				<td class="inline text-start">
					<a href="../makerpage/makerpage_news_insert.do" class="btn btn-sm btn-project">새글</a>
				</td>
				<td class="inline text-end">
					<input type="text" size=30>
					<input type="button" class="btn btn-sm btn-project" value="검색">
				</td>
			</tr>
		</table>
		<table class="table">
		 	<tr>
				<th width="10%" class="text-center">번호</th>
				<th width="40%" class="text-center">제목</th>
				<th width="20%" class="text-center">프로젝트명</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="10%" class="text-center">조회수</th>
			</tr>
		</table>
	</div>
</div>
</body>
</html>