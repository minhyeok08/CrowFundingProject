<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn-custom {
	background-color: transparent;
	border-color: #00b2b2;
	color: #00b2b2;
	transition: background-color 0.3s;
	font-size: 14px;
}

.btn-custom:hover {
	background-color: rgb(234, 248, 249);
	border-color: #00b2b2;
	color: #00b2b2;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['bar', 'corechart']});
  google.charts.setOnLoadCallback(drawCharts);

  var pieChartVisible = true;
  var columnChartVisible = true;
  var donutChartVisible = true;
  var barChartMaterialVisible = true;
	
  function drawCharts() {
    // Bar Chart
    var barData = google.visualization.arrayToDataTable([
      ['상품이름', '참여자수'],
      <c:forEach var="vo" items="${list}">
        ['<c:out value="${vo.ftitle}"/>', <c:out value="${vo.parti_count}"/>],
      </c:forEach>
    ]);

    var barOptions = {
      chart: {
        title: '인기 펀딩',
        subtitle: '참여자수',
      }
    };

    var barChart = new google.charts.Bar(document.getElementById('columnchart_material'));
    barChart.draw(barData, google.charts.Bar.convertOptions(barOptions));

    // Pie Chart
    var pieData = google.visualization.arrayToDataTable([
      ['카테고리', '펀딩비율'],
      <c:forEach var="cvo" items="${clist}">
      ['<c:out value="${cvo.fcname}"/>', <c:out value="${cvo.support}"/>],
    </c:forEach>
    ]);

    var pieOptions = {
      title: '카테고리별 펀딩 수'
    };

    var pieChart = new google.visualization.PieChart(document.getElementById('piechart'));
    pieChart.draw(pieData, pieOptions);

    pieChart.setVisible(false); // 초기에는 숨김
  }

  function togglePieChart() {
    var pieChart = document.getElementById('piechart');
    pieChartVisible = !pieChartVisible;

    if (pieChartVisible) {
      pieChart.style.display = 'block'; // 보이기
    } else {
      pieChart.style.display = 'none'; // 숨기기
    }
  }
	
  function toggleColumnChart() {
    var columnChart = document.getElementById('columnchart_material');
    columnChartVisible = !columnChartVisible;

    if (columnChartVisible) {
      columnChart.style.display = 'block'; // 보이기
    } else {
      columnChart.style.display = 'none'; // 숨기기
    }
  }
  function toggleDonutChart() {
	    var donutChart = document.getElementById('donutchart');
	    donutChartVisible = !donutChartVisible;

	    if (donutChartVisible) {
	      donutChart.style.display = 'block'; // 보이기
	    } else {
	      donutChart.style.display = 'none'; // 숨기기
	    }
	  }

	  function toggleBarChartMaterial() {
	    var barChartMaterial = document.getElementById('barchart_material');
	    barChartMaterialVisible = !barChartMaterialVisible;

	    if (barChartMaterialVisible) {
	      barChartMaterial.style.display = 'block'; // 보이기
	    } else {
	      barChartMaterial.style.display = 'none'; // 숨기기
	    }
	  }
</script>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['카테고리', '상품비율'],
          <c:forEach var="scvo" items="${sclist}">
          	['<c:out value="${scvo.scname}"/>', <c:out value="${scvo.price}"/>],
        	</c:forEach>
        ]);

        var options = {
          title: '카테고리별 스토어 상품',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['상품', '참여자수'],
          <c:forEach var="svo" items="${slist}">
          	['<c:out value="${svo.goods_title}"/>', <c:out value="${svo.parti_count}"/>],
       	 </c:forEach>
        ]);

        var options = {
          chart: {
            title: '인기 스토어 상품',
            subtitle: '참여자수',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
</head>
<body>
  <button class="btn btn-custom" onclick="toggleColumnChart()">카테고리별 펀딩수</button>
<button class="btn btn-custom" onclick="togglePieChart()">인기펀딩</button>
<button class="btn btn-custom" onclick="toggleBarChartMaterial()">인기 스토어 상품</button>
<button class="btn btn-custom" onclick="toggleDonutChart()">카테고리별 스토어 상품</button>
  <div style="height: 30px;"></div>
  <div style="display: flex; flex-direction: row;">
    <div style="flex: 1;">
      <div id="columnchart_material" style="width: 600px; height: 400px;"></div>
      <div id="barchart_material" style="width: 600px; height: 400px;"></div>
    </div>
    <div style="flex: 1;">
      <div id="piechart" style="width: 600px; height: 400px;"></div>
      <div id="donutchart" style="width: 600px; height: 400px;"></div>
    </div>
  </div>
</body>
</html>
