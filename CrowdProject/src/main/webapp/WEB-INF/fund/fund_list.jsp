<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row" style="padding:40px 80px 40px 80px">
		    <div class="row">
		      <div class="text-center">
		        <button @click="categoryGetData(20)">전체</button>
		        <button @click="categoryGetData(0)">기부</button>
		        <button @click="categoryGetData(1)">패션 잡화</button>
		      </div>
		    </div>
			<div class="col-lg-12">
				<div class="row" style="padding-left:">
				<h2>펀딩 + 리스트</h2>
				<div class="col-md-4" v-for="vo in fund_list">
					<div class="thumbnail" style="width: 260px;">
						<a href="#">
							<img :src="vo.mainimg" class="main_img" style="width:260px; height:180px">
							<div class="caption">
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{vo.ftitle}}</p>
								<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
									<strong style="color:#a6d8ce">{{vo.cum_amount}}</strong>&nbsp;원&nbsp;
									<span style="color:orange">{{vo.achieve_rate}}%</span>
									<span style="text-align:right; margin-left: auto; margin-right:10px;">{{vo.makername}}</span>
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
			el:'.container',
			data:{
				fund_list:[]
			},
			mounted:function(){
				this.categoryGetData(20);
			},
			methods:{
				categoryGetData:function(fcno){
					axios.get("../fund/fund_list_vue.do",{
						params:{
							fcno:fcno
						}
					}).then(response=>{
						console.log(response.data)
						this.fund_list = response.data
					}).catch(error=>{
						console.log(error.response)
					})
					
				}
				
			}
		})
	</script>
</body>
</html>