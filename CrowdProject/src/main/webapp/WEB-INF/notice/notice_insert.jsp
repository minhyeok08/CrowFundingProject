<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">글쓰기</h1>
			<div style="height:20px"></div>
			<div class="row">
			<form method="post" action="../notice/insert_ok.do">
				<table class="table">
					<tr>
						<th width=20% class="text-right">이름</th>
						<td width=80%>
							<input type="text" name=writer size=20 class="input-sm">
						</td>
					</tr>
					<tr>
						<th width=20% class="text-right">제목</th>
						<td width=80%>
							<input type="text" name=subject size=50 class="input-sm">
						</td>
					</tr>
					<tr>
						<th width=20% class="text-right">내용</th>
						<td width=80%>
							<textarea rows="10" cols="52" name=content></textarea>
						</td>
					</tr>
					<tr>
						<th width=20% class="text-right">중요공지</th>
						<td width=80%>
							<select name="state">
								<option value="no">no</option>
								<option value="yes">yes</option>
							</select>
						</td>
					</tr>
					<tr>
						<th width=20% class="text-right">타입</th>
						<td width=80%>
							<input type="radio" name="category" value="event">이벤트&nbsp;&nbsp;
							<input type="radio" name="category" value="notice">공지사항&nbsp;&nbsp;
							<input type="radio" name="category" value="news">보도자료
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type=submit value="글쓰기" class="btn btn-sm btn-primary">
							<input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
				</form>
			</div>
	</div>
</body>
</html>