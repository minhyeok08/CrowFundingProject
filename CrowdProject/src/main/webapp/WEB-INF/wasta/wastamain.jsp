<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.backgroundGrey{
	background-color: #f9fafb;
}
.wastamain {
	margin: 0px auto;
	width: 550px;
	background-color: #fff;
}
.follower_container{
	display: flex; /* 가로로 배치되도록 설정 */
	flex-direction: row; /* 요소들을 가로로 배치 */
	justify-content: center; /* 가운데 정렬 */
}
.follower {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 0 4px;
	background-color: #fff;
	padding: 0 4px;
	width: 56px;
	height: 74px;
	
}

.followerImg {
	width: 50px;
	height: 50px;
	border-radius: 25px;
	box-sizing: border-box;
}

.user_nickname {
	margin-top: 8px;
	width: 100%;
	text-align: center;
	color: #212529;
	line-height: 18px;
	font-size: 12px;
	font-weight: 400;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.feed_container{
	width: 100%;
	max-height: 1000000px;
}
.feed_card_container{
	display: inline-flex;
    flex-direction: column;
    margin: 0 0 24px;
    width: 100%;
}
.card_header{
	display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    padding: 16px 0;
    width: 100%;
    height: 72px;
}
.card_header_left{
	display: inline-flex;
    position: relative;
    flex-direction: row;
    align-items: center;
    width: 400px;
}
.card_header_title{
	display: inline-flex;
    flex-direction: column;
    margin-left: 8px;
    width: 100%;
}
.reviewerImg{
	width: 50px;
	height: 50px;
	border-radius: 25px;
}
.card_header_sub{
	display: flex;
	font-size: 12px;
}
.card_header_seperator{
	margin-right: 8px;
    border-right: 1px solid #e9ecef;
    padding-left: 8px;
    width: 1px;
    height: 18px;
}
.btn-custom {
    background-color: transparent; 
    border-color: #00b2b2; 
    color: #00b2b2; 
    transition: background-color 0.3s;
   	font-size: 12px;
}
.btn-custom:hover {
    background-color: rgb(234, 248, 249); 
    border-color: #00b2b2; 
    color: #00b2b2;
}

.btn-custom-del {
    background-color: transparent; 
    border-color: #FF3333; 
    color: #FF3333; 
    transition: background-color 0.3s;
   	font-size: 12px;
}
.btn-custom-del:hover {
    background-color: rgb(234, 248, 249); 
    border-color: #FF3333; 
    color: #FF3333;
}
.morePoint{
	width:25px;
	height: 25px;
}
.imgBtn{
	display: inline-block;
    background-color: transparent; /* 배경을 투명하게 설정 */
    border: none;
    padding: 0;
    cursor: pointer;
    transition: background-color 0.3s;
}
.card_content_wrapper{
	border: 1px solid #e9ecef;
    border-radius: 8px;
    max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞게 설정 */
    height: auto; /* 높이를 자동 조정하여 비율 유지 */
}
.card_content{
	margin: 3px;
	max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞게 설정 */
    height:auto; /* 높이를 자동 조정하여 비율 유지 */
}
.card_content_img{
	width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞게 설정 */
    height: auto; /* 높이를 자동 조정하여 비율 유지 */
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    object-fit: contain; 
}
.card_content_review{
    display: flex;
    flex-direction: column;
    align-items: start;
    padding: 0 16px 16px;
    font-size: 13px;
}
.review_item{
	display: flex;
    align-items: center;
    padding: 6px;
    width: 100%;
}
.item_poster{
	position: static;
    transform: none;
    border-radius: 8px;
    width: 70px;
    height: 70px;
    object-fit: cover;
    margin-bottom: 15px;
}
.item_titles{
	display: flex;
    flex-direction: column;
    padding-left: 8px;
    width: 100%;
}
.item_category{
	margin-bottom: 4px;
    line-height: 14px;
    font-size: 10px;
    font-weight: 500;
}
.category_badge{
	margin-top: 5px;
	border: solid 1px #f2f4f6;
    background-color: #f2f4f6;
    color: #495057;
}
.item_title{
	line-height: 18px;
    font-size: 14px;
    font-weight: 400;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    min-height: 36px;
}
.item_subtitle{
	font-size: 11px;
	font-weight: 200;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    min-height: 36px;
   	color: grey;
}
.card_header_act{
	font-size: 14px;
}
.card_header_time{
    color: #adb5bd;
}
.follower.selected .followerImg {
  border: 3px solid #00b2b2; /* 민트색 테두리 */
}

.follower.not-selected {
  opacity: .5; /* 반투명 */
}
</style>
</head>
<body>
<div class="backgroundGrey">
	<div class="row">
		<div class="wastamain">
		<div style="height: 50px;"></div>
		<input type="hidden" ref="id" value="${sessionScope.id }">
			<div class="follower_container">
				<c:if test="${sessionScope.id==null }">
					<div class="follower">
						<div class="User">
							<a href="../member/member_login.do">
								<img src="../images/noprofile.jpeg" class="followerImg">
								<div class="user_nickname">로그인</div>
							</a>
						</div>
					</div>
				</c:if>
				<div class="follower" v-if="sessionId !== null && my_profile !== null"
				     :class="{ 'selected': sessionId === selectedId, 'not-selected': sessionId !== selectedId && selectedId !== null }">
				    <div class="User" @click="selectReview(sessionId)">
				        <img :src="my_profile.profile_url" class="followerImg">
				        <div class="user_nickname">나의 활동</div>
				    </div>
				</div>
				<div class="follower" v-for="vo in limitedFriendList"
				     :class="{ 'selected': vo.id === selectedId, 'not-selected': vo.id !== selectedId && selectedId !== null }">
				    <div class="User" @click="selectReview(vo.id)">
				        <img :src="vo.profile_url" class="followerImg">
				        <div class="user_nickname">{{vo.name}}</div>
				    </div>
				</div>
			</div>
			<div style="height: 30px;"></div>
			<div class="feed_container">
				<div class="feed_card_container" v-if="review_list.length === 0">
					<h1>활동 내역이 없습니다!<br>
						디자인필요
					</h1>
				</div>
				<div class="feed_card_container" v-for="rvo in review_list">
					<section class="card_header">
						<div class="card_header_left">
							<a href="#">
								<img class="reviewerImg" :src="rvo.profile_url">
							</a>
							<div class="card_header_title">
								<div class="card_header_act">
									<div v-if="rvo.nickname==null"><strong>{{rvo.name}}</strong> 님이 리뷰를 남겼어요.</div>
									<div v-if="rvo.nickname!=null"><strong>{{rvo.nickname}}</strong> 님이 리뷰를 남겼어요.</div>
								</div>
								<div class="card_header_sub">
									<span>{{rvo.fcname}} 서포터</span>
									<div class="card_header_seperator"></div>
									<span class="card_header_time">{{rvo.dbday}}</span>
								</div>
							</div>
						</div>
						<div class="card_header_right">
							<%-- <button class="btn btn-custom-del" @click="followInsert(rvo.id)" v-if="rvo.id=='${sessionScope.id }'">리뷰삭제</button> --%>
							<span v-if="rvo.id!='${sessionScope.id }'">
								<button class="btn btn-custom" @click="followInsert(rvo.id)" v-if="supListCheck(rvo.id)">팔로우</button>
								<button class="btn btn-custom-del" @click="followDelete(rvo.id)" v-if="!supListCheck(rvo.id)">언팔로우</button>
							</span>
							<button class="imgBtn">
								<img class="morePoint" src="../images/point.png">
							</button>
						</div>
					</section>
					<div class="card_content_wrapper">
						<div class="card_content">
							<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
							    <template v-if="rvo.imgname!=null">
							        <b-carousel controls background="white">
							            <b-carousel-slide 
							                v-for="(image, index) in rvo.imgname.split('^')" 
							                :key="index"
							                :img-src="'../reviewImg/' + image">
							            </b-carousel-slide>
							        </b-carousel>						
							    </template>
							    <img class="card_content_img" :src="rvo.mainimg" v-if="rvo.imgname==null && rvo.mainimg.startsWith('https')">	
							    <!-- b1313e74-962e-42e3-827c-83a1804f1c72_201426951400762350.jpg -->
							    <img class="card_content_img" :src="'../Fundimages/'+rvo.mainimg" v-if="rvo.imgname==null && !rvo.mainimg.startsWith('https')">	
							</a>
							<hr>
							<div class="card_content_review">
								<p>{{rvo.content}}</p>
							</div>
							<hr>
							<div class="review_item">
							<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
								<img class="item_poster" :src="rvo.mainimg" v-if="rvo.mainimg.startsWith('https')">
								<img class="item_poster" :src="'../Fundimages/'+rvo.mainimg" v-else>
							</a>
								<div class="item_titles">
									<span class="item_category">
									<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
										<span class="category_badge">{{rvo.fcname}}</span>
									</a>
									<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
										<p class="item_title">{{rvo.ftitle}}
											<br><span class="item_subtitle">{{rvo.fsubtitle}}</span>
										</p>
									</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var sessionId = '${sessionScope.id}';
</script>
<script>
	new Vue({
		el:'.wastamain',
		data:{
			review_list:[],
			friend_list:[],
			sup_list:[],
			my_profile:null,
			selectedId: null,
			showModal: false
		},
		mounted:function(){
			this.wastaList();
			this.friendList();
			this.supList();
			this.myProfile();
		},
		methods:{
			openModal() {
		        this.showModal = true;
		    },
		    closeModal() {
		        this.showModal = false;
		    },
			wastaList:function(){
				 axios.get('../wasta/list_vue.do')
	            .then(res=>{
	                console.log(res.data)
	                this.review_list=res.data;
	            }).catch(error=>{
	                console.log(error.response)
	            })
			},
			friendList:function(){
				axios.get('../wasta/friend_vue.do')
				.then(res=>{
					console.log(res.data)
					this.friend_list=res.data
				}).catch(error=>{
					console.log(error.response)
				})
			},
			followInsert:function(followId){
				axios.post('../wasta/follow_vue.do',null,{
					params:{
						followId: followId,
			            id: this.$refs.id.value
					}
				}).then(res=>{
		            console.log(res.data)
		            this.supList();
		        }).catch(error=>{
		            console.log(error.response)
		        })
			},
			followDelete:function(followId){
				axios.post('../wasta/follow_delete_vue.do',null,{
					params:{
						followId: followId,
			            id: this.$refs.id.value
					}
				}).then(res=>{
		            console.log(res.data)
		            this.supList();
		        }).catch(error=>{
		            console.log(error.response)
		        })
			},
			supList:function(){
				axios.get('../wasta/sup_list_vue.do',{
					params:{
						id: this.$refs.id.value
					}	
				}).then(res=>{
					this.sup_list=res.data;
				})
			},
			supListCheck:function(id){
				return !this.sup_list.includes(id);
			},
			myProfile: function() {
			    if (this.$refs.id.value === null) {
			        this.my_profile = {}; // 빈 객체로 초기화
			    } else {
			        axios.get('../wasta/my_vue.do', {
			            params: {
			                id: this.$refs.id.value
			            }
			        }).then(res => {
			        	console.log(res.data)
			            this.my_profile = res.data;
			        }).catch(error => {
			            console.log(error.response);
			        });
			    }
			},
			selectReview:function(sid){
			    if (this.selectedId === sid) {
			        this.selectedId = null;  // Reset selected ID
			        this.wastaList();  // Load the whole list
			    } else {
			        axios.get('../wasta/select_review_vue.do',{
			            params:{
			                sid:sid
			            }
			        }).then(res=>{
			            this.review_list=res.data;
			            this.selectedId = sid;
			        })
			    }
			}
		},
		computed:{
			limitedFriendList:function(){
				return this.friend_list.filter(vo=> vo.id!==this.$refs.id.value)
							.slice(0,7);
			}
		}
	})
</script>
</body>
</html>
