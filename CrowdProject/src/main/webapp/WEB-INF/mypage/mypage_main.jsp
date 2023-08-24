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
.modal-content{
	margin : 0px auto;
	width: 300px;
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
								<p style="display: flex; justify-content: space-between; align-items: center; margin:0px;">
									<strong>쿠폰</strong>
									<span style="text-align:right; margin-left: auto; margin-right:10px;">0장</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="row">
							<div class="col-sm-6">
								<div class="row myfunding mt-3">
									<p style="display: flex; justify-content: space-between; align-items: center; margin:0px;">
										<strong>참여펀딩</strong>
										<span style="text-align:right; margin-left: auto; margin-right:10px;">0건</span>
									</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="row myfunding mt-3">
									<p style="display: flex; justify-content: space-between; align-items: center; margin:0px;">
										<strong>스토어</strong>
										<span style="text-align:right; margin-left: auto; margin-right:10px;">0건</span>
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
 							<div class="myjjim mt-3">
 								<a href="#">찜하기</a>
 							</div>
 						</div>
 						<div style="height: 30px;border-bottom: 0.7px solid #d3d3d3;"></div>
						<!-- 나의 문의 -->
						<div class="row mt-4">
						<strong>${sessionScope.name } 님 문의</strong>
							<!-- 메이커 문의 -->
							<div class="col-sm-6 makerqna mt-3">
								<a href="#">메이커 문의</a>
							</div>
							<!-- 관리자 문의 -->
							<div class="col-sm-6 myqna mt-3">
								<a href="#">관리자 문의</a>
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
	    password:'',
	    pwdCheckMessage:'',
	    pwdCheckHelp:'form-text text-muted'
	  },
	  mounted() {
	      this.myInfoData();
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
     }
   }
});
</script>
</body>
</html>