<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row" id="newsDetail">
		
		<div class="row">
		
		<div class="thumbnail bordered-thumbnail"
				style="width: 8%; height: 15%; text-align: center; font-size: 13px">
				<a href="../fund/fund_news.do?wfno= ${wfno}">목록</a></div>
		
		
			<div class="row">
				
				 <div>	
					<p style="font-size: 30px"><strong>${vo.subject}</strong></p>
					<p style="font-size: 13px">${vo.strRegdate}</p>
					<hr>
					<p style="font-size: 15px">${vo.content}</p>						
				<hr>	
				 </div>
				
				
			</div>
			
		</div>
	</div>
</body>
</html>