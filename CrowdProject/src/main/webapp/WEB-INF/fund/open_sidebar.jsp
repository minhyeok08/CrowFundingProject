<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			
			<p style="font-size: 13px">{{fund_detail.fsubtitle}}</p>
			
			<p style="color: #a6d8ce;">
				<span style="font-size: 25px"><strong>{{ formatDate(fund_detail.openday) }}</strong></span>&nbsp;&nbsp;오픈 예정
			</p>
			<!-- <p style="font-size: 17px">
				<strong>{{fund_detail.achieve_rate}}% 달성</strong>&nbsp;&nbsp;&nbsp;
				<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px;
					 color: black; font-size: 14px;">{{fund_detail.parti_count}}명 참여
				</span>
			</p> -->
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
					<td v-if='!fund_detail.makerhomepage' style='text-align:right;'>http://wadiz.com</td>
					<td v-else style='text-align:right;'>{{fund_detail.makerhomepage}}</td>
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
		
	</div>
	<script>
	 new Vue({
		 el:'#fReward',
		 data:{
			 wfno:${wfno},
			
			 fund_detail:{},
			 no:0,
			
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

		 },
		    methods: {
		        formatDate(dateString) {
		            const options = { year: 'numeric', month: 'long', day: 'numeric' };
		            return new Date(dateString).toLocaleDateString(undefined, options);
		        }
		    }
		
	 })	
	</script>
</body>
</html>