<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.container{
	max-width: 500px;
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
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row login1">
			<h2>일반 로그인</h2>
		  <div style="margin-bottom: 30px;"></div>
	  	<div class="mb-3">
	  		<input type="text" class="form-control" id="id" ref="id" v-model="id" @input="validateId" style="width: 300px;" placeholder="아이디 입력" required>
	  		<small id="idCheckMessage" :class="idHelpClass" class="form-text">
	  			{{idCheckMessage}}
	  		</small>
	  	</div>
	  	<div class="mb-3">
	  		<input type="password" class="form-control" id="pwd" ref="pwd" v-model="pwd" @input="validatePwd" style="width: 300px;" placeholder="비밀번호 입력" required>
	  		<small id="pwdCheckMessage" :class="pwdHelpClass" class="form-text">
	  			{{pwdCheckMessage}}
	  		</small>
	  	</div>
	  	<div class="mb-3">
	  		<a href="../member/member_join.do">회원가입</a>
	  	</div>
	  	<div class="mb-3">
	  		<button type="button" class="btn btn-outline loginBtn" value="로그인" @click="memberLogin">로그인</button>
	  	</div>
		</div>
		<div class="row login2">
		
		</div>
	</div>
<script>
new Vue({
	el:'.login1',
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
					}).then((response)=>{
						console.log(response.data)
						let res=response.data
						if(res.msg==='noid'){
							this.idCheckMessage="아이디가 존재하지 않습니다."
							this.idHelpClass="form-text text-danger"
							this.$refs.id.focus()
						} else if(res.msg==='nopwd'){
							this.pwdCheckMessage="비밀번호가 틀립니다."
							this.pwdHelpClass="form-text text-danger"
							this.$refs.pwd.focus()
						} else if(res.msg==='emailNotVerified'){
							this.pwdCheckMessage="이메일 인증이 필요합니다."
							this.pwdHelpClass="form-text text-danger"
							this.$refs.pwd.focus()
						} 
						else {
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