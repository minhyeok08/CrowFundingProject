<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['날짜', '방문자 수'],
      ['2023-08-01', 15],
      ['2023-08-02', 32],
      ['2023-08-03', 12],
      // ... 추가적인 데이터
    ]);

    var options = {
      title: '사이트 방문자 수',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>
<style type="text/css">
.fullscreen{
	background-color: #e9ecef;
	display: flex;
}
.rightCont{
	width:70%;
}
.rightCont2{
	display: flex;
	flex-direction: row;
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
.leftCont{
	width:30%;
	height: 500px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.today{
	width: 90%;
	height: 150px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.visiterChart{
	width: 100%;
	height: 400px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.summary{
	width: 100%;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.reviewTable{
	width: 100%;
	height: 400px;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.qnaTable{
	width: 100%;
	background-color: white;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	padding: 10px;
	margin: 10px;
}
.doNum{
	color: red;
	font-weight: 700;
	font-size: 18px;
}
.noHr{
	margin: 4px;
}
.todayContainer{
	align-items: center;
	justify-content: space-between;
}
.member_table > thaed {
	font-size: 9pt;
	border-bottom: 1px solid;
}
.member_table > tbody {
	font-size: 9pt;
}
.review_item{
	display: flex;
 	align-items: center; 
}
.boardul{
	margin: 0;
    padding: 0;
    list-style: none;
}
.boardTitle{
	font-size: 20px;
	font-weight: bold;
}
.boardWriter{
	color: #868e96;
	font-size: 13px;
}
.boardWriterSpan{
	margin-right: 20px;
	margin-left: 10px;
}
.item_poster{
	position: static;
    transform: none;
    border-radius: 8px;
    width: 50px;
    height: 50px;
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
.pagination-container {
    display: flex;
    justify-content: center;
    margin-top: 20px; 
}
.pagination .page-link {
     border-radius: 30px;
     color: #333;
     background-color: #fff;
     border: 1px solid #ddd;
     transition: background-color 0.3s, border-color 0.3s, color 0.3s;
 }

 .pagination .page-link:hover {
     color: #fff;
     background-color: #a6d8ce;
     border-color: #a6d8ce;
 }

 .pagination .page-item.disabled .page-link {
     color: #ccc;
     background-color: transparent;
     border-color: #ddd;
 }

 .pagination .page-item.active .page-link {
     color: #fff;
     background-color: #a6d8ce;
     border-color: #a6d8ce;
 }

 .pagination .page-item:first-child .page-link,
 .pagination .page-item:last-child .page-link {
     border-radius: 30px; /* 둥글게 */
     color: #333;
     background-color: #fff;
     border: 1px solid #ddd;
     transition: background-color 0.3s, border-color 0.3s, color 0.3s;
 }

 .pagination .page-item:first-child .page-link:hover,
 .pagination .page-item:last-child .page-link:hover {
     color: #fff;
     background-color: #a6d8ce;
     border-color: #a6d8ce;
 }
 .textarea-box {
	border: 2px solid #ccc; /* 초기 테두리 스타일 */
	border-radius: 4px;
	padding: 5px;
	transition: border-color 0.3s; /* 테두리 색 변화 시 부드럽게 효과 적용 */
}

.textarea-box:focus {
	border-color: mintcream; /* 선택 시 테두리 색 변경 */
	box-shadow: 0 0 0 4px rgba(0, 128, 128, 0.3); /* 선택 시 약간 두꺼운 테두리 스타일 */
	outline: none;
}
.replyBoardBack{
    background: #f5f7fa;
    padding: 16px;
    width: 95%;
    border-radius: 10px;
    margin: 7px;
    overflow-y: auto; 
  	max-height: 500px; 
}
.adminBoard {
    background: #d3e1df;
    padding: 16px;
    width: auto;
    border-radius: 10px 10px 0px 10px;
    margin-bottom: 30px;
    position: relative;
}
.replyCont_header_right {
   display: flex; 
   align-items: center; 
}
.replyCont_header_left{
	display: flex; 
   	align-items: center;
   	justify-content: space-between;
}
.profileContainer {
   display: flex;
   flex-direction: column;
   align-items: center;
}
.replyImg {
   border-radius: 50%;  
   width : 50px;  
   height : 50px;   
}
.review_name{
	text-align:center
}
.replyBoard {
    background: #f0f7f4;
    padding: 16px;
    width: auto;
    border-radius: 10px 10px 10px 0px;
    position:relative;
    margin-bottom: 40px;
}
.review_time{
	position:absolute;
	bottom :5px;  
	right :5px;  
	font-size :12px; 
	color: #929696; 
}
.admin_img_container{
	width: 150px;
	height: 150px;
	border: 1px solid #929696;
	border-radius: 50%;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3); /* 그림자 효과 추가 */
}
.admin_img{
	width:100%;
	height: 100%;
	border-radius:50%;
	padding: 2px;
	box-sizing: border-box;
}
.profileAd{
	display: flex;
	justify-content: center;
}
.admin_name{
	font-size: 20px;
	font-weight: 500;
}
.btn-danger{
	border-radius: 40%;
}
.admin_memo{
	width: 100%;
	height: auto
}
 .textarea-box {
	border: 2px solid #ccc; /* 초기 테두리 스타일 */
	border-radius: 4px;
	padding: 5px;
	transition: border-color 0.3s; /* 테두리 색 변화 시 부드럽게 효과 적용 */
}

.textarea-box:focus {
	border-color: mintcream; /* 선택 시 테두리 색 변경 */
	box-shadow: 0 0 0 4px rgba(0, 128, 128, 0.3); /* 선택 시 약간 두꺼운 테두리 스타일 */
	outline: none;
}
</style>
</head>
<body>
<div class="fullscreen">
	<div class="rightCont">
		<div class="today">
			<span style="font-size: 17px; font-weight: 500">오늘의 할일</span> 
			<span class="doNum">{{today_vo.fund_count+today_vo.buy_info_count+today_vo.admin_qna_count
				+today_vo.fund_review_count+today_vo.member_count+4}}</span>
			<hr class="noHr">
			<div class="todayContainer">
				<button class="btn ">
					<a href="#">신규펀딩 <span class="doNum">{{today_vo.fund_count}}</span></a>
				</button>
				<button class="btn ">
					<a href="#">금일 펀딩 <span class="doNum">{{today_vo.buy_info_count}}</span></a>
				</button>
				<button class="btn ">
					<a href="#">신규 상품 <span class="doNum">2</span></a>
				</button>
				<button class="btn ">
					<a href="#">금일 구매 <span class="doNum">2</span></a>
				</button>
				<button class="btn ">
					<a href="../admin/qna.do">답변대기 문의 <span class="doNum">{{today_vo.admin_qna_count}}</span></a>
				</button>
				<button class="btn ">
					<a href="../wasta/main.do">금일 리뷰 작성 <span class="doNum">{{today_vo.fund_review_count}}</span></a>
				</button>
				<button class="btn ">
					<a href="../admin/supporter.do">금일 가입수 <span class="doNum">{{today_vo.member_count}}</span></a>
				</button>
			</div>
		</div>
		<div class="rightCont2">
			<div class="visiterChart">
				<div id="chart_div" style="width: 100%; height: 350px;"></div>
			</div>
			<div class="summary">
				<strong>일별 요약</strong>
				<table class="table member_table">
					<thead>
						<tr style="border-bottom: 1px solid gray;">
							<th class="text-center">일자</th>
							<th class="text-center">가입</th>
							<th class="text-center">펀딩수</th>
							<th class="text-center">상품구매수</th>
							<th class="text-center">문의</th>
							<th class="text-center">후기</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="tvo,index in today_list">
							<td class="text-center" v-if="index==0">오늘</td>
							<td class="text-center" v-if="index>=1">{{index}}일 전</td>
							<td class="text-center">{{tvo.member_count}}</td>
							<td class="text-center">{{tvo.fund_count}}</td>
							<td class="text-center">{{tvo.buy_info_count}}</td>
							<td class="text-center">{{tvo.admin_qna_count}}</td>
							<td class="text-center">{{tvo.fund_review_count}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="rightCont2">
			<div class="reviewTable">
				<strong>리뷰 / 응원 / 지지</strong>
				<div style="height: 10px;"></div>
				<ul class="boardul" id="searchUl">
					<li v-for="rvo in review_list">
						<div class="review_item">
						<a href="#">
							<img class="item_poster" :src="rvo.mainimg">
						</a>
							<div class="item_titles">
								<span class="item_category">
								<a href="#">
									<span class="category_badge">{{rvo.fcname}}</span>
								</a>
								<a href="#">
									<p class="item_title">{{rvo.content}}
										<br><span class="item_subtitle">{{rvo.ftitle}}</span>
									</p>
								</a>
								</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="qnaTable">
				<strong>답변 대기</strong>
				<table class="table" id="member_table">
					<thead>
						<tr style="border-bottom: 1px solid gray;">
							<th class="text-center">아이디</th>
							<th class="text-center">작성일</th>
							<th class="text-center">답변</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="vo in qna_list">
							<td class="text-center">{{vo.id}}</td>
							<td class="text-center">{{vo.dbday}}</td>
							<td class="text-center">
								<b-button v-b-modal.my-modal @click="openModal; qnaDetail(vo.id); selectedId=vo.id;"
									class="btn btn-custom">답변</b-button>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="pagination-container">
					<nav aria-label="Page navigation">
					    <ul class="pagination justify-content-center">
					        <li class="page-item" v-if="startPage>1">
					        	<a class="page-link" href="#" aria-label="Previous" @click="prev()">
					        		<span aria-hidden="true">&laquo;</span>
					        	</a>
					        </li>
					        <li class="page-item" v-for="i in range(startPage, endPage)">
					        	<a class="page-link" href="#" @click="pageChange(i)">{{i}}</a>
					        </li>
					        <li class="page-item" v-if="endPage<totalpage">
					        	<a class="page-link" href="#" aria-label="Next" @click="next()">
					        		<span aria-hidden="true">&raquo;</span>
					        	</a>
					        </li>
					    </ul>
					</nav>
					<b-modal id="my-modal" v-model="showModal" title="답변하기"
								hide-header-close hide-footer ok-only>
					<div class="replyBoardBack">
					    <div class="replyCard">
					    	<div v-for="dvo in qna_detail">
						        <div class="replyCont_header_right" v-if="dvo.admin=='n'">
						            <div class="profileContainer">
						                <a href="#"> 
						                    <img :src="dvo.profile_url" class="replyImg">
						                </a>
						                <p class="review_name reply_space">{{dvo.nickname}}</p> 
						            </div>
						            <div class="replyBoard">
						                <span style="width:100%;margin-right: 40px;">{{dvo.content}}</span>
						                <span class="review_time">{{dvo.dbday}}</span>
						            </div>
						        </div>
						        <div class="replyCont_header_left" v-if="dvo.admin=='y'">
						        	<div></div>
						            <div class="adminBoard">
						                <span style="width:100%;margin-right: 40px;">{{dvo.content}}</span>
						                <span class="review_time">{{dvo.dbday}}</span>
						            </div>
						        </div>  
					        </div>     
					    </div>
					</div>
						<input type="text" ref="content" v-model="content" class="textarea-box" size="35">
						<button class="btn btn-custom btn-right" @click="qnaInsert">답장</button>
					</b-modal>
				</div>
			</div>
		</div>
	</div>
	<div class="leftCont">
		<strong>관리자 프로필</strong>
		<div class="profileAd">
			<div class="admin_img_container">
				<img src="${sessionScope.profileImage }" class="admin_img">
			</div>
		</div>
		<div style="height: 10px;"></div>
		<div class="admin_name text-center">${sessionScope.name }</div>
		<div class="admin_memo">
			<form action="../admin/memo.do" method="post">
				<textarea style="width: 100%;height: 200px;" name="memo" class="textarea-box">${memo }</textarea>
				<input type="submit" class="btn btn-custom btn-right" value="저장" style="float: right">
			</form>
		</div>
	</div>
</div>
	<script>
		new Vue({
	 		el:'.rightCont',
	 		data:{
	 			qna_list:[],
	 			qna_detail:[],
	 			curpage:1,
				totalpage:0,
				startPage:0,
				endPage:0,
				showModal: false,
				content:'',
				id:'',
				selectedId:'',
				review_list:[],
				today_list:[],
				today_vo:{}
	 		},
	 		mounted:function(){
	 			this.send();
	 			this.todayReview();
	 			this.todayTotal();
	 		},
	 		methods: {
	 			qnaDetail:function(id){
	 				axios.get('../admin/qna_detail_vue.do',{
	 					params:{
	 						id:id
	 					}
	 				}).then(res=>{
	 					console.log(res.data)
	 					this.qna_detail=res.data
	 				})
	 			},
	 			qnaInsert: function(){
	 				axios.get('../admin/qna_insert_vue.do',{
	 					params:{
	 						content:this.content,
	 						id:this.selectedId
	 					}
	 				}).then(res=>{
	 					console.log(res.data)
	 					this.content='';
	 					this.qnaDetail(this.selectedId);
	 				})
	 			},
	 	        send: function () {
	 	            axios.get('../admin/qna_list_vue.do', {
	 	                params: {
	 	                    page: this.curpage
	 	                }
	 	            }).then(response => {
	 	                console.log(response.data)
	 	                this.qna_list = response.data
	 	            }).catch(error => {
	 	                console.log(error.response)
	 	            })
	 	            
	 	           axios.get('../admin/qna_page_vue.do',{
						params:{
							page:this.curpage
						}
					}).then(response=>{
						console.log(response.data)
						this.page_list=response.data
						this.curpage=this.page_list.curpage
						this.totalpage=this.page_list.totalpage
						this.startPage=this.page_list.startPage
						this.endPage=this.page_list.endPage
					}).catch(error=>{
						console.log(error.response)
					})
	 	            
	 	        },
				range:function(start, end){
					let arr=[];
					let length=end-start;
					for(let i=0;i<=length;i++){
						arr[i]=start;
						start++;
					}
					return arr;
				},
				pageChange:function(page){
					this.curpage=page;
					this.send();
				},
				prev:function(){
					this.curpage=this.startPage-1;
					this.send();
				},
				next:function(){
					this.curpage=this.endPage+1;
					this.send();
				},
				openModal() {
				    this.showModal = true;
				},
			    closeModal() {
			      	this.showModal = false;
			    },
			    todayReview(){
			    	axios.get('../admin/today_review_vue.do')
			    	.then(res=>{
			    		this.review_list=res.data;
			    	})
			    },
			    todayTotal(){
			    	axios.get('../admin/today_total_vue.do')
			    	.then(res=>{
			    		console.log(res.data)
			    		this.today_list=res.data;
			    		this.today_vo=res.data[0];
			    	})
			    
			    }
	 	    }
		})
	</script>
</body>
</html>