<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container1 {
	width: 800px;
}
</style>
</head>
<body>
	<div class="container container1">
		<div class="col-sm-8">
			<hr>
			<div class="text-center">친구 목록 가로 출력(이미지 포함)</div>
			<hr>
			<div class="row">
				<h1></h1>
				<div class="col-md-12">
					<div class="thumbnail">
						<a href="#" target="_blank"> <img src="profileImage.do"
							style="width: 100%">
							<div class="caption">
								<p style="font-size: 12px">사진</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<a href="../wasta/insert.do">프로필 입력</a> <a
				href="../wasta/test.do?id=hong">test</a>
		</div>
	</div>

</body>
</html>
