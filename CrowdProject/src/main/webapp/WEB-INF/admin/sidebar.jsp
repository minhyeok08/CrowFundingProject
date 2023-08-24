<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.accordion-button.menu1:focus {
	background-color: #a6d8ce;
}
.accordion-button.menu2:focus {
	background-color: #a6d8ce;
}
.accordion-button.menu3:focus {
	background-color: #a6d8ce;
}

/* 메뉴 1 활성화 본문 배경색 변경 */
.accordion-button.menu1[aria-expanded="true"] {
	background-color: #a6d8ce;
}
.accordion-button.menu2[aria-expanded="true"] {
	background-color: #a6d8ce;
}
.accordion-button.menu3[aria-expanded="true"] {
	background-color: #a6d8ce;
}
.dashboard-item {
    padding: 10px 20px;
    font-size: 16px;
    background-color: #00b2b2;
    cursor: pointer;
    border-radius: 5px;
}
.sideImg{
	width:30px;
	height: 30px;
}
.fullscreen{
	background-color: #e9ecef;
}
</style>
</head>
<body>
<div class="fullscreen">
	<nav id="sidebar" class="d-md-block bg-light sidebar">
		<div class="position-sticky">
			<ul class="nav flex-column">
				<li class="nav-item dashboard-item">
				    <a href="../admin/main.do">대시보드</a>
				</li>
				<li class="nav-item">
					<div class="accordion" id="menu1Accordion">
						<div class="accordion-item">
							<h2 class="accordion-header" id="menu1Heading">
								<button class="accordion-button menu1" type="button"
									data-bs-toggle="collapse" data-bs-target="#menu1Collapse"
									aria-expanded="true" aria-controls="menu1Collapse">
									<img src="../images/people.png" class="sideImg">
									&nbsp;&nbsp;회원</button>
							</h2>
							<div id="menu1Collapse" class="accordion-collapse collapse"
								aria-labelledby="menu1Heading" data-bs-parent="#menu1Accordion">
								<div class="accordion-body">
									<a class="nav-link" href="../admin/supporter.do">서포터 관리</a> 
									<a class="nav-link" href="../admin/maker.do">메이커 관리</a>
								</div>
							</div>
						</div>
					</div>
				</li>

				<li class="nav-item">
					<div class="accordion" id="menu2Accordion">
						<div class="accordion-item">
							<h2 class="accordion-header" id="menu2Heading">
								<button class="accordion-button menu2" type="button"
									data-bs-toggle="collapse" data-bs-target="#menu2Collapse"
									aria-expanded="true" aria-controls="menu2Collapse">
									<img src="../images/store.png" class="sideImg">
									&nbsp;&nbsp;상품</button>
							</h2>
							<div id="menu2Collapse" class="accordion-collapse collapse"
								aria-labelledby="menu2Heading" data-bs-parent="#menu2Accordion">
								<div class="accordion-body">
									<a class="nav-link" href="../admin/fund.do">펀딩 상품</a> 
									<a class="nav-link" href="../admin/store.do">스토어 상품</a>
								</div>
							</div>
						</div>
					</div>
				</li>
				<!-- li 추가 여기부터~~ -->
				<li class="nav-item">
					<div class="accordion" id="menu3Accordion">
						<div class="accordion-item">
							<h2 class="accordion-header" id="menu3Heading">
								<button class="accordion-button menu3" type="button"
									data-bs-toggle="collapse" data-bs-target="#menu3Collapse"
									aria-expanded="true" aria-controls="menu2Collapse">
									<img src="../images/board.png" class="sideImg">
									&nbsp;&nbsp;공지 및 문의내역</button>
							</h2>
							<div id="menu3Collapse" class="accordion-collapse collapse"
								aria-labelledby="menu3Heading" data-bs-parent="#menu3Accordion">
								<div class="accordion-body">
									<a class="nav-link" href="../admin/notice.do">공지사항 관리</a> 
									<a class="nav-link" href="../admin/qna.do">문의내역 관리</a>
									<a class="nav-link" href="../admin/chart.do">통계</a>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</div>
</body>
</html>