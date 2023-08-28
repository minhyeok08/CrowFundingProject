<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td.inline { 
		width: 250px; /* 원하는 크기로 설정하세요 */
		height: 80px; /* 원하는 크기로 설정하세요 */
	}
	.button{
	
    margin-right: 10px; /* 이 값을 줄여서 간격을 조정할 수 있습니다 */
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
	<div id="fReward">
		<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px; color: black; font-size: 14px;">
		 <strong><span>#</span>{{store_detail.tag}}</strong>
		 </span>
		<hr>
		<div class="row">
			<p>
				<strong>{{store_detail.goods_title}}</strong>
			</p>
			<hr>
			<p style="font-size: 13px"><i class="fa fa-star" style="color: yellow"></i>{{store_detail.score}}&nbsp;&nbsp;&nbsp;<i class="fa fa-users" style="color: gray"></i>{{store_detail.parti_count}}</p>
			<hr>
			<p style="font-size: 28px"><span style="color: #a6d8ce;">{{store_detail.price}}</span>원</p>
			<hr>
			<p style="font-size: 13px"><i class="fa fa-truck"></i>{{store_detail.delivery}}</p>
			<hr>
		</div>
		<table>
			<tr> 
				<td>
			              <button class="rounded" style="border: none; font-size:12px" >
			                 <img width="40" height="30" alt="Clapping Hands"
			                    src="../images/heart.svg">
			                 <br>
			                    {{store_detail.jjim_count}}   
			              </button>
			       </td>
			       <td>
			              <a href="#3">
			              <button class="rounded" style="border: none; width: 250px; height: 50px;">
			                		리워드 선택  
			              </button>
			              </a>
			       </td>
			</tr>
		</table>

		<br>
		<br>
		<div class="thumbnail bordered-thumbnail" style="width: 95%;">
			<div class="row">
				<div class="col-lg-3">
					<div class="circle-image">
						<img :src="store_detail.maker_picture" alt="">
					</div>
				</div>
				<div class="col-lg-8">
					<div>{{store_detail.maker_name}}</div>
					<div><span style="font-size: 10px;color:  #a6d8ce">{{store_detail.maker_follower}}명이 팔로우 중</span></div>
					<br>
				</div>
			</div>
			<hr>
			<table>
				<tr>
					<td style="font-size: 11px"><span style="color: #a6d8ce"><i class="fa fa-money"></i></span>&nbsp;&nbsp;{{store_detail.maker_totalmoney}}</td>
				</tr>
				<tr>
					<td style="font-size: 11px"><span style="color: #a6d8ce"><i class="fa fa-user"></i></span>&nbsp;&nbsp;서포터{{store_detail.maker_supporter}}</td>
				</tr>
			</table>
			<hr>
			<div class="thumbnail bordered-thumbnail"
				style="width: 95%; height: 30%; text-align: center; font-size: 13px" id="3">
				문의하기</div>
		</div>
		<h5>리워드 선택</h5>
		<br>
		<div class="row" style="max-height: 400px; overflow-y: auto;">
			<div v-for="vo in store_reward" class="thumbnail bordered-thumbnail" style="width: 95%;">
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
						<p v-if="vo.delfee == 0" style="font-size: 14px; margin-bottom: 1px;">배송비 : 무료</p>
        				<p v-else style="font-size: 14px; margin-bottom: 1px;">배송비 : {{ vo.delfee }}원</p>
						
						<hr>
						<p style="font-size: 14px; margin-bottom: 1px;">배송시작일 : {{vo.delstart }}</p>
						<hr>
						<span style="font-size: 14px; margin-bottom: 1px;">{{ vo.curq}}개 남음</span><br>
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
						 
							<div class="button-container">
								<c:if test="${sessionScope.id!=null }">
								 <button class="bordered-button" id="buyBtn" @click="buyReward(vo.rno)" >구매하기</button>
								</c:if>
								 <c:if test="${sessionScope.id==null }">
								 <a href="../member/member_login.do">
								 <button class="bordered-button">구매하기</button>
								</a>
						 		</c:if> 
							</div>
						 
						
						<!-- </a>  -->
							<!--  <a :href="'../fund/fund_buy.do?wsno='+wsno" class="button">구매하기</a>-->
							<!-- <button class="bordered-button" id="buyBtn">수량 선택</button> -->	
					</div>
				
			</div>
		</div>
	</div>
 	<script>
	var sessionId = '${sessionScope.id}';
	</script>
	<script>
	 new Vue({
		 el:'#fReward',
		 data:{
			 wsno:${wsno},
			 store_reward:[],
			 store_detail:{},
			 no:0,
			 gcount:1,
			 rno:1,
			 JjimStatus:'0',
			 id: sessionId
		 },
		 mounted:function(){
			 axios.get('../store/store_detail_vue.do',{
				 params:{
					 wsno:this.wsno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.store_detail=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
			 
			 axios.get('../store/store_reward_vue.do',{
				 params:{
					 wsno:this.wsno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.store_reward=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
		 },
		  methods: {
		        buyReward: function(rno) {
		            // 버튼 클릭 시 수행되는 함수
		            let _this=this;
		            const gcount = this.$refs.gcount.value; // 선택된 수량 가져오기
		            const url = "fund_buy.do?rno="+rno+"&wsno="+_this.wsno+"&gcount="+this.gcount;
		           
		            window.location.href = url; // 페이지 이동
		        },
		        /* fundJjim(){
		        	if(this.id == null || this.id == undefined || this.id == '' || this.id == 0){
		        		alert("로그인을 진행해주세요");
		        		return;
		        	} else {
			        	axios.get('../fund/fund_jjim_vue.do',{
			        		params:{
			        			wsno:this.wsno,
			        			id:this.id
			        		}
			        	}).then(response=>{
			        		console.log(response.data)
			        		this.JjimStatus=response.data
			        		if(this.JjimStatus == '0'){
			        			alert("찜하기 완료")
			        		} else {
			        			alert("찜하기 취소")
			        		}
			        	}).catch(error=>{
			        		console.log(error)
			        	})
		        		
		        	}

		        }
		    }, */
			/* filters: {
		        numberWithCommas: function (value) {
		            // 숫자에 쉼표 추가 함수 정의
		            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        }
		    } */
	 }
	 })	
	</script>
</body>
</html>