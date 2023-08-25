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
							<img :src="fvo.mainimg" class="store_poster" style="width:100%; height:auto; object-fit:cover;">
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
			<div class="col-lg-6">
				<div class="row">
					<h2>스토어</h2>
					<div class="col-md-6" v-for="svo in search_store">
					<div class="thumbnail" style="width: 100%;">
						<a href="#">
							<img :src="svo.main_poster" class="store_poster" style="width:100%; height:70%">
							<div class="caption">
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{svo.goods_title}}</p>
								<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
									<strong style="color:#a6d8ce">{{svo.price}}</strong>&nbsp;원&nbsp;
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
		        }
			}
		})
	</script>
</body>
</html>