<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.row{
	margin: 0px auto;
	width: 420px;
}
.form-control{
	width: 400
}
.form-control:hover{
	border-color: black;
}
#id,#email,#post,#phone{
	margin-right: 10px;
}
.idCheck, .emailCheck, .postBtn, .phoneCheck{
	border:2px solid #a6d8ce;
	color:#a6d8ce;
}
.idCheck:hover, .emailCheck:hover, .postBtn:hover, .phoneCheck:hover{
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: #fff;
}
.info_birth {
  display: flex;
	width: 350px;
}
.info_birth select {
  margin-left : 7px;
}
.info_birth select:first-child {
  margin-left : 0px;
}
.parentContainer {
    display: flex;
    justify-content: center;
}
.joinBtn {
	border:2px solid #a6d8ce;
	color:#a6d8ce;
	width: 300px;
}
.joinBtn:hover {
	background-color: #a6d8ce;
	border-color: #a6d8ce;
	color: #fff;
}
input::placeholder{
	color: #e5e5e5;
	font-size: 10pt;
	font-style: italic;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row ">
		<!-- 일반 회원가입 -->
		  <h2 class="text-center">일반 회원가입</h2>
		  <div style="margin-bottom: 30px;"></div>
	  	<div class="mb-3">
	  		<label for="id" class="form-label">아이디</label>
	  		<div class="d-flex align-items-center"> 
	  			<input type="text" class="form-control" id="id" v-model="id" style="width: 250px;" :readonly="idReadOnly" required>
	  			<button class="btn btn-outline idCheck" @click="idCheck">아이디 중복 체크</button>
	  		</div>
	  		<small id="idCheckMessage" :class="idHelpClass" class="form-text">
	  			{{ idCheckMessage }}
	  		</small>
	  	</div>
			<div class="mb-3">
        <label for="password" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="password" v-model="password" ref="password">
        <small id="passwordHelp" class="form-text" :class="passwordHelpClass">
            {{ passwordMessage }}
        </small>
       </div>
       <div class="mb-3">
        <label for="confirmPassword" class="form-label">비밀번호 확인</label>
        <input type="password" class="form-control" id="confirmPassword" v-model="confirmPassword" ref="confirmPassword">
        <small id="confirmPasswordHelp" class="form-text" :class="confirmPasswordHelpClass">
            {{ confirmPasswordMessage }}
        </small>
       </div>
			<div class="mb-3">
			  <label for="name" class="form-label">이름</label>
			  <input type="text" class="form-control" ref="name" id="name" v-model="name">
			</div>
			<div class="mb-3">
			  <label for="nickname" class="form-label">닉네임</label>
			  <input type="text" class="form-control" ref="nickname" id="nickname" v-model="nickname">
			</div>
			<div class="mb-3" >
			  <label style="margin-bottom: 10px;">성별</label><br>
			  <label for="male" class="form-check-label">남성</label>
			  <input type="radio"  id="male" value="남성" name="sex" v-model="sex" class="form-check-input" ref="sex">
			  <label for="female" style="margin-left: 20px;" class="form-check-label">여성</label>
			  <input type="radio" id="female" value="여성" name="sex" v-model="sex" class="form-check-input">
			</div>
			<div class="mb-3">
			  <label for="birthday" class="form-label">생년월일</label>
			  <div class="info_birth">
			    <select class="box form-select select-box" id="birthYear">
				    <option disabled selected value="">출생 연도</option>
				  </select>
				  <select class="box form-select select-box" id="birthMonth">
				    <option disabled selected value="">월</option>
				  </select>
				  <select class="box form-select select-box" id="birthDay">
				    <option disabled selected value="">일</option>
				  </select>
				</div>
			</div>
			<div class="mb-3">
			  <label for="email" class="form-label">이메일</label>
			  <div class="d-flex align-items-center">
			   <input type="email" class="form-control" id="email" v-model="email" style="width: 250px;" placeholder="email@gmail.com" :readonly="emailReadOnly" required>
				 <button class="btn btn-outline emailCheck" @click="sendEmail">메일 중복 체크</button>
			  </div>
				<small id="emailHelpClass" class="form-text" :class="emailHelpClass">
					{{emailCheckMessage}}
				</small>
			</div>
			<div class="mb-3">
				<label for="post" class="orm-label">우편번호</label>
				<div class="d-flex align-items-center">
					<input type="text" class="form-control" id="post" v-model="post" style="width: 250px;" readonly="readonly" required>
					<button class="btn btn-outline postBtn" @click="postSearch">우편번호 검색</button>
				</div>
			</div>
			<div class="mb-3">
			  <label for="addr1" class="form-label">주소</label>
			  <input type="text" class="form-control" id="addr1" v-model="addr1" readonly required>
			</div>
			<div class="mb-3">
			  <label for="addr2" class="form-label">상세주소</label>
			  <input type="text" class="form-control" id="addr2" placeholder="선택입력" v-model="addr2">
			</div>
			<div class="mb-3">
			  <label for="phone" class="form-label">연락처</label>
			  <div class="d-flex align-items-center">
				  <input type="text" class="form-control" id="phone" v-model="phone" style="width: 250px;" placeholder="010-1111-1111" :readonly="phoneReadOnly" required>
				  <button class="btn btn-outline phoneCheck" @click="phoneCheck">연락처 중복 체크</button>
				</div>
				<small id="phoneHelpClass" class="form-text" :class="phoneHelpClass">
					{{phoneCheckMessage}}
				</small>
			</div>
			<div class="mb-3">
			  <label for="content" class="form-label">소개</label>
			  <textarea class="form-control" rows="5" cols="55" id="content" v-model="content" required></textarea>
			</div>
			<div class="parentContainer mt-3 mb-4">
			  <button class="btn btn-outline joinBtn" @click="memberJoin" :disabled="isDisabled">회원가입</button>
			</div>
	</div>
</div>
<script>
new Vue({
    el: ".container",
    data: {
    	id:"",
      idCheckMessage:"",
      idHelpClass:"",
      password: "",
      confirmPassword: "",
      passwordMessage: "",
      passwordHelpClass: "form-text text-muted",
      confirmPasswordMessage: "",
      confirmPasswordHelpClass: "form-text text-muted",
      name:"",
      nickname:"",
      sex:"",
      email:"",
      emailCheckMessage:"",
      emailHelpClass:"",
      post:"",
      addr1:"",
      addr2:"",
      phone:"",
      phoneCheckMessage:"",
      phoneHelpClass:"form-text text-muted",
      content:"",
      idChecked:false,
      emailChecked:false,
      phoneChecked:false,
      idReadOnly:false,
      emailReadOnly:false,
      phoneReadOnly:false,
      birthYear:"",
      birthMonth:"",
      birthDay:"",
      isDisabled:false
    },
    mounted(){
        // 출생연도 selectBox option에 목록 동적 생성
        const isbirthYear=document.querySelector('#birthYear')
        const isbirthMonth=document.querySelector('#birthMonth')
        const isbirthDay=document.querySelector('#birthDay')
        // option 목록 생성 여부 확인
        isYearOption=false;
        isMonthOption=false;
        isDayOption=false;

        isbirthYear.addEventListener('focus',function(){
            // 최초 클릭 시
            if(!isYearOption){
                isYearOption=true
                for(var i=1940;i<=2023;i++){
                    // option element 생성
                    const yearOption=document.createElement('option')
                    yearOption.setAttribute('value',i)
                    yearOption.innerText=i
                    // birthYear의 자식 요소로 추가
                    this.appendChild(yearOption)
                }
            }
        })
				isbirthYear.addEventListener("change", () => {
					this.birthYear = isbirthYear.value;
				});
        isbirthMonth.addEventListener('focus',function(){
            if(!isMonthOption){
                isMonthOption=true
                for(var i=1;i<=12;i++){
                    const monthOption=document.createElement('option')
                    monthOption.setAttribute('value',i)
                    monthOption.innerText=i
                    this.appendChild(monthOption)
                }
            }
        })
				isbirthMonth.addEventListener("change", () => {
					this.birthMonth = isbirthMonth.value;
				});
        isbirthDay.addEventListener('focus',function(){
            if(!isDayOption){
                isDayOption=true
                for(var i=1;i<=31;i++){
                    const dayOption=document.createElement('option')
                    dayOption.setAttribute('value',i)
                    dayOption.innerText=i
                    this.appendChild(dayOption)
                }
            }
        })
        isbirthDay.addEventListener("change", () => {
					this.birthDay = isbirthDay.value;
				});
    },
    watch: {
        password: function (val) {
            this.validatePassword(val);
        },
        confirmPassword: function (val) {
            this.validateConfirmPassword(val);
        }
    },
    methods: {
    		// 비밀번호 설정 조건(유효성 검사)
        validatePassword: function (password) {
            const hasUpperCase = /[A-Z]/.test(password);
            const hasLowerCase = /[a-z]/.test(password);
            const hasDigit = /\d/.test(password);
            const hasSpecialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password);

            if (password.length >= 8 && hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar) {
                this.passwordMessage = "비밀번호가 유효합니다.";
                this.passwordHelpClass = "form-text text-success";
                
            } else if(password.trim()===""){
            		 this.passwordMessage = "";
                 this.passwordHelpClass = "form-text text-muted";
            } else {
                this.passwordMessage = "최소 8자 이상, 영문, 숫자, 특수문자를 모두 포함해야 합니다.";
                this.passwordHelpClass = "form-text text-muted";
            }
        },
        // 비밀번호 일치 여부 (유효성검사)
        validateConfirmPassword:function(confirmPassword) {
            if (confirmPassword.trim() === this.password.trim()) {
            	if (this.password.trim() === '') {
           	      this.confirmPasswordMessage = "비밀번호를 입력해주세요.";
           	      this.confirmPasswordHelpClass = "form-text text-danger";
           	    } else {
           	      this.confirmPasswordMessage = "비밀번호가 일치합니다.";
           	      this.confirmPasswordHelpClass = "form-text text-success";
           	    }
            } else if(confirmPassword === ""){
                this.confirmPasswordMessage = "";
                this.confirmPasswordHelpClass = "form-text text-muted";
            } else {
                this.confirmPasswordMessage = "비밀번호가 일치하지 않습니다.";
                this.confirmPasswordHelpClass = "form-text text-danger";
            }
        },
        // 우편번호 찾기
	       postSearch:function(){
	         new daum.Postcode({
	  	       oncomplete: function (data) {
	  	         this.post = data.zonecode;
	  	         this.addr1 = data.address;
	  	       }.bind(this)
	         }).open();
	       },
	       // id 중복여부 체크
	       idCheck:function(){
	    	   // 아이디 정규 표현식
	    	   const validIdPattern =/^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$/;
	    	   if(this.id.trim()===''){
	    		   this.idCheckMessage="아이디를 입력해주세요."
						 this.idHelpClass="form-text text-danger"
	    	   } else if(!validIdPattern.test(this.id)){
	    		   this.idCheckMessage="영문, 숫자 포함해서 입력해주세요."
						 this.idHelpClass="form-text text-info"
	    	   } else {
	    		   axios.get('../member/idCheck.do',{
	       		   params:{
	       			   id:this.id
	       		   }
	       	   }).then(response=>{
	       		   console.log(response.data)
	       		   if(response.data==="no"){
	       			   	this.idCheckMessage="사용 불가능한 아이디 입니다."
	       			   	this.idHelpClass="form-text text-danger"
	       			   	this.idReadOnly=false
	       			   	this.idChecked=false
	       		   } else if(response.data==="yes"){
	       			    this.idCheckMessage="사용 가능한 아이디 입니다."
	       				 	this.idHelpClass="form-text text-success"
	       				 	this.idReadOnly=true
	       				 	this.idChecked=true
	       		   }
	       	   }).catch((error)=>{
	   							console.error(error.response);
	   							this.idCheckMessage="아이디 검사 중 오류가 발생했습니다."
	   							this.idHelpClass="form-text text-danger"
	       	   }) 
	    	   }
	       },
	       // email 중복여부체크
	       sendEmail:function(){
	    	   // 이메일 정규 표현식
	    	   const validEmailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	    	   if(this.email.trim()===''){
	    		   	this.emailCheckMessage="이메일을 입력해주세요."
	    			  this.emailHelpClass="form-text text-danger"
	    	   } else if(!validEmailPattern.test(this.email)){
	    		 	   this.emailCheckMessage="올바른 이메일 형식이 아닙니다."
	       			 this.emailHelpClass="form-text text-info"
	    	   } else {
	    		   axios.get('../member/emailCheck.do',{
								 params:{
	       			   email:this.email
	       		   } 
	       	   }).then(response=>{
	       		   console.log(response.data)
	       		   if(response.data==='no'){
	       			   this.emailCheckMessage="중복된 이메일 입니다."
	       			   this.emailHelpClass="form-text text-danger"
	       			   this.emailReadOnly=false
	       			   this.emaailChecked=false
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
	       // phone 중복 여부 체크
	       phoneCheck:function(){
	    	   // 연락처 정규 표현식
	    	   const validPhonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
	    	   if(this.phone.trim()===''){
	    		   	this.phoneCheckMessage="연락처를 입력해 주세요."
		     			this.phoneHelpClass="form-text text-danger"
	    	 		} else if(!validPhonePattern.test(this.phone)){
	    	 			this.phoneCheckMessage="올바른 연락처 형식이 아닙니다."
	    	     	this.phoneHelpClass="form-text text-info"
	    	 		} else {
	   	     	   axios.get('../member/phoneCheck.do',{
	   	    		   params:{
	   	    			   phone:this.phone
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
	    	 // 회원가입
	    	 memberJoin:function(){
	    		 this.isDisabled=true
	    		 if(!this.idChecked){
	    			 alert("아이디 중복검사를 진행해주세요.")
	    			 this.isDisabled=false
	    			 return;
	    		 }
	    		 if(this.password.trim()===""){
	    			 alert("비밀번호를 입력해주세요")
	    			 this.isDisabled=false
	    			 this.$refs.password.focus()
	    			 return;
	    		 }
	    		 if(this.passwordMessage !== "비밀번호가 유효합니다."){
	    			 alert("유효하지 않은 비밀번호 입니다.")
	    			 this.isDisabled=false
	    			 this.$refs.password.focus()
	    			 return;
	    		 }
	    		 if(this.password!==this.confirmPassword || this.confirmPassword===""){
	    			 alert("비밀번호 확인을 진행해주세요")
	    			 this.isDisabled=false
	    			 this.$refs.confirmPassword.focus()
	    			 return;
	    		 }
	    		 if(this.name===""){
	    			 alert("이름을 입력해주세요.")
	    			 this.isDisabled=false
	    			 this.$refs.name.focus()
	    			 return;
	    		 } 
	    		 if(this.nickname===""){
	    			 alert("닉네임을 입력해주세요.")
	    			 this.isDisabled=false
	    			 this.$refs.nickname.focus()
	    			 return;
	    		 } 
	    		 if(this.sex===""){
	    			 alert("성별을 선택해주세요.")
	    			 this.isDisabled=false
	    			 this.$refs.sex.focus()
	    			 return;
	    		 }
	    		 if(this.birthYear==="" || this.birthMonth==="" || this.birthDay===""){
	    			 alert("생년월일을 선택해주세요")
	    			 this.isDisabled=false
	    			 return;
	    		 }
	    		 if (!this.emailChecked){
	    			 alert("이메일 중복검사를 진행해주세요.")
	    			 this.isDisabled=false
	    			 return;
	    		 } 
	    		 if(this.post==="" || this.addr1===""){
	    			 alert("주소검색을 진행해주세요")
	    			 this.isDisabled=false
	    			 this.$refs.post.focus()
	    			 return;
	    		 }
	    		 if (!this.phoneChecked){
	    			 alert("연락처 중복검사를 진행해주세요.")
	    			 this.isDisabled=false
	    			 return;
	    		 } 
	    		 axios.post('../member/join.do',null,{
	    			 params:{
	    				 id: this.id,
	    				 pwd: this.password,
	    				 name: this.name,
	    				 nickname: this.nickname,
	    				 sex: this.sex,
	    				 birthday: this.birthYear + "-" + this.birthMonth + "-" + this.birthDay,
	    				 email: this.email,
	    				 post: this.post,
	    				 addr1: this.addr1,
	    				 addr2: this.addr2,
	    				 phone: this.phone,
	    				 content: this.content
	    			 }
	    		 }).then((response)=>{
	    			 console.log(response)
	    			 let res=response.data;
	    			 if(res==='no'){
	    				 alert("회원가입 실패");
	    				 this.isDisabled=false
	    				 return;
	    			 } else {
	    				 location.href="../member/join_temp.do";
	    			 }
	    		 }).catch((error)=>{
	    			 console.log(error)
	    		 })
    	 }
    }
});
</script>
</body>
</html>