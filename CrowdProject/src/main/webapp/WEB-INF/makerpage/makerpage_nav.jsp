<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let i=0
$(function(){
	$("#projectNav").hover(function() {
        $(this).css("cursor", "pointer")
    })
	$('#projectNav').click(function(){
		if(i==0)
		{	
			$('.projectMn').show();
			i=1;
		}	
		else
		{
			$('.projectMn').hide();
			i=0;
		}
	})
})
</script>
<style type="text/css">
.makerpagenavrow{
	background-color: #a6d8ce;
	height:800px; 
}
.projectMn{
	display: none;
}
#projcetNav:hover{
	color: blue;
}
</style>
</head>
<body>
	<div class="row makerpagenavrow">
		<ul class="nav flex-column">
		  <li class="nav-item">
		    <a class="nav-link" href="../makerpage/makerpage_home.do">메이커 홈</a>
		  </li>
		  <li class="nav-item" id="projectNav">
		  	&nbsp;&nbsp;&nbsp;프로젝트 등록▼
		  </li>
    	  <li class="nav-item projectMn" >
    	    <a class="nav-link" href="#">펀딩 등록</a>
    	  </li>
    	  <li class="nav-item projectMn" >
    	    <a class="nav-link" href="#">스토어 등록</a>
    	  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">프로젝트 관리</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="../makerpage/makerpage_news.do">새소식</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">고객 문의</a>
		  </li>
		</ul>
	</div>
</body>
</html>