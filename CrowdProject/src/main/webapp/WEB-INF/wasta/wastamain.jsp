<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}
.card_content{
	margin: 3px;
}
.card_content_img{
	max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞게 설정 */
    height: auto; /* 높이를 자동 조정하여 비율 유지 */
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
    padding: 12px;
    width: 100%;
}
.item_poster{
	position: static;
    transform: none;
    border-radius: 8px;
    width: 56px;
    height: 56px;
    object-fit: cover;
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
				<div class="feed_card_container">
					<section class="card_header">
						<div class="card_header_left">
							<a href="#">
								<img class="reviewerImg" src="../img/kids_logo.png">
							</a>
							<div class="card_header_title">
								<div class="card_header_act">
									<strong>두용</strong> 님이 리뷰를 남겼어요.
								</div>
								<div class="card_header_sub">
									<span>뷰티 서포터</span>
									<div class="card_header_seperator"></div>
									<span>14시간 전</span>
								</div>
							</div>
						</div>
						<div class="card_header_right">
							<button class="btn btn-custom">팔로우</button>
							<button class="imgBtn">
								<img class="morePoint" src="../images/point.png">
							</button>
						</div>
					</section>
					<div class="card_content_wrapper">
						<div class="card_content">
							<a href="#">
								<img class="card_content_img" src="../images/crowd-banner01.jpg">						
							</a>
							<hr>
							<div class="card_content_review">
								<p>리뷰 내용 작성 리뷰 내용 작성해주세요</p>
							</div>
							<hr>
							<div class="review_item">
								<img class="item_poster" src="../images/crowd-banner01.jpg">
								<div class="item_titles">
									<span class="item_category">
										<span class="category_badge">뷰티</span>
										<p class="item_title">[추석전배송]4억년의 시간이 만들어낸 천연소금 결정체, 몽골 미네랄 소금ㅇ[추석전배송]4억년의 시간이 만들어낸 천연소금 결정체, 몽골 미네랄 소금ㅇ[추석전배송]4억년의 시간이 만들어낸 천연소금 결정체, 몽골 미네랄 소금ㅇ[추석전배송]4억년의 시간이 만들어낸 천연소금 결정체, 몽골 미네랄 소금ㅇ[추석전배송]4억년의 시간이 만들어낸 천연소금 결정체, 몽골 미네랄 소금ㅇ[추석전배송]4억년의 시간이 만들어낸 천연소금 결정체, 몽골 미네랄 소금</p>
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
			id:'',
			friend_list:[]
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
			}
		}
	})
</script>
</body>
</html>
