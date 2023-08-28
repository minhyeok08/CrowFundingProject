<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypoint, .mycupon, .myfunding, .mystore{
	border: 1px solid #d3d3d3;
	border-radius: 5px;
	display: flex;
	padding: 10px;
}
.myfunding, .mystore {
	align-items: center;
	height: 88px;
}
.btn-custom {
	border:1px solid #d3d3d3;
	width: 130px;
	font-size: 13px;
}
.btn-custom:hover {
	border: 1px solid black;
}
 .myinfoModal{
	color : black;
	text-decoration: none;
}
.myinfoModal:hover{
	cursor: pointer;
}
#updateMyInfoModal > .modal-dialog-centered > .modal-content{
	margin : 0px auto;
	width: 300px;
}
.replyBoardBack{
    background: #f5f7fa;
    padding: 16px;
    width: 95%;
    border-radius: 10px;
    margin: 7px;
    overflow-y: auto; 
  	max-height: 500px; 
}
.adminBoard {
    background: #d3e1df;
    padding: 16px;
    width: auto;
    border-radius: 10px 10px 0px 10px;
    margin-bottom: 30px;
    position: relative;
}
.replyCont_header_right {
   display: flex; 
   align-items: center; 
}
.replyCont_header_left{
	display: flex; 
   	align-items: center;
   	justify-content: space-between;
}
.profileContainer {
   display: flex;
   flex-direction: column;
   align-items: center;
}
.replyImg {
   border-radius: 50%;  
   width : 50px;  
   height : 50px;   
}
.review_name{
	text-align:center
}
.replyBoard {
    background: #f0f7f4;
    padding: 16px;
    width: auto;
    border-radius: 10px 10px 10px 0px;
    position:relative;
    margin-bottom: 40px;
}
.review_time{
	position:absolute;
	bottom :5px;  
	right :5px;  
	font-size :12px; 
	color: #929696; 
}
 .textarea-box {
	border: 2px solid #ccc; /* 초기 테두리 스타일 */
	border-radius: 4px;
	padding: 5px;
	transition: border-color 0.3s; /* 테두리 색 변화 시 부드럽게 효과 적용 */
}

