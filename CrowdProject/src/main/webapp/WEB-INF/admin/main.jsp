<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['날짜', '방문자 수'],
      ['2023-08-01', 15],
      ['2023-08-02', 32],
      ['2023-08-03', 12],
      // ... 추가적인 데이터
    ]);

    var options = {
      title: '사이트 방문자 수',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>
<style type="text/css">
.fullscreen{
	background-color: #e9ecef;
	display: flex;
}
.rightCont{
	width:70%;
}
.rightCont2{
	display: flex;
	flex-direction: row;
}
.leftCont{
	width:30%;
	height: 500px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.today{
	width: 780px;
	height: 150px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.visiterChart{
	width: 100%;
	height: 400px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.summary{
	width: 100%;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.reviewTable{
	width: 100%;
	height: 400px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.qnaTable{
	width: 100%;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
</style>
</head>
<body>
<div class="fullscreen">
	<div class="rightCont">
		<div class="today">
			오늘의 할일
		</div>
		<div class="rightCont2">
			<div class="visiterChart">
				<div id="chart_div" style="width: 100%; height: 350px;"></div>
			</div>
			<div class="summary">
				금일 요약
			</div>
		</div>
		<div class="rightCont2">
			<div class="reviewTable">
				리뷰
			</div>
			<div class="qnaTable">
				답변
			</div>
		</div>
	</div>
	<div class="leftCont">
		<table class="table">
			<tr>
				<td>관리자 프로필</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>