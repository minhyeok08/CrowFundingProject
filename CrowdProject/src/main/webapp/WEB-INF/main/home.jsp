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
		<!-- Carousel -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
	
			<!-- Indicators/dots -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
					class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>
	
			<!-- The slideshow/carousel -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../images/crowd-banner01.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="../images/crowd-banner02.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="../images/crowd-banner03.jpg" class="d-block w-100">
				</div>
			</div>
	
			<!-- Left and right controls/icons -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
		<div class="row" style="padding:40px 80px 40px 80px">
			<div class="col-lg-8">
				<div class="row" style="padding-left:">
				<h2>취향 맞춤 프로젝트</h2>
				<div class="col-md-4" v-for="fvo in fund_list">
					<div class="thumbnail" style="width: 100%;">
						<a :href="'../fund/fund_detail_before.do?wfno='+fvo.wfno">
							<img :src="fvo.mainimg" class="store_poster" :style="{width:'100%', height:getWidthDependentHeight(fvo.mainimg)+'px'}">
							<div class="caption">
								<p style="font-size: 16px; margin:2px 0px 2px 0px; height: 50px;">{{fvo.ftitle}}</p>
								<p style="font-size: 12px; margin:2px 0px 2px 0px; color:gray;">{{fvo.fcname}} | {{fvo.makername}}</p>
								<div class="progress" style="height:3px;">
								  <div class="progress-bar" :style="{ width: fvo.achieve_rate + '%' }" style="background-color:#a6d8ce;"></div>
								</div> 
								<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
									<span style="color:gray;"><strong style="color:#a6d8ce; font-size:16px;">{{fvo.achieve_rate}}%</strong>·{{fvo.aim_amount}}원</span>
									<span style="color:gray;">{{getRemainingDays(fvo.strendday)}}일 남음</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="row">
					<h2>실시간 랭킹</h2>
					<table class="table">
						<tr><td>
							<table class="table"  v-for="(frvo, index) in fund_rank_list" :key="index">
								<tr>
									<td width="5%" rowspan="2"><h3>{{ index+1 }}</h3></td>
									<td width="70%" style="font-size: 16px;">{{frvo.ftitle}}</td>
									<td width="25%" rowspan="2">
										<img :src="frvo.mainimg" class="store_poster" style="width:91px; height:64px;">
									</td>
								</tr>
								<tr>
									<td width="70%" style="font-size: 12px;"><span style="color:#a6d8ce">{{frvo.achieve_rate}}%</span>&nbsp;<span>{{frvo.fcname}}</span></td>
								</tr>
							</table>
						</td></tr>
					</table>
				</div>
			</div>
		</div>
		<!-- <div style="height: 10px;"></div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
					<li v-if="startPage>1"><a href="#" @click="prev()">&lt;</a></li>
					<li v-for="i in range(startPage, endPage)" :class="i==curpage?'active':''"><a href="#" @click="selectPage(i)">{{i}}</a></li>
					<li v-if="endPage<totalpage"><a href="#"  @click="next()">&gt;</a></li>
				</ul>
			</div>
		</div> -->
	</div>
	<script>
		new Vue({
			el:'.main_home',
			data:{
				fund_list:[],
				fund_rank_list:[]
			},
			mounted:function(){
				this.send()
			},
			methods:{
				send:function(){
					axios.get("../main/fund_list_vue.do").then(response=>{
						console.log(response.data)
						this.fund_list = response.data
					}).catch(error=>{
						console.log(error.response)
					})
					axios.get("../main/fund_rank_list_vue.do").then(response=>{
						console.log(response.data)
						this.fund_rank_list = response.data
					}).catch(error=>{
						console.log(error.response)
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
		        	return window.innerHeight * 0.25;
		        }
				/* range:function(start, end) {
					let arr = []
					let length = end-start
					for (let i=0; i<length; i++) {
						arr[i] = start
						start++
					}
					return arr
				},
				selectPage:function(page) {
					this.curpage = page
					this.send()
				},
				prev:function() {
					this.curpage = this.startPage-1 
					this.send()
				},
				next:function() {
					this.curpage = this.endPage+1
					this.send()
				} */
			},
			filters: {
		        numberWithCommas: function (value) {
		            // 숫자에 쉼표 추가 함수 정의
		            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        }
		    },
		})
	</script>
</body>
</html>