<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap{
	margin: 0px auto;
	width: 500px;
	border-radius: 5px;
}
.title{
	font-size: 35px;
}
.myFundjjimList{
	border-radius: 5px;
	border: 1px solid #d3d3d3;
}
.fundDetailLink:hover{
	cursor: pointer;
}
.myFundData .jjimContent p{
	padding: 0px;
	margin: 0px;
}
.btn-custom-del {	
	width : 50px;
	background-color: transparent; 
	border-color: #FF3333; 
	color: #FF3333; 
	transition: background-color 0.3s;
	font-size: 12px;
	padding: 6px 6px;
	float: right;
	margin-bottom: 10px;
}
.btn-custom-del:hover {
  background-color: rgb(234, 248, 249); 
  border-color: #FF3333; 
  color: #FF3333;
}
.active {
    border-bottom: 0.5px solid black;
}
.funding_store_btn p{
	font-size: 13pt;
	font-weight: 900px;
}
.funding_store_btn span{
	cursor: pointer;
}
.myStorejjimList{
	border-radius: 5px;
	border: 1px solid #d3d3d3;
}
.storeDetailLink:hover{
	cursor: pointer;
}
.myStoreData .jjimContent p{
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body>
	<div class="wrap jjimList">
		<div class="row mt-5">
		<strong class="title">찜한 <i class="fa fa-heart fa-lg" style="color: #ea502a"></i> 만 모았어요</strong>
		</div>
		<div class="row mt-4">
			<div class="row funding_store_btn">
				<span class="col-sm-6" :class="{'active': isFundingVisible}">
					<p @click="showFunding">펀딩</p>
				</span>
				<span class="col-sm-6" :class="{'active': isStoreVisible}">
					<p @click="showStore">스토어</p>
				</span>
			</div>
			<!--  -->
			  <div class="myFundData mt-3" v-for="vo in myFund_data">
			    <!-- 펀딩 관련 내용 -->
			    <div v-show="isFundingVisible" class="row myFundjjimList">
			    	<p style="color: #868e96;font-size: 10pt;margin-top: 10px;">{{formatDate(vo.mydate)}}</p>
			    	<div class="col-sm-4">
			    		<!-- 펀딩 이미지 -->
			    		<img :src="vo.mainimg" style="width: 100%">
			    	</div>
			    	<div class="col-sm-8 jjimContent">
			    		<!-- 펀딩 내용 -->
			    		<p style="font-size: 9pt;">{{ vo.fcname }}</p>
			    		<p style="color: #00c4c4;font-size: 11pt;">{{ vo.support }}명이 지지해요!</p>
						  <strong @click="fundDetail(vo.wfno)" class="fundDetailLink">{{ vo.ftitle }}</strong>
						  <p style="color: #868e96;font-size: 10pt;">{{ vo.makername }}</p>
						  <button class="btn btn-custom-del" @click="fundJjim(vo.wfno)">찜취소</button>
			    	</div>
			    </div>
			  </div>
			  
		    <div class="myStoreData" v-for="svo in myStore_data">
			    <!-- 스토어 관련 내용 -->
			    <div v-show="isStoreVisible" class="row myStorejjimList">
			    	<p style="color: #868e96;font-size: 10pt;margin-top: 10px;">{{formatDate(svo.mydate)}}</p>
			    	<div class="col-sm-4">
			    		<!-- 스토어 이미지 -->
			    		<img :src="svo.main_poster" style="width: 100%">
			    	</div>
			    	<div class="col-sm-8 jjimContent">
			    		<!-- 스토어 내용 -->
			    		<p style="font-size: 9pt;"># {{ svo.tag }}</p>
			    		<p style="color: #00c4c4;font-size: 11pt;">{{ svo.maker_supporter }}명이 지지해요!</p>
						  <strong @click="storeDetail(svo.wsno)" class="storeDetailLink">{{ svo.goods_title }}</strong>
						  <p style="color: #868e96;font-size: 10pt;">{{ svo.maker_name }}</p>
						  <button class="btn btn-custom-del" @click="storeJjim(svo.wsno)">찜취소</button>
			    	</div>
			    </div>
			  </div>
		</div>
	</div>
<script>
var sessionId='${sessionScope.id}';
new Vue({
	el:'.jjimList',
	data:{
		id:sessionId,
		myFund_data:[],
		isFundingVisible:false,
		isStoreVisible:false,
		myStore_data:[]
	},
	mounted(){
		this.showFunding();
	},
	methods:{
		showFunding(){
			this.isFundingVisible=true
			this.isStoreVisible=false
			
			axios.get('../mypage/my_funding_jjim.do',{
				params:{
					id:this.id
				}
			}).then(response=>{
				console.log(response.data)
				this.myFund_data=response.data
			}).catch(error=>{
				console.log(error)
			})
		},
		formatDate(dateString) {
      const date = new Date(dateString);
      const now = new Date();
      
      const years = now.getFullYear() - date.getFullYear();
      if (years > 0) return years + '년 전';
      
      const months = now.getMonth() - date.getMonth();
      if (months > 0) return months + '개월 전';
      
      const days = Math.floor((now - date) / (1000 * 60 * 60 * 24));
      if (days > 0) return days + '일 전';

	  	return '오늘';
    },
    fundJjim(wfno){
     	axios.get('../fund/fund_jjim_vue.do',{
     		params:{
     			wfno:wfno,
     			id:this.id
     		}
     	}).then(response=>{
     		console.log(response.data)
     		this.JjimStatus=response.data
     		
     		this.myFund_data = this.myFund_data.filter(item => item.wfno !== wfno);
     		
     	}).catch(error=>{
     		console.log(error)
     	})
    },
    fundDetail(wfno){
    	location.href='../fund/fund_detail.do?wfno='+wfno
    },
    showStore(){
    	this.isFundingVisible=false
			this.isStoreVisible=true
    	axios.get('../mypage/my_store_jjim.do',{
    		params:{
    			id:this.id
    		}
    	}).then(res=>{
    		console.log(res.data)
    		this.myStore_data = res.data
    	}).catch(error=>{
    		console.log(error)
    	})
    },
    storeJjim(wsno){
    	axios.get('../store/store_jjim_vue.do',{
    		params:{
    			wsno:wsno,
    			id:this.id
    		}
    	}).then(response=>{
     		console.log(response.data)
     		this.storeJjimStatus=response.data
     		this.myStore_data = this.myStore_data.filter(item => item.wsno !== wsno);
     		
     	}).catch(error=>{
     		console.log(error)
     	})
    },
    storeDetail(wsno){
    	location.href='../store/store_detail.do?wsno='+wsno
    }
	}
})
</script>
</body>
</html>