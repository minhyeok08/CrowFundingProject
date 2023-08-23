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
.updatMyInfo input{
	width: 300px;
	margin-bottom: 10px;
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
		<h4>프로필 정보 설정</h4>
		<div class="profileImage-wrap">
			<p>프로필 사진</p>
			<img class="profileImage mb-3" v-if="filename !== ''" :src="filename" style="margin: 0px auto;"><br>
			<button @click="selectFile" type="button" class="btn">변경</button>
			<button @click="deleteImage" type="button" class="btn">삭제</button>
		</div>
		<form @submit.prevent="submitform">
		<div class="mb-3 updatMyInfo">
			<input type="file" ref="profileInsert" v-model="profileInsert" @change="previewImage" style="display:none;margin-bottom: 10px;">
			<label class="form-text">아이디</label>
			<input type=text class="form-control" :value="id" disabled>
			<label class="form-text">이름</label>
			<input type=text class="form-control" v-model="vo.name">
			<label class="form-text">이메일</label>
			<input type=text class="form-control" v-model="vo.email">
			<label class="form-text">휴대폰</label>
			<input type=text class="form-control" v-model="vo.phone">
			<div class="wrap btnClass" style="display: flex;justify-content: center;">
				<input type="submit" class="btn" id="submitBtn" value="완료">
				<button id="cancelBtn" class="btn" @click="cancelBtn">취소</button>
			</div>
		</div>
		</form>
	</div>
</div>
<script>
var json='${json}';
new Vue({
	el:'.container',
	data:{
		profileInsert:'',
		filename: JSON.parse(json).profile_url, // db에 저장된 filedata
		id:'${sessionScope.id}',
		profile_file:{},
		vo:JSON.parse(json)
	},
	mounted: function() {
		
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
		submitform:function(){
			let formData=new FormData();
			const file = this.$refs.profileInsert.files[0];
		  formData.append("image", file);
			formData.append("id",this.id);
			formData.append("name",this.vo.name);
			formData.append("email",this.vo.email);
			formData.append("phone",this.vo.phone);
			axios.post("../mypage/profileImage_insert_ok.do",formData,{
				headers:{
					"Content-Type":"multipart/form-data"
				}
			}).then(response=>{
				console.log(response)
				/* this.profile_file=response.data
				this.fileUrl=response.data.profile_file.profile_url */
				location.href="../mypage/mypage_main.do";
			}).catch(error=>{
				console.error("Error uploading profile Image:",error)
			})
		},
		selectFile:function(){
		     this.$refs.profileInsert.click();
		},
		deleteImage:function(){
		   this.filename = '../images/1.jpg'; // 기본 이미지 경로로 설정
		   this.profileInsert = ''; // input file 초기화
		},
		cancelBtn:function(){
			location.href="../mypage/mypage_main.do"
		}
	}
})
</script>
</body>
</html>
