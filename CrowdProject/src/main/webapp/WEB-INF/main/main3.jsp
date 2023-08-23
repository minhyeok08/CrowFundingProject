<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 100%;
}

.pagetop {
	/* display: none; */
	padding: 15px 15px;
	background-color: #fff;
	text-decoration: none;
	border-radius: 50%;
	border: 0.3px solid gray;
	position: fixed;
	bottom: 10px;
	right: 10px;
}

.pagetop:hover {
	background-color: #ddd;
	cursor: pointer;
}

.store_poster {
	border-radius: 3px;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

.bordered-thumbnail {
	border: 1px solid;
	border-radius: 8px;
	padding: 10px;
	margin-bottom: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.bordered-thumbnail p {
	font-size: 14px;
	margin: 0;
	padding: 5px 0;
}

.bordered-thumbnail hr {
	margin: 10px 0;
}

.button-container {
	display: flex;
	gap: 10px;
	margin-top: 20px;
	justify-content: center; /* 가로 중앙 정렬 */
}

.bordered-button {
	padding: 10px 20px;
	border: solid;
	border-color: #c8c8c8;
	background-color: white;
	color: black;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.bordered-button:hover {
	background-color: #90c7ba;
}

.bordered-thumbnail:hover {
	background-color: #90c7ba;
}

.col-lg-8 {
	margin-top: 15px;
}

.col-lg-4 {
	margin-top: 15px;
}

.circle-image {
	width: 70px; /* 이미지 크기 설정 */
	height: 70px;
	border-radius: 50%; /* 원 모양으로 만들기 위한 속성 */
	overflow: hidden; /* 이미지 영역을 원 모양으로 자르기 */
}

.circle-image img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* 이미지가 원 안에 맞도록 설정 */
}
</style>
<script src="https://kit.fontawesome.com/f89f2c9cd8.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/vue-infinite-loading@^2/dist/vue-infinite-loading.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div style="height: 80px"></div>
	<div class="container">
		<tiles:insertAttribute name="fund_subheader"/>
		<div class="row">
			<div class="col-lg-8">
				<tiles:insertAttribute name="home"/>
			</div>
			<div class="col-lg-4">
				<tiles:insertAttribute name="fund_sidebar"/>
			</div>		
		</div>
	</div>
	<tiles:insertAttribute name="footer"/>
	<a href="#" class="pagetop" id="top"><i class="fa-solid fa-chevron-up fa-2xl" style="color: #a6d8ce;"></i></a>
</body>
</html>