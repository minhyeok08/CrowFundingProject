<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container1 {
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="container container1">
		<div class="row">
			<h2>회원 등록</h2>
			<form action="insert_ok.do" method="post"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td><label>이메일: </label> <input type="text" name="email" /><br />
						</td>
					</tr>
					<tr>
						<td><label>아이디: </label> <input type="text" name="id" /><br />
						</td>
					</tr>
					<tr>
						<td><label>비밀번호: </label> <input type="password" name="pwd" /><br />
						</td>
					</tr>
					<tr>
						<td><label>이름: </label> <input type="text" name="name" /><br />
						</td>
					</tr>
					<tr>
						<td><label>전화번호: </label> <input type="text" name="phone" /><br />
						</td>
					</tr>
					<tr>
						<td><label>프로필 사진: </label> <input type="file"
							name="profileImg" value="프로필사진" /><br /></td>
					</tr>
					<tr>
						<td class="text-center">
						<input type="submit" value="회원 등록" class="btn btn-danger"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>