<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#row{
	width: 800px;
	margin: 0px auto;
}
.content{
	padding: 20px;
}
#rewardDetailBtn:hover{
	cursor: pointer;
}
.rewardData{
	border-bottom: 1px solid #d3d3d3
}
.rewardData span{
	margin-left: 10px;
	font-size: 10pt;
}
.accountData span{
	margin-left: 10px;
	font-size: 10pt;
}
.finalPrice span {
	font-weight: 800px;
}
</style>
</head>
<body>
	<div id="row">
		<div class="wrap header mt-5">
			<strong style="font-size: 20pt;">참여내역</strong>
		</div>
		<div class="mt-3"></div>
		<div class="wrap mb-2 content" style="border: 0.7px solid #d3d3d3;border-radius: 5px;"
		v-for="(vo, index) in myFund_data" :key="index">
			<!-- 참여 펀딩 내역 -->
			<div class="wrap">
				<!-- 펀딩 종료 여부 / 유저 참여일 -->
				<div class="wrap mb-3">
					<span style="font-size: 10pt">{{vo.fcname}}</span>
					<span style="font-size: 10pt; float:right;">구매일 : {{vo.myday}}</span>
				</div>
				<!-- 종료 여부 -->
					<p style="font-size: 10pt;color:#00c4c4">{{vo.fundStatus}}</p>
				<!-- 참여 펀딩 명 -->
					<strong style="font-size: 12pt;">{{vo.rname}}</strong>
					<p style="font-size: 10pt">by.{{vo.makername}}</p>
				<!-- 결제 여부 -->
				<p style="font-size: 10pt;">결제 완료</p>
			</div>
			<div class="wrap" style="border-top:0.7px solid #d3d3d3">
				<center>
				<p id="rewardDetailBtn" style="font-size: 11pt;margin: 5px 0px 5px 0px;"
				@click="toggleVisibility(index)" >상세보기</p>
				<i class="fa fa-arrow-down"></i>
				</center>
			</div>
			<div class="wrap" style="border-top:1px solid #d3d3d3" v-show="vo.isVisible">
				<div class="wrap mt-2 mb-2 rewardData">
					<strong>리워드 정보</strong><br><br>
					<span>{{vo.rcont}}</span><br>
					<span>{{formatNumber(vo.rprice)}}원 / {{vo.gcount}}개</span><br>
					<span>발송 시작일 : {{vo.delstart}}</span>
					<div style="height: 15px"></div>
				</div>
				<div class="wrap accountData">
					<strong>결제 내역</strong><br><br>
					<span>리워드 금액</span>
					<span style="float: right">{{formatNumber(vo.tprice)}}원</span><br>
					<!-- <span>쿠폰 차감 금액</span>
					<span style="float: right">3,000원</span><br> -->
					<span>포인트 차감 금액</span>
					<span style="float: right">{{formatNumber(vo.usepoint)}}원</span><br>
					<span>배송비</span>
					<span style="float: right">{{formatNumber(vo.delfee)}}원</span>
				</div>
				<div class="wrap finalPrice mt-2">
					<span>최종 결제 금액</span>
					<span style="float: right">{{formatNumber(vo.totalPrice)}}원</span>
				</div>
			</div>
		</div>
	</div>
<script>
new Vue({
	el:'#row',
	data:{
		myFund_data:[]
	},
	mounted:function(){
		this.getFundData();
	},
	methods:{
		formatNumber(number) {
            return number ? number.toLocaleString() : '0';
        },
		getFundData(){
			axios.get('../mypage/myFundData.do',{
				params:{
					id:'${sessionScope.id}'
				}
			}).then(response=>{
				console.log(response.data)
				response.data.forEach(vo => {
					vo.isVisible = false; // 각 아이템마다 isVisible 속성 추가
        });
				this.myFund_data=response.data
			}).catch(error=>{
				console.log(error)
			})
		},
		toggleVisibility(index) {
		    this.myFund_data[index].isVisible = !this.myFund_data[index].isVisible;
		}
	}
})
</script>
</body>
</html>