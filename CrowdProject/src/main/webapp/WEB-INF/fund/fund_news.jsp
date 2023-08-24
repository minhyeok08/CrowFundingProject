<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .bordered-thumbnail {
        border: 1px solid ;
        border-radius: 8px;
        padding: 10px;
        margin-bottom: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .bordered-thumbnail p {
        font-size: 14px;
        margin: 0;
        padding: 5px 0;
    }

    .bordered-thumbnail hr {
        margin: 10px 0;
    }

    .button-container {
        display: flex;
        gap: 10px;
        margin-top:20px;
        justify-content: center; /* 가로 중앙 정렬 */
    }

    /* .bordered-button2 {
        padding: 10px 20px;
        border: none;
        background-color: white;
        color: black;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
    } */
     .bordered-button {
        padding: 10px 20px;
        border: solid;
        border-color: #c8c8c8;
        background-color: white;
        color: black;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .bordered-button:hover {
        background-color: #90c7ba;
    }
    .bordered-thumbnail:hover {
        background-color: #90c7ba;
    }
    
    .col-lg-8 {
    	margin-top:15px;
    }
    .col-lg-4 {
    	margin-top:15px;
    }
    .circle-image {
  width: 70px; /* 이미지 크기 설정 */
  height: 70px;
  border-radius: 50%; /* 원 모양으로 만들기 위한 속성 */
  overflow: hidden; /* 이미지 영역을 원 모양으로 자르기 */
}

.circle-image img {
  width: 100%;
  height: 100%;
  object-fit: cover; /* 이미지가 원 안에 맞도록 설정 */
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
	     <div class="button-container">
			<a href="../fund/fund_detail.do"><button class="bordered-button">스토리</button></a>
			<a href="../fund/fund_detail.do"><button class="bordered-button">새소식</button></a>
			<a href="../fund/fund_detail.do"><button class="bordered-button">커뮤니티</button></a>
			<a href="../fund/fund_detail.do"><button class="bordered-button">서포터</button></a>
			<a href="../fund/fund_detail.do"><button class="bordered-button">환불정책</button></a>
	     </div>
	     <br><br>
	     </div>
	     <hr>
		<!-- <div class="row">
		  <div class="text-center">
			스토리</a>
	        <a href="../fund/fund_news.do">새소식</a>
	        <a href="../fund/fund_community.do">커뮤니티</a>
	        <a href="../fund/fund_suppoter.do">서포터</a>
	        <a href="../fund/fund_refundpolicy.do">환불 정책</a>
		  </div>
		  <br><br>
		  <hr>		  
		</div> -->
		
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
			    <h4>프로젝트 스토리</h4>
					<div class="col-md-4">
			            <div class="thumbnail" style="width: 700px; border: none; padding: 10px;">			                
			                 <img :src="fund_detail.detailimg" class="main_img" style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">		                
			            </div>
			        </div>
			     
			    </div>
			</div>
			<div class="col-lg-4">
					<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px; color: black; font-size:14px;" ><strong>'#'{{fund_detail.tag}}</strong></span>
				
				<hr>
				<div class="row">
					<p><strong>{{fund_detail.ftitle}}</strong></p>
					<hr>
					<p style="font-size:13px">{{fund_detail.fsubtitle}}</p>
					<hr>
					<p style="color: #a6d8ce;"><span style="font-size:25px"><strong>${vo.strCum}</strong></span>원 달성</p>
					<p style="font-size:17px"><strong>{{fund_detail.achieve_rate}}% 달성</strong>&nbsp;&nbsp;&nbsp;<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px; color: black; font-size:14px;">{{fund_detail.parti_count}}명 참여</span></p>
				</div>
				
				<hr>
				
					<button class="bordered-button"><img  width="30" height="30" alt="Clapping Hands" src="../images/hands-clapping.svg"></button>
					<button class="bordered-button"><img  width="30" height="30" alt="Clapping Hands" src="../images/heart.svg"></button>
				<br><br>
				 <div class="thumbnail bordered-thumbnail" style="width: 95%;">        
				 	<div class="row">
					    <div class="col-lg-3">
							<div class="circle-image">
							  <img :src="fund_detail.makerphoto" alt=""><span>이미지이미지</span>
							</div>
					    </div>
					    <div class="col-lg-8">
					    	<div>
					    	{{fund_detail.makername}}
					    	</div>
					    	<br>
					    </div>
				    </div><hr>
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
				    <div class="thumbnail bordered-thumbnail" style="width: 95%;height: 30%; text-align: center;font-size: 13px"> 
				    	문의하기
				    </div>
				 </div>
				<h5>리워드 선택</h5>
				<br>
				<div class="row" style="max-height: 400px; overflow-y: auto;">
				    <div v-for="vo in fund_reward" class="thumbnail bordered-thumbnail" style="width: 95%;">
				        <a :href="'../fund/fund_buy.do?rno=' + vo.rno + '&wfno=' + fund_detail.wfno"> 
				        <div class="caption">
				            <p style="font-size: 16px; margin-bottom: 1px;"><strong>{{ vo.rprice }}원<br></strong></p>
				            <p style="font-size: 14px; margin-bottom: 1px;">{{ vo.rname }}</p>
				            <hr>
				            <p style="font-size: 14px; margin-bottom: 1px;">리워드 구성 : <br><br>{{ vo.rcont }}</p>
				            <hr>
				            <p style="font-size: 14px; margin-bottom: 1px;">배송비 : {{ vo.delfee }}원</p>
				            <hr>
				            <p style="font-size: 14px; margin-bottom: 1px;">배송시작일 : {{ vo.delstart }}</p>
				            <hr>
				            <p style="font-size: 14px; margin-bottom: 1px;">{{ vo.limitq }}개 남음</p>			
				            <div class="button-container">
								
								<!--  <a :href="'../fund/fund_buy.do?wfno='+wfno" class="button">구매하기</a>-->
								<!-- <button class="bordered-button" id="buyBtn">수량 선택</button> -->
							</div>
				        </div>
				        </a>
				        
				    </div>
				    <br><br>
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
			 fund_detail:{},
			 isShow:false,
			 no:0
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