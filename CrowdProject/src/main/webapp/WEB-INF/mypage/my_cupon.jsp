<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cuponContent{
	width: 600px;
	margin: 0px auto;
}
.downCupon{
	background-color: #3359cc;
}
.selected {
  border-bottom: 1px solid black;
}
</style>
</head>
<body>
	<div class="wrap cuponContent">
		<div class="row mt-5">
			<h2>쿠폰</h2>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<p @click="getMyCupon" :class="{selected: myCuponIsVisible}">나의 쿠폰</p>
			</div>
			<div class="col-sm-6">
				<p @click="getAllCupon" :class="{selected: allCuponIsVisible}">쿠폰존</p>
			</div>
		</div>
		<template v-show="allCuponIsVisible">
		<div class="row mt-2" v-for="vo in all_cupon" style="border: 0.7px solid #d3d3d3;">
			<div class="col-sm-10">
				<p>펀딩</p>
				<p>{{vo.title}}</p>
				<h4>{{vo.discount}}원</h4>
				<p>2023.09.30 23시 59분까지 사용 가능</p>
			</div>
			<div class="col-sm-2 downCupon" @click="downloadCupon(vo.cpno)" 
					style="display: flex; flex-direction: column; justify-content: center; align-items:center;">
				<p class="text-center" style="color: white;font-size: 13pt">쿠폰받기</p>
				<i class="fa fa-arrow-circle-o-down fa-xl" style="color: white"></i>
			</div>
		</div>
		</template>
		<template v-show="myCuponIsVisible">
		<div class="row mt-2" v-for="mvo in my_cupon" style="border: 0.7px solid #d3d3d3;">
			<div class="row">
				<p>펀딩</p>
				<p>{{mvo.title}}</p>
				<h4>{{mvo.discount}}원</h4>
				<p>2023.09.30 23시 59분까지 사용 가능</p>
			</div>
		</div>
		</template>
	</div>
<script>
new Vue({
	el:'.cuponContent',
	data:{
		all_cupon:[],
		id:'${sessionScope.id}',
		my_cupon:[],
		cupon_insert:'',
		myCuponIsVisible:false,
		allCuponIsVisible:false
	},
	mounted(){
		this.getMyCupon();
	},
	methods:{
		getAllCupon(){
			this.allCuponIsVisible = true;
			this.myCuponIsVisible = false;
			this.my_cupon = [];
			axios.get('../mypage/all_cupon_vue.do')
			.then(res=>{
				console.log(res.data)
				this.all_cupon=res.data
			}).catch(error=>{
				console.log(error)
			})
		},
		downloadCupon(cpno){
			axios.get('../mypage/cupon_insert_vue.do',{
				params:{
					id:this.id,
					cpno:cpno
				}
			}).then(res=>{
				console.log(res.data)
				this.cupon_insert = res.data
				if(this.cupon_insert == 'fail'){
					alert("이미 저장된 쿠폰입니다.")
					return;
				} else if(this.cupon_insert == 'success'){
					alert("쿠폰 다운로드 완료! 나의 쿠폰을 확인해주세요")
				}
			}).catch(error=>{
				console.log(error)
			})
		},
		getMyCupon(){
			this.allCuponIsVisible = false;
			this.myCuponIsVisible = true;
			this.all_cupon = [];
			axios.get('../mypage/my_cupon_vue.do',{
				params:{
					id:this.id
				}
			}).then(res=>{
				console.log(res.data)
				this.my_cupon = res.data
			}).catch(error=>{
				console.log(error)
			})
		}
	}
})
</script>
</body>
</html>