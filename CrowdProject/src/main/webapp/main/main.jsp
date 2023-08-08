<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 960px;
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
</style>
<script src="https://kit.fontawesome.com/f89f2c9cd8.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="height: 60px"></div>
	<div>
		<jsp:include page="${ main_jsp }"></jsp:include>
	</div>
	<a href="#" class="pagetop" id="top"><i class="fa-solid fa-chevron-up fa-2xl" style="color: #a6d8ce;"></i></a>
</body>
</html>