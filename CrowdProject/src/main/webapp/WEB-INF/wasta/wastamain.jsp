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
</style>
</head>
<body>
<div class="backgroundGrey">
	<div class="row">
		<div class="wastamain">
		<div style="height: 50px;"></div>
			<div class="follower_container">
				<div class="follower" v-for="vo in friend_list">
					<div class="User">
						<img :src="vo.profile_url" class="followerImg">
						<div class="user_nickname">{{vo.name}}</div>
					</div>
				</div>
			</div>
			
			<div style="height: 30px;"></div>
			<div class="feed_container">
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
									<span>{{rvo.dbday}}{{rvo.id}}${sessionScope.id }</span>
								</div>
							</div>
						</div>
						<div class="card_header_right">
							<button class="btn btn-custom" @click="followInsert('rvo.id')">팔로우</button>
							<button class="imgBtn">
								<img class="morePoint" src="../images/point.png">
							</button>
						</div>
					</section>
					<div class="card_content_wrapper">
						<div class="card_content">
							<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
								<img class="card_content_img" :src="'../reviewImg/'+rvo.imgname" v-if="rvo.imgname!=null">
								<img class="card_content_img" :src="rvo.mainimg" v-if="rvo.imgname==null">						
							</a>
							<hr>
							<div class="card_content_review">
								<p>{{rvo.content}}</p>
							</div>
							<hr>
							<div class="review_item">
							<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
								<img class="item_poster" :src="rvo.mainimg">
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
	new Vue({
		el:'.wastamain',
		data:{
			review_list:[],
			followId:'',
			friend_list:[],
			id:''
		},
		mounted:function(){
			this.wastaList();
			this.friendList();
		},
		methods:{
			wastaList:function(){
				axios.get('../wasta/list_vue.do')
				.then(res=>{
					console.log(res.data)
					this.review_list=res.data
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
			followInsert:function(id){
				axios.get('../wasta/follow_vue.do',{
					params:{
						followId:id,
						id:${sessionScope.id}
					}
				}).then(res=>{
					console.log(res.data)
				}).catch(error=>{
					console.log(error.response)
				})
			}
		}
	})
</script>
</body>
</html>
