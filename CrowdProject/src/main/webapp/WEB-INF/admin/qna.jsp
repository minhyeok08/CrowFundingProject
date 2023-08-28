<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.adminContainer{
	margin: 0px auto;
	width: 70%;
}
#member_table > thaed {
	font-size: 11pt;
	border-bottom: 1px solid;
}
#member_table > tbody {
	font-size: 10pt;
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
.btn-custom {
	background-color: transparent;
	border-color: #00b2b2;
	color: #00b2b2;
	transition: background-color 0.3s;
	font-size: 16px;
}

.btn-custom:hover {
	background-color: rgb(234, 248, 249);
	border-color: #00b2b2;
	color: #00b2b2;
}
.btn-right {
	float: right;
	margin-right: 10px;
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
</style>
</head>
<body>
	<div style="height: 40px;"></div>
	<div class="adminContainer">
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
	<script>
		new Vue({
	 		el:'.adminContainer',
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
				selectedId:''
	 		},
	 		mounted:function(){
	 			this.send();
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
			    }
	 	    }
	 	   	
		})
	</script>
</body>
</html>