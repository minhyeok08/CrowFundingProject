<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	margin-top: 50px;
	max-width: 700px;
	text-align: center;
}
.nav-tabs .nav-link {
    color: black !important;
}
#inputEmailId, #inputEmailPwd{
	margin: 0px auto;
	width: 400px;
}
.btn-custom {
	border:2px solid #a6d8ce;
	color:#a6d8ce;
}
.btn-custom:hover {
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: #fff;
}
.result p{
	font-size: 13pt;
}
</style>
</head>
<body>

	<div class="container">
		<h2>아이디 ∙ 비밀번호 찾기</h2>
		<div style="margin-bottom: 30px;"></div>
		<div class="mb-2">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
			    <button class="nav-link active" id="findID-tab" data-bs-toggle="tab" data-bs-target="#findID"
			    	type="button" role="tab" aria-controls="findID" aria-selected="true">아이디 찾기</button>
			    <button class="nav-link" id="findPwd-tab" data-bs-toggle="tab" data-bs-target="#findPwd"
			    	type="button" role="tab" aria-controls="findPwd" aria-selected="false">비밀번호 찾기</button>
		  	</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<!-- id찾기 -->
			  <div class="tab-pane fade show active" id="findID" role="tabpanel" aria-labelledby="findId-tab">
			  	<div class="findID mt-3">
			  		<p class="form-label mb-5">회원가입 시 입력한 이메일을 입력해주세요</p>
			  		<input type="text" class="form-control mb-3" id="inputEmailId" placeholder="이메일 입력" v-model="inputEmailId" ref="inputEmailId">
			  		<button type="button" class="btn btn-md btn-custom" @click="findId">아이디 검색</button>
			  		<div v-if="findIdHelpMessage" class="form-text" :class="findIdHelpClass">
			  			<div class="result mt-4">
			  				<p>{{findIdHelpMessage}}</p>
			  			</div>
			  		</div>
			  	</div>
			  </div>
			  <!-- pwd찾기 -->
			  <div class="tab-pane fade" id="findPwd" role="tabpanel" aria-labelledby="findPwd-tab">
			  	<div class="findpwd mt-3">
			  		<p class="form-label mb-5">
			  		회원가입 시 입력한 이메일을 작성해주세요.<br>
			  		임시 비밀번호를 발송해드립니다.
			  		</p>
			  		<input type="text" class="form-control mb-3" id="inputEmailPwd" placeholder="이메일 입력" v-model="inputEmailPwd" ref="inputEmailPwd">
			  		<button type="button" class="btn btn-md btn-custom" @click="sendEmail" :disabled="isDisabled">이메일 전송</button>
			  		<div v-if="sendEmailMessage" class="form-text" :class="snedEmailHelpClass">
			  			<div class="result mt-4">
			  				<p>{{sendEmailMessage}}</p>
			  			</div>
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
		inputEmailId:'',
		findIdHelpMessage:'',
		findIdHelpClass:'form-text text-muted',
		inputEmailPwd:'',
		sendEmailMessage:'',
		snedEmailHelpClass:'form-text text-mute',
		isDisabled:false
	},
	methods:{
		findId:function(){
			if(this.inputEmailId.trim()==''){
				this.$refs.inputEmailId.focus()
				return;
			}

			axios.get("../member/id_find.do",{
				params:{
					email:this.inputEmailId.trim()
				}
			}).then(response=>{
				let res=response.data
				console.log(res)
				if(res=="noemail"){
					this.findIdHelpMessage="등록된 이메일이 없습니다"
					this.findIdHelpClass="form-text text-danger"
					this.$refs.inputEmailId.focus()
					return;
				} else {
					this.findIdHelpMessage=res;
					this.findIdHelpClass="form-text text-muted"
				}
			}).catch(error=>{
				console.log(error.response)
				this.findIdHelpMessage="아이디 찾기 중 오류가 발생했습니다"
				this.findIdHelpClass="form-text text-danger"
			})
		},
		sendEmail:function(){
			if(this.inputEmailPwd.trim()==''){
				this.$refs.inputEmailPwd.focus()
				return;
			}
			this.isDisabled = true;
			axios.get('../member/pwd_send_email.do',{
				params:{
					email:this.inputEmailPwd.trim()
				}
			}).then(response=>{
				const res=response.data
				if(res=='noemail'){
					this.sendEmailMessage="등록된 이메일이 없습니다"
					this.snedEmailHelpClass="form-text text-danger"
					this.$refs.inputEmailPwd.focus()
					return;
					this.isDisabled = false;
				} else {
					alert("이메일 발송이 완료되었습니다")
					this.inputEmailPwd=""
					this.sendEmailMessage=""
					this.snedEmailHelpClass="form-text text-muted"
					this.isDisabled = false;
				}
			}).catch(error => {
          console.log(error.response);
          this.sendEmailMessage = "이메일 발송 중 오류가 발생했습니다";
          this.snedEmailHelpClass = "form-text text-danger";
          this.isDisabled = false; // 오류 발생 시에도 버튼 활성화
	    });
		}
	}
})
</script>
</body>
</html>