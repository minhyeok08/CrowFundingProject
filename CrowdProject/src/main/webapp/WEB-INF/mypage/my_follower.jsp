<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.myFollowingWrap{
	width: 400px;
	margin: 0px auto;
}
#myFollowingTitle{
	font-size: 20pt;
}
.profileImg{
	width: 50px;
	height: 50px;
	border-radius: 50%;
}
.btn-custom-del {	
	width : 60px;
	height: 40px;
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
.selectBtn{
	width: 100px;
	height: 30px;
	border: 0.5px solid #00c4c4;
	background-color: transparent;
	margin: 0px 10px;
	padding: 2px;
}
.selectBtn:hover{
	background-color: #00c4c4;
	border-color: #00c4c4;
}
</style>
</head>
<body>
	<div class="wrap myFollowingWrap">
		<div class="row mt-5">
			<strong id="myFollowingTitle">팔로잉</strong>
		</div>
		<div class="row mt-4">
			<button class="btn selectBtn" @click="getSupportFollowData">서포터</button>
			<button class="btn selectBtn">메이커</button>
		</div>
		<div class="wrap mt-5 supportFollow" v-show="showSupportFollow">
			<div class="row mt-2" v-for="vo,index in follow_data" style="border-bottom: 0.7px solid #d3d3d3;padding: 5px;">
				<div class="col-sm-4">
					<img class="profileImg" :src="vo.profile_url">
				</div>
				<div class="col-sm-6" style="display:flex; align-items: center; ">
					<span style="">{{vo.id}}</span>
				</div>
				<div class="col-sm-2">
					<button class="btn btn-custom-del" @click="followDelete(vo.followId)">언팔로우</button>
				</div>
			</div>
		</div>
	</div>
<script>
var sessionId='${sessionScope.id}';
new Vue({
	el:'.myFollowingWrap',
	data:{
		id:sessionId,
		follow_data:[],
		showSupportFollow:false
	},
	mounted(){
		this.getSupportFollowData();
	},
	methods:{
		getSupportFollowData(){
			axios.get('../mypage/my_follow_vue.do',{
				params:{
					id:this.id
				}
			}).then(response=>{
				console.log(response.data)
				this.follow_data=response.data
				this.showSupportFollow=true;
			}).catch(error=>{
				console.log(error)
			})
		},
		followDelete(followId){
			axios.post('../wasta/follow_delete_vue.do',null,{
				params:{
					followId: followId,
		      id: this.id
				}
			}).then(res=>{
	            console.log(res.data)
	            this.getSupportFollowData();
	        }).catch(error=>{
	            console.log(error.response)
	        })
		}
	}
})
</script>
</body>
</html>