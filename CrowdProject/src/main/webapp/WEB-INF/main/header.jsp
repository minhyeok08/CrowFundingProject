<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav-link .navbar-brand {
	color: black;
}

.navbar {
	padding: 8px 80px 8px 80px;
}

.fa-search {
	position: absolute;
	width: 17px;
	top: 10px;
	right: 12px;
	margin: 0;
}
/* 검색창을 relative position으로 설정하여, 내부 요소들의 위치를 결정할 수 있도록 합니다. */
.search {
	position: relative;
	display: inline-block; /* 이 부분은 필요에 따라 조정할 수 있습니다. */
}

/* 검색 아이콘을 absolute position으로 설정하여 input 요소에 상대적으로 위치하도록 합니다. */
#searchIcon {
	position: absolute;
	right: 10px; /* 아이콘의 오른쪽 여백을 조정할 수 있습니다. */
	top: 50%; /* 아이콘을 수직 중앙에 배치하기 위해 필요한 부분입니다. */
	transform: translateY(-50%); /* 아이콘을 수직 중앙에 배치하기 위해 필요한 부분입니다. */
	pointer-events: none; /* 아이콘은 클릭 이벤트를 받지 않도록 합니다. */
	color: #a6d8ce;
}

/* 검색 인풋 박스의 배경색을 #a6d8ce로 설정하고, 테두리 스타일과 색상을 지정합니다. */
#searchInput {
  padding: 10px; /* 검색 인풋의 패딩을 설정합니다. */
  border: 2px solid #a6d8ce; /* 테두리 스타일과 색상을 지정합니다. */
  border-radius: 5px; /* 테두리의 둥글기를 조정합니다. */
  outline: none;
  color:#a0a0a0;
  width: 350px;
}
.search-options {
    display: none;
    position: absolute;
    top: 100%;
    left: 53%;
    width: 450px;
    height: 650px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-top: none;
    z-index: 100;
    border-radius: 10px;
    box-shadow: 0 0 5px rgba(10,22,70,.06),0 16px 16px -1px rgba(10,22,70,.1); /* 그림자 효과 적용 */
   	padding: 20px;
}

.search-options ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.search-options ul li {
    padding: 10px;
    border-bottom: 1px solid #ccc;
    cursor: pointer;
    font-size: 13px;
    border:none;
}

.search-options ul li:last-child {
    border-bottom: none;
}
.btn-login, .btn-logout {
	border:2px solid #a6d8ce;
	color:#a6d8ce;
	margin: 0px 15px 0px 15px;
}
.btn-login:hover, .btn-logout:hover {
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: #fff;
}
.btn-project {
	background-color: #a6d8ce;
	color: #fff;
	border: 2px solid #a6d8ce;
}
.btn-project:hover {
	background-color: transparent;
	color:#a6d8ce;
	border: 2px solid #a6d8ce;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-white fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="../main/main.do"><img src="../images/crowd-logo.png" style="width:100px; height:auto;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="../open/open.do">오픈예정</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../fund/fund_list.do">펀딩</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../store/store_list.do">스토어</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../notice/notice.do">공지사항</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../wasta/list.do"><i class="fa-brands fa-instagram fa-xl"></i></a></li>
					<li class="nav-item"><a class="nav-link"
						href="../admin/main.do">adminTest</a></li>	
				</ul>
				<form method="get" action="../search/search.do">
					<div class="search">
			            <input id="searchInput" type="text" class=""
			                placeholder="새로운 일상이 필요하신가요?"
			                onclick="showSearchOptions()"
			                name="keyword">
			            <i id="searchIcon" class="fa-solid fa-search"></i>
			        </div>
			        <div id="searchOptions" class="search-options">
			        	<div class="row">
				            <div class="col-md-6">
				            	<h4 style="color:gray">최근 검색어</h4>
					            <ul>
					                <li>최근 검색어 1</li>
					                <li>최근 검색어 2</li>
					                <li>최근 검색어 3</li>
					            </ul>
				            </div>
				            <div class="col-md-6">
				            	<h4 style="color:gray">카테고리</h4>
					            <ul>
					                <li>캐릭터·굿즈</li>
					                <li>홈·리빙</li>
					                <li>여행·숙박</li>
					                <li>푸드</li>
					                <li>뷰티</li>
					                <li>레저·아웃도어</li>
					                <li>반려동물</li>
					                <li>패션·잡화</li>
					                <li>테크·가전</li>
					                <li>출판</li>
					                <li>게임·취미</li>
					                <li>스포츠·모빌리티</li>
					                <li>베이비·키즈</li>
					                <li>컬쳐·아티스트</li>
					            </ul>
				            </div>
			            </div>
			        </div>
				</form>
				<c:if test="${sessionScope.id==null }">
					<a href="../member/member_login.do" class="btn btn-outline-info btn-login">로그인</a>
				</c:if>
				<c:if test="${sessionScope.id!=null }">
					<a href="../member/member_logout.do" class="btn btn-outline-info btn-login">로그아웃</a>
				</c:if>
				<a href="" class="btn btn-project">프로젝트 만들기</a>
			</div>
		</div>
	</nav>
</body>
</html>