<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	max-width: 350px;
}
.login1{
	margin: 0px auto;
	max-width: 400px;
}
.loginBtn {
	border:2px solid #a6d8ce;
	color:#a6d8ce;
	margin-top: 10px;
	width: 300px;
}
.loginBtn:hover {
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: #fff;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="wrap login mt-5">
				<h2>일반 로그인</h2>
			  <div style="margin-bottom: 30px;"></div>
		  	<div class="mb-3">
		  		<input type="text" class="form-control" id="id" ref="id" v-model="id" @input="validateId" style="width: 300px;" @keyup.enter="memberLogin" placeholder="아이디 입력" required>
		  		<small id="idCheckMessage" :class="idHelpClass" class="form-text">
		  			{{idCheckMessage}}
		  		</small>
		  	</div>
		  	<div class="mb-3">
		  		<input type="password" class="form-control" id="pwd" ref="pwd" v-model="pwd" @input="validatePwd" @keyup.enter="memberLogin" style="width: 300px;" placeholder="비밀번호 입력" required>
		  		<small id="pwdCheckMessage" :class="pwdHelpClass" class="form-text">
		  			{{pwdCheckMessage}}
		  		</small>
		  	</div>
		  	<div class="mb-3">
		  		<a href="../member/member_join.do">회원가입</a>
		  	</div>
		  	<div class="mb-3">
		  		<a href="../member/id_pwd_find.do">아이디/비밀번호 찾기</a>
		  	</div>
		  	<div class="mb-3">
		  		<button type="button" class="btn btn-outline loginBtn" value="로그인" @click="memberLogin">로그인</button>
		  	</div>
			</div>
		</div>
		<div class="row login2">
		
		</div>
	</div>
<script>
new Vue({
	el:'.login',
	data:{
		id:"",
		pwd:"",
		idCheckMessage:"",
		idHelpClass:"form-text text-muted",
		pwdCheckMessage:"",
		pwdHelpClass:"form-text text-muted"
	},
	methods:{
		validateId(){
			if (this.id.trim()==='') {
	        this.idCheckMessage='아이디 입력이 필요합니다.';
	        this.idHelpClass='form-text text-danger';
	    } else {
	    	this.idCheckMessage = '';
	    	this.idHelpClass="form-text text-muted"
	    }
		},
		validatePwd(){
	    if (this.pwd.trim()==='') {
	        this.pwdCheckMessage='비밀번호 입력이 필요합니다.';
	        this.pwdHelpClass='form-text text-danger';
	    } else {
	    	this.pwdCheckMessage="";
	    	this.pwdHelpClass="form-text text-muted"
	    }
		},
		memberLogin:function(){
			if(this.id.trim()===''){
				this.validateId();
			}
			if(this.pwd.trim()===''){
				this.validatePwd();
			} else {
					axios.post('../member/login_ok.do',null,{
						params:{
							id:this.id,
							pwd:this.pwd
						}
					}).then(response=>{
						console.log(response.data)
						let res=response.data
						if(res.msg==='noid'){
							this.idCheckMessage="아이디가 존재하지 않습니다."
							this.idHelpClass="form-text text-danger"
							this.$refs.id.focus()
							return;
						} else if(res.msg==='nopwd'){
							this.pwdCheckMessage="비밀번호가 틀립니다."
							this.pwdHelpClass="form-text text-danger"
							this.$refs.pwd.focus()
							return;
						} else if(res.msg==='emailNotVerified'){
							this.pwdCheckMessage="이메일 인증이 필요합니다."
							this.pwdHelpClass="form-text text-danger"
							this.$refs.pwd.focus()
							return;
						} else {
							location.href="../main/main.do";
						}
					}).catch((error)=>{
						console.log(error.response)
					})
				}
			}
		}
	})
</script>
</body>
</html>