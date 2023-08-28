<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.carousel-item {
	width: 100%;
	height: 540px;
}
.carousel-inner {
	margin: 0px 0px 20px 0px;
}
table, tr, td{
	border:none;
}
td {
	padding: 2px;
}
</style>
</head>
<body>
	<div class="main_home">
		<div class="row" style="padding:40px 80px 40px 80px">
			<div class="col-lg-6">
				<div class="row">
				<h2>펀딩</h2>
				<div class="col-md-6" v-for="fvo in search_fund">
					<div class="thumbnail" style="width: 100%;">
						<a :href="'../fund/fund_detail_before.do?wfno='+fvo.wfno">
							<img :src="fvo.mainimg" class="store_poster" :style="{ width: '100%', height: getWidthDependentHeight(fvo.mainimg) + 'px' }">
							<div class="caption">
								<p style="font-size: 16px; margin:2px 0px 2px 0px; height: 50px;">{{fvo.ftitle}}</p>
								<p style="font-size: 12px; margin:2px 0px 2px 0px; color:gray;">{{fvo.fcname}} | {{fvo.makername}}</p>
								<div class="progress" style="height:3px;">
								  <div class="progress-bar" :style="{ width: fvo.achieve_rate + '%' }" style="background-color:#a6d8ce;"></div>
								</div> 
								<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
									<span style="color:gray;"><strong style="color:#a6d8ce; font-size:16px;">{{fvo.achieve_rate}}%</strong>·{{fvo.cum_amount | numberWithCommas}}원</span>
									<span style="color:gray;">{{getRemainingDays(fvo.strendday)}}일 남음</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<h2>스토어</h2>
					<div class="col-md-6" v-for="svo in search_store">
					<div class="thumbnail" style="width: 100%;">
						<a href="#">
							<img :src="svo.main_poster" class="store_poster" :style="{ width: '100%', height: getWidthDependentHeight(svo.main_poster) + 'px' }">
							<div class="caption">
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{svo.goods_title}}</p>
								<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
									<strong style="color:#a6d8ce">{{svo.price | numberWithCommas}}</strong>&nbsp;원&nbsp;
									<span style="color:orange">{{svo.score}}</span>
									<span style="text-align:right; margin-left: auto; margin-right:10px;">{{svo.maker_name}}</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		new Vue({
			el:'.main_home',
			data:{
				search_fund:[],
				search_store:[],
				category:'${category}',
				keyword:'${keyword}'
			},
			mounted:function(){
				this.send()
			},
			methods:{
				send:function(){
					axios.get("../search/search_fund_vue.do",{
						params:{
							category:this.category,
							keyword:this.keyword
						}
					}).then(response=>{
						console.log(response.data)
						this.search_fund = response.data
					})
					axios.get("../search/search_store_vue.do",{
						params:{
							category:this.category,
							keyword:this.keyword
						}
					}).then(response=>{
						console.log(response.data)
						this.search_store = response.data
					})
				},
				getRemainingDays:function(endDate) {
		            const now = new Date();
		            const end = new Date(endDate);
		            
					// 한 달 뒤의 날짜를 구하기 위해 월을 1 증가시킴
		           	end.setMonth(end.getMonth() + 1);
		            const timeDiff = end - now;
		            const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));
		            return daysDiff;
		        },
		        getWidthDependentHeight(imageUrl) {
		            // 여기서 이미지의 너비에 따라 높이를 조정하는 로직을 구현합니다.
		            // 예를 들어 이미지의 원본 너비와 높이 정보를 가져와서 비율을 유지하면서 조정할 수 있습니다.
		            // 이 예시에서는 간단히 가로 너비의 절반을 높이로 사용하도록 설정했습니다.
		            return window.innerHeight * 0.25; // 여기서의 로직을 실제 이미지 정보에 맞게 변경하세요.
				}
			},
			filters: {
		        numberWithCommas: function (value) {
		            // 숫자에 쉼표 추가 함수 정의
		            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        }
		    }
		})
	</script>
</body>
</html>