<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	border-color: red;
	color: red;
	transition: background-color 0.3s;
	font-size: 14px;
}

.btn-custom:hover {
	background-color: rgb(234, 248, 249);
	border-color: red;
	color: red;
}

.member-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}

.form-group {
	width: 48%;
	display: flex;
	align-items: center;
}

.form-label {
	width: 30%;
	text-align: right;
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
</style>
</head>
<body>
	<h1 class="text-center">수정하기</h1>
	<div style="height: 20px"></div>
	<form action="../admin/sup_update_ok.do" method="post">
	<div class="adminContainer">
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="no">회원번호</label>
				<input type="text" class="form-control" name="no" value="${vo.no }" readonly>
			</div>
			<div class="form-group">
				<label class="form-label" for="id">아이디</label>
				<input type="text" class="form-control" name="id" value="${vo.id }" :readonly="!isEditing">
			</div>
			
		</div>
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="name">이름</label>
				<input type="text" class="form-control" name="name" value="${vo.name }" :readonly="!isEditing">
			</div>
			<div class="form-group">
				<label class="form-label" for="nickname">닉네임</label>
				<input type="text" class="form-control" name="nickname" value="${vo.nickname }" :readonly="!isEditing">
			</div>
		</div>
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="birthday">생일</label>
				<input type="text" class="form-control" name="birthday" value="${vo.birthday }" :readonly="!isEditing">
			</div>
			<div class="form-group">
				<label class="form-label" for="sex">성별</label>
				<input type="text" class="form-control" name="sex" value="${vo.sex }" :readonly="!isEditing">
			</div>
		</div>
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="email">이메일</label>
				<input type="text" class="form-control" name="email" value="${vo.email }" :readonly="!isEditing">
			</div>
			<div class="form-group">
				<label class="form-label" for="phone">전화번호</label>
				<input type="text" class="form-control" name="phone" value="${vo.phone }" :readonly="!isEditing">
			</div>
		</div>
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="post">우편번호</label>
				<input type="text" class="form-control" name="post" value="${vo.post }" :readonly="!isEditing">
			</div>
			<div class="form-group">
				<label class="form-label" for="point">포인트</label>
				<input type="text" class="form-control" name="point" value="${vo.point }" :readonly="!isEditing">
			</div>
		</div>
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="addr1">주소</label>
				<input type="text" class="form-control" name="addr1" value="${vo.addr1 }" :readonly="!isEditing">
			</div>
			<div class="form-group">
				<label class="form-label" for="addr2">상세주소</label>
				<input type="text" class="form-control" name="addr2" value="${vo.addr2 }" :readonly="!isEditing">
			</div>
		</div>
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="content">자기소개</label>
				<input type="text" class="form-control" name="content" value="${vo.content }" :readonly="!isEditing">
			</div>
		</div>
		<div class="member-info">
			<div class="form-group">
				<label class="form-label" for="admin">관리자</label>
				<select name="admin" class="select-control" :disabled="!isEditing">
					<option value="n">no</option>
					<option value="y">yes</option>
				</select>
			</div>
		</div>
		<!-- 나머지 정보를 위한 member-info 그룹들 추가 -->
		<div class="text-center">
			<input type="submit" value="수정하기" class="btn btn-custom">
			<input type="button" value="돌아가기" class="btn btn-custom" onclick="javascript:history.back()">
		</div>
	</div>
	</form>	
</body>
</html>