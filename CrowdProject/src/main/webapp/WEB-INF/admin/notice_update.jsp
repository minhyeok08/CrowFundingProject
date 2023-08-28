<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.adminContainer {
	margin: 0px auto;
	width: 800px;
}

.btn-custom {
	background-color: transparent;
	border-color: #00b2b2;
	color: #00b2b2;
	transition: background-color 0.3s;
	font-size: 14px;
}

.btn-custom:hover {
	background-color: rgb(234, 248, 249);
	border-color: #00b2b2;
	color: #00b2b2;
}

.form-group {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.form-label {
	width: 20%;
	text-align: center;
	margin-right: 1em;
}

.form-control {
	flex: 1;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

.form-control:focus {
	border-color: #00b2b2;
	outline: 0;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(0, 178, 178, 0.6);
}

.select-control {
	flex: 1;
	padding: 6px 12px;
	font-size: 14px;
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	appearance: none;
	-webkit-appearance: none;
	background: url('dropdown-arrow.png') no-repeat right;
	background-size: 16px;
	background-position: calc(100% - 8px) center;
	width: 50%; /* 크기 조정 */
}

.radio-group {
	display: flex;
	align-items: center;
}

.radio-group label {
	margin-right: 15px;
}

</style>
</head>
<body>
	<h1 class="text-center">공지수정</h1>
	<div style="height: 20px"></div>
	<div class="adminContainer">
		<form method="post" action="../admin/notice_update_ok.do">
			<div class="form-group">
				<label class="form-label" for="writer">이름</label>
				<input type="text" name="writer" class="form-control" value=${vo.writer } size="20">
				<input type="hidden" name="wnno" value=${vo.wnno }>
			</div>
			<div class="form-group">
				<label class="form-label" for="subject">제목</label>
				<input type="text" name="subject" class="form-control" value=${vo.subject } size="50">
			</div>
			<div class="form-group">
				<label class="form-label" for="content">내용</label>
				<textarea rows="10" cols="52" name="content" class="form-control" id="content">${vo.content}</textarea>
			</div>
			<div class="form-group">
				<label class="form-label" for="state">중요공지</label>
				<select name="state" class="select-control">
					<option value="yes">yes</option>
					<option value="no">no</option>
				</select>
			</div>
			<div class="form-group">
				<label class="form-label">타입</label>
				<div class="radio-group">
					<label>
						<input type="radio" name="category" value="event" checked>이벤트
					</label>
					<label>
						<input type="radio" name="category" value="notice">공지사항
					</label>
					<label>
						<input type="radio" name="category" value="news">보도자료
					</label>
				</div>
			</div>
			<div class="text-center">
				<input type="submit" value="수정하기" class="btn btn-custom">
				<input type="button" value="취소" class="btn btn-custom" onclick="javascript:history.back()">
			</div>
		</form>
	</div>
</body>
</html>
