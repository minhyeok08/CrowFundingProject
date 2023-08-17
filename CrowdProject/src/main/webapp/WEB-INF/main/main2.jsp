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
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}
</style>
<script src="https://kit.fontawesome.com/f89f2c9cd8.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div style="height: 60px"></div>
	<div class="row">
	<tiles:insertAttribute name="sidebar"/>
	<tiles:insertAttribute name="home"/>
	</div>
	<tiles:insertAttribute name="footer"/>
	<a href="#" class="pagetop" id="top"><i class="fa-solid fa-chevron-up fa-2xl" style="color: #a6d8ce;"></i></a>
</body>
</html>