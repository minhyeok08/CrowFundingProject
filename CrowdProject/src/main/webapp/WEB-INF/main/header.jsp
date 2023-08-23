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
	right: 20px; /* 아이콘의 오른쪽 여백을 조정할 수 있습니다. */
	top: 50%; /* 아이콘을 수직 중앙에 배치하기 위해 필요한 부분입니다. */
	transform: translateY(-50%); /* 아이콘을 수직 중앙에 배치하기 위해 필요한 부분입니다. */
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
.search-options input[type="radio"] {
    display: none;
}

.search-options label.radio-label {
    cursor: pointer;
}
#searchButton {
    background-color: transparent; /* 버튼 배경 투명하게 설정 */
    border: none; /* 버튼 테두리 없애기 */
    cursor: pointer; /* 마우스 커서 모양 변경 */
    padding: 0; /* 내부 패딩 제거 */
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
<script type="text/javascript">
function showSearchOptions() {
    var searchOptions = document.getElementById("searchOptions");
    searchOptions.style.display = "block";
}

// 클릭 이외의 영역을 클릭하면 검색 옵션을 숨깁니다.
document.addEventListener("click", function(event) {
    var searchOptions = document.getElementById("searchOptions");
    var searchInput = document.getElementById("searchInput");

    if (event.target !== searchInput && event.target !== searchOptions) {
        searchOptions.style.display = "none";
    }
});

function setSelectedCategory(category) {
	var selectedCategoryInput = document.getElementById("selectedCategory");
    selectedCategoryInput.value = category;
    document.querySelector("form").submit();
}

/* document.addEventListener("DOMContentLoaded", function() {
    // 최근 검색어 목록을 가져와서 동적으로 추가하는 함수
    function updateRecentSearchList() {
        var recentSearchList = document.getElementById("recentSearchList");

        // 쿠키에서 최근 검색어 값을 가져옵니다.
        var recentSearchCookie = getCookie("recentSearch");

        if (recentSearchCookie) {
            var recentSearches = recentSearchCookie.split("|");
            recentSearchList.innerHTML = ""; // 기존 목록 초기화

            // 가져온 최근 검색어 값을 목록에 추가합니다.
            for (var i = 0; i < recentSearches.length; i++) {
                var listItem = document.createElement("li");
                listItem.textContent = recentSearches[i];
                recentSearchList.appendChild(listItem);
            }
        }
    }

    // 쿠키에서 값을 가져오는 함수
    function getCookie(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");

        if (parts.length === 2) {
            return parts.pop().split(";").shift();
        }
    }

    // 페이지 로드 시 최근 검색어 목록을 업데이트합니다.
    updateRecentSearchList();
}); */
</script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-white fixed-top">
		<div class="container-fluid" id="header">
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
						href="../wasta/main.do"><i class="fa-brands fa-instagram fa-xl"></i></a></li>
					<li class="nav-item"><a class="nav-link"
						href="../admin/main.do">adminTest</a></li>	
				</ul>
				<form method="get" action="../search/search_before.do">
					<div class="search">
			            <input id="searchInput" type="text"
			                placeholder="새로운 일상이 필요하신가요?"
			                onclick="showSearchOptions()"
			                name="keyword">
			            <button type="submit" id="searchButton">
			            	<i id="searchIcon" class="fa-solid fa-search fa-xl"></i>
			            </button>
			        </div>
			        <div id="searchOptions" class="search-options">
			        	<div class="row">
				            <div class="col-md-6">
				            	<h4 style="color:gray">최근 검색어</h4>
					            <ul>
									<li v-for="(keyword, index) in keywords" :key="index">
								      {{ keyword }}
								      <button @click="removeKeyword(index)">X</button>
								    </li>
							    </ul>
				            </div>
				            <div class="col-md-6">
				            	<h4 style="color:gray">카테고리</h4>
				            	<input type="hidden" id="selectedCategory" name="category" value="${param.category}">
					            <ul>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="charGoods" value="캐릭터·굿즈" onclick="setSelectedCategory('캐릭터·굿즈')">
								            캐릭터·굿즈
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="homeLiving" value="홈·리빙" onclick="setSelectedCategory('홈·리빙')">
								            홈·리빙
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="travelAccommodation" value="여행·숙박" onclick="setSelectedCategory('여행·숙박')">
								            여행·숙박
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="food" value="푸드" onclick="setSelectedCategory('푸드')">
								            푸드
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="beauty" value="뷰티" onclick="setSelectedCategory('뷰티')">
								            뷰티
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="leisureOutdoor" value="레저·아웃도어" onclick="setSelectedCategory('레저·아웃도어')">
								            레저·아웃도어
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="pet" value="반려동물" onclick="setSelectedCategory('반려동물')">
								            반려동물
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="fashionAccessories" value="패션·잡화" onclick="setSelectedCategory('패션·잡화')">
								            패션·잡화
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="techAppliances" value="테크·가전" onclick="setSelectedCategory('테크·가전')">
								            테크·가전
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="publishing" value="출판" onclick="setSelectedCategory('출판')">
								            출판
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="gameHobby" value="게임·취미" onclick="setSelectedCategory('게임·취미')">
								            게임·취미
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="sportsMobility" value="스포츠·모빌리티" onclick="setSelectedCategory('스포츠·모빌리티')">
								            스포츠·모빌리티
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="babyKids" value="베이비·키즈" onclick="setSelectedCategory('베이비·키즈')">
								            베이비·키즈
								        </label>
								    </li>
								    <li>
								        <label class="radio-label">
								            <input type="radio" id="cultureArtist" value="컬쳐·아티스트" onclick="setSelectedCategory('컬쳐·아티스트')">
								            컬쳐·아티스트
								        </label>
								    </li>
								</ul>
				            </div>
			            </div>
			        </div>
				</form>
				<c:if test="${sessionScope.id==null }">
					<a href="../member/member_login.do" class="btn btn-outline-info btn-login">로그인</a>
					<a href="../member/member_login.do" class="btn btn-project">프로젝트 만들기</a>
				</c:if>
				<c:if test="${sessionScope.id!=null }">
					<a href="../member/member_logout.do" class="btn btn-outline-info btn-login">로그아웃</a>
					<a href="../makerpage/makerpage_home.do" class="btn btn-project">프로젝트 만들기</a>
				</c:if>
			</div>
		</div>
	</nav>
	<script>
		new Vue({
			el:'#header',
			data: {
				keywords: []
			},
			mounted:function(){
				this.fetchKeywords();
			},
			methods:{
				async fetchKeywords() {
		            try {
		                const res = await axios.get("../search/keyword_vue.do", {
		                    withCredentials: true // 쿠키 전달을 위한 옵션 설정
		                });
		                console.log(res.data);
		                this.keywords = res.data;
		            } catch (error) {
		                console.error('Error fetching keywords:', error);
		            }
		        }
			}
		})
	</script>
</body>
</html>