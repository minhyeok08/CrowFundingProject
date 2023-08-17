<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.makerpagemainrow{
	border: 2px solid #a6d8ce;
	height: 800px;
}
#makerinfo{
	border: 2px solid #a6d8ce;
}
#makerhome{
	border: 2px solid #a6d8ce;
}
.makerhome_row{
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="row makerpagemainrow">
		<div class="col-sm-3" id="makerinfo">
		
		</div>
		<div class="col-sm-9" id="makerhome">
			<div class="row makerhome_row" style="border: solid 1px #a6d8ce">
				<h3>프로젝트 목록</h3>
				<div class="col">
					<div class="img-thumbnail">
				      <a href="#">
				        <img src="" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p>제목</p>
				        </div>
				      </a>
				    </div>
				</div>
				<div class="col">
					<div class="img-thumbnail">
				      <a href="#">
				        <img src="" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p>제목</p>
				        </div>
				      </a>
				    </div>
				</div>
				<div class="col">
					<div class="img-thumbnail">
				      <a href="#">
				        <img src="" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p>제목</p>
				        </div>
				      </a>
				    </div>
				</div>
				<div style="height: 10px"></div>
				<div>
				  <ul class="pagination justify-content-center">
				    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item"><a class="page-link" href="#">Next</a></li>
				  </ul>
				</div>
			</div>
			<div>
				좋아요,찜목록 등등..
			</div>
		</div>
	</div>
</body>
</html>