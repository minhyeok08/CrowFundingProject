<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 330px;
}
.profileImage{
	border-radius: 50%;
	width: 100px;
	height: 100px;
}
.emailCheckDiv > input {
	width: 200px;
}
.phoneCheckDiv > input{
	width: 200px;
}
.updatMyInfo > div > input{
	width: 300px;
}
.emailCheckBtn, .phoneCheck{
	width: 100px;
	border:2px solid #a6d8ce;
	color:#a6d8ce;
	padding: 5px;
}
.emailCheckBtn:hover, .phoneCheck:hover{
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: #fff;
}
.modal-body{
	margin: 0px auto;
	width: 310px;
}
.modal-body input {
	margin: 0px auto;
}
.updatePwdModalBtn{
	width: 300px;
	border:2px solid #a6d8ce;
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: #fff;
}
.updatePwdModalBtn:hover{
	width: 300px;
	border:2px solid #a6d8ce;
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: black;
}
.closeBtn:hover, .changeBtn:hover{
	border: 1px solid #d3d3d3;
}
#submitBtn, #cancelBtn{
	padding: 0px;
	width: 100px;
	height: 40px;
	margin: 5px;
	border: 1px solid #d3d3d3;
}
#submitBtn:hover, #cancelBtn:hover{
	border: 1px solid black;
}
</style>
</head>
<body>
<div class="wrap">
	<div class="container mt-5">
		<h3>프로필 정보 설정</h3>
		<div class="profileImage-wrap mt-4">
			<p>프로필 사진</p>
			<div class="wrap text-center">
				<img class="profileImage mb-3" v-if="filename" :src="filename"><br>
				<button @click="selectFile" type="button" class="btn">변경</button>
			</div>
		</div>
		<form @submit.prevent="submitform">
		<div class="mb-3 updatMyInfo">
			<input type="file" ref="profileInsert" v-model="profileInsert" @change="previewImage" style="display:none;margin-bottom: 10px;">
			<div class="wrap">
				<label class="form-text">아이디</label>
				<input type=text class="form-control" id="id" :value="id" disabled>
			</div>
			
			<!-- 비밀번호 변경 모달 START -->
			<div class="mt-1"></div>
      <button type="button" class="btn updatePwdModalBtn" data-bs-toggle="modal" data-bs-target="#pwdUpdate">비밀번호 변경</button>
			<div class="modal fade" id="pwdUpdate" tabindex="-1" aria-labelledby="pwdUpdateLabel" aria-hidden="true" data-bs-backdrop="static">
      	<div class="modal-dialog">
      		<div class="modal-content">
      			<div class="modal-header">
      				<h5 class="modal-title" id="pwdUpdateLabel">비밀번호 변경</h5>
      			</div>
      			<div class="modal-body">
      				<form>
      					<div class="mb-3">
      						<label for="nowPwd" class="col-form-label">현재 비밀번호</label>
      						<input type="password" class="form-control" id="nowPwd" v-model="nowPwd" ref="nowPwd">
      						<small id="pwdCheckMessage" :class="pwdCheckHelp" class="form-text">
      							{{pwdCheckMessage}}
      						</small>
      					</div>
      					<div class="mb-3">
      						<label for="newPwd" class="col-form-label">새 비밀번호</label>
      						<input type="password" class="form-control" id="newPwd" v-model="newPwd" ref="newPwd">
      						<small id="passwordHelp" class="form-text" :class="passwordHelpClass">
					            {{ passwordMessage }}
					        </small>
      					</div>
      					<div class="mb-3">
      						<label for="newPwdConfirm" class="col-form-label">새 비밀번호 확인</label>
      						<input type="password" class="form-control" id="newPwdConfirm" v-model="newPwdConfirm" ref="newPwdConfirm">
				      		<small id="confirmPasswordHelp" class="form-text" :class="confirmPasswordHelpClass">
				            {{ confirmPasswordMessage }}
				        	</small>
      					</div>
      				</form>
      			</div>
      			<div class="modal-footer">
      				<p style="font-size: 11px;">변경 버튼을 누르면 비밀번호가 바로 변경됩니다.</p>
      				<button type="button" class="btn closeBtn" data-bs-dismiss="modal">취소</button>
      				<button type="button" class="btn changeBtn" @click="changePwd">변경</button>
      			</div>
      		</div>
      	</div>
      </div>
      <!-- 비밀번호 변경 모달 END -->
			
			<div class="wrap">
				<label class="form-text">이름</label>
				<input type=text class="form-control" id="inputname" v-model="vo.name" ref="name">
			</div>
			<div class="wrap">
				<label class="form-text">닉네임</label>
				<input type=text class="form-control" id="nickname" v-model="vo.nickname" ref="nickname">
			</div>
			<!-- 이메일 -->
			<label class="form-text">이메일</label>
			<div class="wrap d-flex emailCheckDiv">
				<input type=text class="form-control" v-model="vo.email" ref="email" placeholder="email@gmail.com" :readonly="emailReadOnly">&nbsp;
				<button type="button" class="btn btn-outline emailCheckBtn" @click="sendEmail">중복 체크</button>
			</div>
			<div class="wrap">
				<small id="emailHelpClass" class="form-text" :class="emailHelpClass">
					{{emailCheckMessage}}
				</small>
			</div>
			<!-- 휴대폰 -->
			<label class="form-text">휴대폰</label>
			<div class="wrap d-flex phoneCheckDiv">
				<input type=text class="form-control" v-model="vo.phone" ref="phone" placeholder="010-1111-1111" :readonly="phoneReadOnly">&nbsp;
				<button type="button" class="btn btn-outline phoneCheck" @click="phoneCheck">중복 체크</button>
			</div>
			<div class="wrap">
				<small id="phoneHelpClass" class="form-text" :class="phoneHelpClass">
					{{phoneCheckMessage}}
				</small>
			</div>
			<div class="wrap">
			<label class="form-text">소개</label><br>
			<textarea rows="5" cols="32" v-model="vo.content">
			{{vo.content}}
			</textarea>
			</div>
			<div class="wrap btnClass mt-4" style="display: flex;justify-content: center;">
				<input type="submit" class="btn" id="submitBtn" value="완료">
				<button id="cancelBtn" class="btn" @click="cancelBtn">취소</button>
			</div>
		</div>
		</form>
	</div>
	<div style="height: 30px;"></div>
