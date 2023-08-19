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
		<div class="row">
		  <div class="text-center">
			<a href="../fund/fund_detail.do">스토리</a>
	        <a href="../fund/fund_news.do">새소식</a>
	        <a href="../fund/fund_community.do">커뮤니티</a>
	        <a href="../fund/fund_suppoter.do">서포터</a>
	        <a href="../fund/fund_refundpolicy.do">환불 정책</a>
		  </div>
		  <br><br><hr>
		</div>
		
		<div class="row">
			<div class="col-lg-8">
			    <div class="row">
					<div class="col-md-4">
			            <div class="thumbnail" style="width: 700px; border: none; padding: 10px;">			                
			                 <img :src="fund_detail.mainimg" class="main_img" style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">		                
			            </div>
			        </div>
			    </div>
			    
			    <div class="row">
			    <h2>프로젝트 스토리</h2>
					<div class="col-md-4">
			            <div class="thumbnail" style="width: 700px; border: none; padding: 10px;">			                
			                 <img :src="fund_detail.detailimg" class="main_img" style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">		                
			            </div>
			        </div>
			     
			    </div>
			</div>
			<div class="col-lg-4">
				<div class="row">
					<p>'#'{{fund_detail.tag}}</p>
				</div>
				<hr>
				<div class="row">
					<p><strong>{{fund_detail.ftitle}}</strong></p>
					<p>{{fund_detail.fsubtitle}}</p>
					<p>{{fund_detail.parti_count}}명 참여</p>
					<p>{{fund_detail.cum_amount}}원 달성</p>
					<p>{{fund_detail.achieve_rate}}% 달성</p>
				</div>
				<hr>
				<h3>리워드 선택</h3>
				<hr>
				<div class="row">
					<div v-for="vo in fund_reward">
						<div class="thumbnail" style="width: 260px;">
							<div class="caption">
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{vo.limitq}}</p>
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{vo.rname}}</p>
							</div>	
						</div>
					</div>
				</div>
				<div class="row">
					<div v-for="vo in fund_reward">
						<div class="thumbnail" style="width: 260px;">
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{vo.rcont}}</p>
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{vo.delstart}}</p>
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
			 wfno:${wfno},
			 fund_reward:[],
			 fund_detail:{}
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
		 }
	 })	
	</script>
</body>
</html>