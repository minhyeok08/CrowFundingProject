<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.carousel-item {
	width: 100%;
	height: 540px;
}
.carousel-inner {
	margin: 0px 0px 20px 0px;
}
</style>
</head>
<body>
	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../images/crowd-banner01.jpg" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="../images/crowd-banner02.jpg" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="../images/crowd-banner03.jpg" class="d-block w-100">
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	<div class="row">
		<div class="text-center">
			<a href="../main/main.do" class="btn btn-sm btn-danger">믿고 보는 맛집
				리스트</a> <a href="../main/main.do?cno=2" class="btn btn-sm btn-success">지역별
				인기 맛집 리스트</a> <a href="../main/main.do?cno=3"
				class="btn btn-sm btn-warning">메뉴별 인기 맛집 리스트</a>
		</div>
	</div>
	<div style="height: 20px"></div>
	<div class="row">
		<c:forEach var="vo" items="${ list }" varStatus="s">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="../food/food_list.do?cno=${ vo.cno }"> <img
						src="${ vo.poster }" style="width: 100%">
					</a>
					<div class="caption">
						<p>${ vo.title }</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>