</div>
<script>
var json='${json}';
var passwordUpdate=document.getElementById('pwdUpdate')
passwordUpdate.addEventListener('show.bs.modal',function(event){
	
})
new Vue({
	el:'.container',
	data:{
		profileInsert:'',
		filename:'',
		id:'${sessionScope.id}',
		profile_file:{},
		vo:JSON.parse(json),
		nowPwd:"",
		newPwd:"",
		newPwdConfirm:"",
		pwdCheckMessage:"",
		pwdCheckHelp:"text-form text-muted",
		passwordMessage:"",
		passwordHelpClass:"text-form text-muted",
		confirmPasswordMessage:"",
		confirmPasswordHelpClass:"text-form text-muted",
		emailCheckMessage:"",
		emailHelpClass:'text-form text-muted',
		emailReadOnly:false,
		emailChecked:false,
		phoneHelpClass:'text-form text-muted',
		phoneCheckMessage:'',
		phoneReadOnly:false,
		phoneChecked:false,
		initEmail:'',
		initPhone:''
	},
	mounted:function(){
		this.filename= JSON.parse(json).profile_url;
		this.initEmail=JSON.parse(json).email
		this.initPhone=JSON.parse(json).phone
	},
	watch:{
		newPwd:function(val){
			this.validatePwd(val);
		},
		newPwdConfirm:function(val){
			this.validateConfrimPwd(val);
		}
	},
	methods:{
		previewImage: function(event) {
			const file = event.target.files[0];
			if (file) {
				let reader = new FileReader();
				reader.onload = (e) => {
					this.filename = e.target.result;
				};
				reader.readAsDataURL(file);
			}
		},
		// 새 비밀번호 유효성 검사
		validatePwd:function(newPwd){
			const hasLowerCase = /[a-z]/.test(newPwd);
      const hasDigit = /\d/.test(newPwd);
      const hasSpecialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(newPwd);
      
      if (newPwd.length >= 8 && hasLowerCase && hasDigit && hasSpecialChar) {
          this.passwordMessage = "비밀번호가 유효합니다.";
          this.passwordHelpClass = "form-text text-success";
          
      } else if(newPwd.trim()===""){
      		 this.passwordMessage = "";
           this.passwordHelpClass = "form-text text-muted";
      } else {
          this.passwordMessage = "최소 8자 이상, 영문, 숫자, 특수문자를 모두 포함해야 합니다.";
          this.passwordHelpClass = "form-text text-muted";
      }
		},
		// 새 비밀번호 일치 여부 검사
		validateConfrimPwd:function(newPwdConfirm){
			if(this.newPwdConfirm.trim() === this.newPwd.trim()){
				if(this.newPwd.trim()===""){
					this.passwordMessage = "비밀번호를 입력해주세요.";
  	      this.passwordHelpClass = "form-text text-danger";
  	      return;
				} else{
   	      this.confirmPasswordMessage = "비밀번호가 일치합니다.";
   	      this.confirmPasswordHelpClass = "form-text text-success";
				}
			} else if(this.newPwdConfirm.trim() === ""){
				this.confirmPasswordMessage = "";
		    this.confirmPasswordHelpClass = "form-text text-muted";
			} else {
	      this.confirmPasswordMessage = "비밀번호가 일치하지 않습니다.";
	      this.confirmPasswordHelpClass = "form-text text-danger";
			}
		},
		sendEmail:function(){
  	   // 이메일 정규 표현식
  	   const validEmailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
  	   
  	   if(this.vo.email==""){
  		   	this.emailCheckMessage="이메일을 입력해주세요."
  			  this.emailHelpClass="form-text text-danger"
  			  return;
  	   }
  	   if(!validEmailPattern.test(this.vo.email)){
  		 	  this.emailCheckMessage="올바른 이메일 형식이 아닙니다."
     			this.emailHelpClass="form-text text-info"
     			return;
  	   }
  	   if(this.initEmail == this.vo.email){
				this.emailChecked=true
 			  this.emailCheckMessage="";
 	     	this.emailHelpClass="form-text text-muted"
 			  return;
  	   }
			if(validEmailPattern.test(this.vo.email)){
  		   axios.get('../mypage/emailCheck.do',{
					 params:{
     			   email:this.vo.email
     		   }
     	   }).then(response=>{
     		   console.log(response.data)
     		   if(response.data==='no'){
     			   this.emailCheckMessage="중복된 이메일 입니다."
     			   this.emailHelpClass="form-text text-danger"
     			   this.vo.email=""
     			   this.emailReadOnly=false
     			   this.emailChecked=false
     		   } else if(response.data==='yes'){
     			   this.emailCheckMessage="사용 가능한 이메일 입니다."
     			   this.emailHelpClass="form-text text-success"
     			   this.emailReadOnly=true
     			   this.emailChecked=true
     		   }
     	   }).catch((error)=>{
						console.error(error.response);
						this.emailCheckMessage="이메일 검사 중 오류가 발생했습니다."
						this.emailHelpClass="form-text text-danger"
     	   })
  	   }
     },
		phoneCheck:function(){
		  // 연락처 정규 표현식
			const validPhonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
			if(this.initPhone == this.vo.phone){
				this.phoneCheckMessage=""
				this.phoneHelpClass="form-text text-muted"
				this.phoneChecked=true
				return;
			}
			if(this.vo.phone == ""){
			  	this.phoneCheckMessage="연락처를 입력해 주세요."
					this.phoneHelpClass="form-text text-danger"
					return;
				} else if(!validPhonePattern.test(this.vo.phone)){
					this.phoneCheckMessage="올바른 연락처 형식이 아닙니다."
			   	this.phoneHelpClass="form-text text-info"
			   	return;
				} else {
			  	   axios.get('../mypage/phoneCheck.do',{
			 		   params:{
			 			   phone:this.vo.phone
			 		   }
			  }).then(response=>{
			   console.log(response.data)
				   if(response.data==='no'){
					   this.phoneCheckMessage="중복된 연락처 입니다."
						   this.phoneHelpClass="form-text text-danger"
						   this.phoneReadOnly=false
						   this.phoneChecked=false
					   } else if(response.data==='yes'){
						   this.phoneCheckMessage="사용 가능한 연락처 입니다."
						   this.phoneHelpClass="form-text text-success"
						   this.phoneReadOnly=true
						   this.phoneChecked=true
					   }
			  }).catch((error)=>{
				  console.error(error.response);
			   	this.phoneCheckMessage="연락처 검사 중 오류가 발생했습니다."
						this.phoneHelpClass="form-text text-danger"
			  })
			}
		},
		submitform:function(){
			// 이름 필수 입력!
			if(this.vo.name.trim()==""){
				this.$refs.name.focus();
				return;
			}
			if(this.initEmail == this.vo.email){
				this.emailChecked=true
			}
			this.sendEmail();
			
			if(this.initPhone == this.vo.phone){
				this.phoneChecked=true
			}
			this.phoneCheck();
			
			if(!this.emailChecked){
	   			 alert("이메일 중복검사를 진행해주세요.")
	   			 return;
	   		 }
	   		 if(!this.phoneChecked){
	   			 alert("연락처 중복검사를 진행해주세요.")
	   			 return;
	   		 }
			
			let formData=new FormData();
			const file = this.$refs.profileInsert.files[0];
			if(file) {
        formData.append("image", file); // 파일이 있는 경우 첨부
	    }
			formData.append("id",this.id);
			formData.append("name",this.vo.name);
			formData.append("nickname",this.vo.nickname);
			formData.append("email",this.vo.email);
			formData.append("phone",this.vo.phone);
			formData.append("content",this.vo.content);
			axios.post("../mypage/update_my_info.do",formData,{
				headers:{
					"Content-Type":"multipart/form-data"
				}
			}).then(response=>{
				console.log(response)
				location.href="../mypage/mypage_main.do";
			}).catch(error=>{
				console.error("Error:",error)
			})
		},
		selectFile:function(){
		     this.$refs.profileInsert.click();
		},
		cancelBtn:function(){
			location.href="../mypage/mypage_main.do"
		},
		changePwd:function(){
			if(this.nowPwd.trim()===""){
				this.pwdCheckMessage="비밀번호를 입력해주세요"
				this.pwdCheckHelp="form-text text-danger"
				this.$refs.nowPwd.focus();
				return;
			}
			if(this.passwordMessage != "비밀번호가 유효합니다."){
				this.passwordMessage = "최소 8자 이상, 영문, 숫자, 특수문자를 모두 포함해야 합니다.";
			   this.passwordHelpClass = "form-text text-muted";
			   this.$refs.newPwd.focus();
			   return;
			}
			if(this.newPwd !== this.newPwdConfirm || this.newPwdConfirm===""){
				alert("비밀번호 확인을 진행해주세요")
				this.$refs.newPwdConfirm.focus();
				return;
			}
			let formData=new FormData();
			formData.append("pwd",this.nowPwd)
			formData.append("newPwd",this.newPwd)
			formData.append("id",this.id)
			axios.post('../mypage/pwd_update_ok.do',formData)
			.then(response=>{
					console.log(response.data)
					if(response.data=="nopwd"){
						this.pwdCheckHelp="form-text text-danger"
						this.pwdCheckMessage="비밀번호가 틀립니다."
						this.$refs.nowPwd.focus()
						return;
					}	else {
					      alert("비밀번호 변경이 완료되었습니다.");
					      // 모달 창 닫기
					      var myModalEl = document.getElementById('pwdUpdate');
					      var modal = bootstrap.Modal.getInstance(myModalEl);
					      modal.hide();
					      
					      // 비밀번호 입력창 초기화
					      this.nowPwd = '';
					      this.newPwd = '';
					      this.newPwdConfirm = '';
					 }
			  }).catch(error=>{
			    console.log(error);
			}).catch(error=>{
				console.log(error)
			})
		}
	}
})
</script>
</body>
</html>
