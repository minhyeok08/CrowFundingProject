<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/* $(function() {
	var gcount = $('#gcountSelect').val();
	$('#buyBtn').click(function() {
		/*$.ajax({
			type: 'get',
			url: '../fund/fund_buy.do',
			data: {
				"gcount": gcount // Corrected syntax
			}
		});
	});

	$('#gcountSelect').change(function() {
	  var gcount = $(this).val();
	});
}); */
</script>
</head>
<body>
	<div id="fReward">
		<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px; color: black; font-size: 14px;">
		 <strong>'#'{{fund_detail.tag}}</strong>
		 </span>
		<hr>
		<div class="row">
			<p>
				<strong>{{fund_detail.ftitle}}</strong>
			</p>
			<hr>
			<p style="font-size: 13px">{{fund_detail.fsubtitle}}</p>
			<hr>
			<p style="color: #a6d8ce;">
				<span style="font-size: 25px"><strong>${vo.strCum}</strong></span>원 달성
			</p>
			<p style="font-size: 17px">
				<strong>{{fund_detail.achieve_rate}}% 달성</strong>&nbsp;&nbsp;&nbsp;
				<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px;
					 color: black; font-size: 14px;">{{fund_detail.parti_count}}명 참여
				</span>
			</p>
		</div>
	
		<hr>
	
		<button class="bordered-button">
			<img width="30" height="30" src="../images/hands-clapping.svg">
		</button>
		<button class="bordered-button">
			<img width="30" height="30" src="../images/heart.svg">
		</button>
		<br>
		<br>
		<div class="thumbnail bordered-thumbnail" style="width: 95%;">
			<div class="row">
				<div class="col-lg-3">
					<div class="circle-image">
						<img :src="fund_detail.makerphoto" alt="">
					</div>
				</div>
				<div class="col-lg-8">
					<div>{{fund_detail.makername}}</div>
					<br>
				</div>
			</div>
			<hr>
			<!-- <div class="table">
					    	<th>이메일</th>
					    	<td>{{fund_detail.makeremail}}</td>
					    	<th>문의전화</th>
					    	<td>{{fund_detail.makertel}}</td>
					    	<th>홈페이지</th>
					    	<td>{{fund_detail.makerehomepage}}</td>
					    	<th>SNS</th>
					    	<td></td>
					    </div> -->
			<table>
				<tr>
					<th>이메일</th>
					<td style="text-align: center;">{{fund_detail.makeremail}}</td>
				</tr>
				<tr>
					<th>문의전화</th>
					<td style="text-align: center;">{{fund_detail.makertel}}</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td style="text-align: right;">{{fund_detail.makerhomepage}}</td>
				</tr>
				<tr>
					<th>SNS</th>
					<td></td>
				</tr>
	
			</table>
			<hr>
			<div class="thumbnail bordered-thumbnail"
				style="width: 95%; height: 30%; text-align: center; font-size: 13px">
				문의하기</div>
		</div>
		<h5>리워드 선택</h5>
		<br>
		<div class="row" style="max-height: 400px; overflow-y: auto;">
			<div v-for="vo in fund_reward" class="thumbnail bordered-thumbnail" style="width: 95%;">
					<div class="caption">
						<p style="font-size: 16px; margin-bottom: 1px;">
							<strong>{{ vo.rprice }}원<br></strong>
						</p>
						<p style="font-size: 14px; margin-bottom: 1px;">{{ vo.rname }}</p>
						<hr>
						<p style="font-size: 14px; margin-bottom: 1px;">
							리워드 구성 : <br><br>{{ vo.rcont }}
						</p>
						<hr>
						<p style="font-size: 14px; margin-bottom: 1px;">배송비 : {{vo.delfee }}원</p>
						<hr>
						<p style="font-size: 14px; margin-bottom: 1px;">배송시작일 : {{vo.delstart }}</p>
						<hr>
						<span style="font-size: 14px; margin-bottom: 1px;">{{ vo.limitq}}개 남음</span><br>
						<hr>
						<span> 수량 선택 : &nbsp;&nbsp;
							<select ref="gcount" v-model="gcount">
								<option selected>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>			
							</select>
						</span>
						<!-- <a :href="'../fund/fund_buy.do?rno=' + vo.rno + '&wfno=' + fund_detail.wfno + '&gcount=' + gcount"> --> 
							<div class="button-container">
								 <button class="bordered-button" id="buyBtn" @click="buyReward(vo.rno)" >구매하기</button>
							</div>
						<!-- </a>  -->
							<!--  <a :href="'../fund/fund_buy.do?wfno='+wfno" class="button">구매하기</a>-->
							<!-- <button class="bordered-button" id="buyBtn">수량 선택</button> -->	
					</div>
				
			</div>
		</div>
	</div>
	<script>
	 new Vue({
		 el:'#fReward',
		 data:{
			 wfno:${wfno},
			 fund_reward:[],
			 fund_detail:{},
			 no:0,
			 gcount:1,
			 rno:1
		 },
		 mounted:function(){
			 axios.get('../fund/fund_detail_vue.do',{
				 params:{
					 wfno:this.wfno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.fund_detail=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
			 
			 axios.get('../fund/fund_reward_vue.do',{
				 params:{
					 wfno:this.wfno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.fund_reward=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
		 },
		  methods: {
		        buyReward: function(rno) {
		            // 버튼 클릭 시 수행되는 함수
		            let _this=this;
		            const gcount = this.$refs.gcount.value; // 선택된 수량 가져오기
		            const url = "fund_buy.do?rno="+rno+"&wfno="+_this.wfno+"&gcount="+this.gcount;
		           
		            window.location.href = url; // 페이지 이동
		        }
		    }
	 })	
	</script>
</body>
</html>