.textarea-box:focus {
	border-color: mintcream; /* 선택 시 테두리 색 변경 */
	box-shadow: 0 0 0 4px rgba(0, 128, 128, 0.3); /* 선택 시 약간 두꺼운 테두리 스타일 */
	outline: none;
}
</style>
</head>
<body>
<div class="wrap">
	<div class="container mt-5 container1">
		<div class="row">
			<div class="col-sm-2 text-center" style="border-right:0.7px solid #d3d3d3;">
				<div class="profileImageClass mb-3">
					<img :src="infoData.profile_url" style="border-radius: 50%; width: 100px; height: 100px;">
				</div>
			<strong>${sessionScope.name }님</strong><br>
			<a href="../makerpage/makerpage_home.do" class="btn btn-custom mt-3">메이커</a><br>
			<a href="../member/member_logout.do" class="btn btn-custom mt-3">로그아웃</a>
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-sm-4">
						<div class="mypoint mt-3">
						<!-- 보유 포인트 -->
							<div class="row" style="padding: 0xp">
								<p style="display: flex; justify-content: space-between; align-items: center; margin:0px;">
									<strong>포인트</strong>
									<span style="text-align:right; margin-left: auto; margin-right:10px;">{{infoData.point}}P</span>
								</p>
							</div>
						</div>
						<div class="mycupon mt-1">
							<!-- 보유중인 쿠폰 갯수 -->
							<div class="row" style="padding: 0xp">
								<a href="../mypage/my_cupon.do">
									<p style="display: flex; justify-content: space-between; align-items: center; margin:0px;">
										<strong>쿠폰</strong>
										<span style="text-align:right; margin-left: auto; margin-right:10px;">{{myCuponCount}}개</span>
									</p>
								</a>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="row">
							<div class="col-sm-6">
								<div class="row myfunding mt-3">
									<a href="../mypage/myFundDetail.do">
										<p style="display: flex; justify-content: space-between; align-items: center; margin:0px;">
											<strong>참여펀딩</strong>
											<span style="text-align:right; margin-left: auto; margin-right:10px;">{{vo.fcount}}&nbsp;건</span>
										</p>
									</a>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="row myfunding mt-3">
									<p style="display: flex; justify-content: space-between; align-items: center; margin:0px;">
										<strong>스토어</strong>
										<span style="text-align:right; margin-left: auto; margin-right:10px;">3건</span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="container mt-3 container2">
					<div style="border-top: 0.7px solid #d3d3d3;"></div>
 						<div class="row mt-4">
 						<strong>나의 활동</strong>
 							<!-- 찜하기 -->
 							<div class="col-sm-6 myjjim mt-3">
 								<a href="../mypage/my_jjim.do">찜하기</a>
 							</div>
 							<div class="col-sm-6 follower mt-3">
 								<a href="../mypage/my_follower.do">팔로우</a>
 							</div>
 						</div>
 						<div style="height: 30px;border-bottom: 0.7px solid #d3d3d3;"></div>
						<!-- 나의 문의 -->
						<div class="row mt-4">
						<strong>${sessionScope.name } 님 문의</strong>
							<!-- 메이커 문의 -->
							<div class="col-sm-6 makerqna mt-3">
								<a href="../mypage/my_qna_maker.do">메이커 문의</a>
							</div>
							<!-- 관리자 문의 -->
							<div class="col-sm-6 myqna mt-3">
								<!-- <a href="#">관리자 문의</a> -->
								<b-button v-b-modal.my-modal @click="openModal; qnaDetail();"
								class="btn btn-custom">관리자 문의하기</b-button>
							</div>
						</div>
						<div style="height: 30px;border-bottom: 0.7px solid #d3d3d3;"></div>
						<!-- 고객센터 -->
						<div class="row mt-4">
							<strong>고객센터</strong>
							<!-- 공지사항 -->
							<div class="col-sm-6 notice mt-3">
								<a href="../notice/notice.do">공지사항</a>
							</div>
							<!-- 내 정보 설정 -->
							<div class="col-sm-6 myinfo  mt-3">
								<a class="myinfoModal" data-bs-toggle="modal" data-bs-target="#updateMyInfoModal">내정보 설정</a>
								<!-- 비밀번호 입력 모달 -->	
								<div class="modal fade" id="updateMyInfoModal" tabindex="-1" aria-labelledby="updateMyInfoLabel" aria-hidden="true" data-bs-backdrop="static">
					      	<div class="modal-dialog modal-dialog-centered">
					      		<div class="modal-content">
					      			<div class="modal-header">
					      				<h5 class="modal-title" id="updateMyInfoLabel">비밀번호 확인</h5>
					      			</div>
					      			<div class="modal-body">
					      				<form>
					      					<div class="mb-3">
					      						<label for="password" class="col-form-label">비밀번호</label>
					      						<input type="password" class="form-control" id="password" v-model="password" ref="password">
					      						<small id="pwdCheckMessage" :class="pwdCheckHelp" class="form-text">
					      							{{pwdCheckMessage}}
					      						</small>
					      					</div>
					      				</form>
					      			</div>
					      			<div class="modal-footer">
					      				<button type="button" class="btn closeBtn" data-bs-dismiss="modal">취소</button>
					      				<button type="button" class="btn changeBtn" @click="myPwdCheck">확인</button>
					      			</div>
					      		</div>
					      	</div>
					      </div>
								<!-- 모달 끝! -->
							</div>
						</div>
						<!-- 관리자에게 문의하기 모달-->
						<b-modal id="my-modal" v-model="showModal" title="문의하기"
									hide-header-close hide-footer ok-only>
							<div class="replyBoardBack">
							    <div class="replyCard">
							    	<div v-for="dvo in qna_detail">
								        <div class="replyCont_header_right" v-if="dvo.admin=='y'">
								        <div class="profileContainer">
								                <a href="#"> 
								                    <img src="../profileImage/1.jpg" class="replyImg">
								                </a>
								                <p class="review_name reply_space">{{dvo.name}}</p> 
								            </div>
								            <div class="replyBoard">
								                <span style="width: 100%;margin-right: 40px;">{{dvo.content}}</span>
								                <span class="review_time">{{dvo.dbday}}</span>
								            </div>
								        </div>
								        <div class="replyCont_header_left" v-if="dvo.admin=='n'">
								        	<div></div>
								            <div class="adminBoard">
								                <span style="width: 100%;margin-right: 40px;">{{dvo.content}}</span>
								                <span class="review_time">{{dvo.dbday}}</span>
								            </div>
								        </div>  
							        </div>     
							    </div>
							</div>
								<input type="text" ref="content" v-model="content" class="textarea-box" size="35">
								<button class="btn btn-custom btn-right" @click="qnaInsert">보내기</button>
							</b-modal>
								<!-- 모달 끝! -->
						<div style="height: 30px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var updateMyInfo=document.getElementById('updateMyInfoModal')
updateMyInfo.addEventListener('show.bs.modal',function(event){
	
})
new Vue({
	  el: '.container1',
	  data: {
	      infoData:{
	    	  profile_url:''
	      },
	    id:'${sessionScope.id}',
	    name:'${sessionScope.name}',
	    password:'',
	    pwdCheckMessage:'',
	    pwdCheckHelp:'form-text text-muted',
	    vo:{},
	    content:'',
	    qna_detail:[],
	    showModal:false,
	    profileImage:'${sessionScope.profileImage}',
	    myCuponCount:''
	  },
	  mounted() {
	      this.myInfoData();
	      this.myFundCount();
	      this.getCuponData();
	  },
	  methods:{
     myInfoData() {
        axios.get("../mypage/myInfoData.do")
        .then(response => {
            console.log(response.data);
            this.infoData = response.data;
        })
        .catch(error => {
            console.error(error);
        });
     },
     myPwdCheck(){
    	 let formData=new FormData();
    	 formData.append("pwd",this.password);
    	 formData.append("id",this.id);
    	 axios.post("../mypage/myPwdCheck.do",formData)
    	 .then(response=>{
    		 console.log(response.data)
    		 let res=response.data.msg
    		 if(res == 'ok'){
    			 this.password='';
    		 	 location.href="../mypage/my_info_update.do";
    		 } else if (res == 'no'){
					this.password=''
					this.pwdCheckMessage='비밀번호가 틀립니다';
					this.pwdCheckHelp='form-text text-danger';
    		 }
    	 }).catch(error=>{
    		 console.log(error)
    	 })
     },
     myFundCount(){
    	 axios.get("../mypage/myFundCount.do",{
    		 params:{
    			 id:this.id
    		 }
    	 }).then(response=>{
    		 console.log(response.data);
    		 this.vo=response.data
    	 }).catch(error=>{
    		 console.log(error);
    	 })
     },
     qnaInsert(){
    	 axios.post('../mypage/my_qna_admin_vue.do',null,{
    		 params:{
    			 id:this.id,
    			 name:this.name,
    			 content:this.content,
    			 profile_url:this.profileImage
    		 }
    	 }).then(res=>{
					console.log(res.data)
					this.qnaDetail();
					this.content=''
    	 }).catch(error=>{
    		 console.log(error)
    	 })
     },
     qnaDetail(){
    	 axios.get('../mypage/my_qna_admin_data.do',{
    		 params:{
    			 id: this.id
    		 }
    	 }).then(res=>{
    		 console.log(res.data)
    		 this.qna_detail=res.data
    	 }).catch(error=>{
    		 console.log(error)
    	 })
    },
    openModal() {
		   this.showModal = true;
		},
		getCuponData(){
			axios.get('../mypage/my_cupon_count.do',{
				params:{
					id:this.id
				}
			}).then(res=>{
				console.log(res)
				this.myCuponCount = res.data
			}).catch(error=>{
				console.log(error)
			})
		}
   }
});
</script>
</body>
</html>