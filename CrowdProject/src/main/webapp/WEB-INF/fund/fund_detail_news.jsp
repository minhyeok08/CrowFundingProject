<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.makerpagemainrow{
	margin: 5px auto;
}
#newstable{
	margin: 5px auto;
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

 /* 이전, 다음 버튼 스타일링 */
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
 
.newsList {
	border-bottom: solid 1px #a6d8ce; 
	box-sizing: border-box; 
	padding:0px; 
	margin:0px 12px 0px 12px; 
	width:95%;
}

</style>
</head>
<body>
<div class="row makerpagemainrow gx-5">
	<div style="display: flex; align-items: center; margin:0px 12px 0px 12px; padding:10px 0px 20px 0px; border-bottom: 1px solid black;">
	    <h4 style="margin: 0;">새소식 <strong style="color: #a6d8ce;">{{allpage}}</strong></h4>
	    <select ref="tno" v-model="tno" @change="tnoSelect" style="margin-left: auto;">
	        <option value="0">전체</option>
	        <option value="1">결제</option>
	        <option value="2">교환/환불/AS</option>
	        <option value="3">이벤트</option>
	        <option value="4">리워드 안내</option>
	        <option value="5">기타</option>
	    </select>
		<hr>
	</div>
	<div v-for="vo in board_list" class="newsList">
		<a :href="'../fund/fund_news_detail.do?wfno='+${ wfno }+'&no='+vo.no" style="display: block;">
			<div class="row" style="padding: 16px 0px 16px 0px;">
				<p style="margin:0px;">{{vo.tname}}</p>
				<p style="margin:4px 0px 4px 0px;">{{vo.subject}}</p>
				<p style="margin:0px;">{{ timeForToday(vo.dbday)}}</p>
			</div>
		</a>
	</div>
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
	</div>
</div>
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			board_list:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			allpage:0,
			startPage:0,
			endPage:0,
			wfno:${wfno},
			tno:0
		},
		mounted:function(){
			this.dataRecv()
		},
		methods:{
			dataRecv:function(){
				axios.get('../fund/fund_news_vue.do',{
	                params:{
	                    page: this.curpage,   // 처음에는 첫 번째 페이지부터 시작하므로 '1' 설정.
	                    wfno: this.wfno,
	                    tno: this.tno
	                }
	            }).then(response=>{
	                console.log(response.data);
	                this.board_list = response.data;
	                // 페이징 정보 업데이트 필요.
	            }).catch(error=>{
	                console.log(error.response);
	            })
				axios.get('../fund/fund_news_page_vue.do',{
					params:{
						page:this.curpage,
						wfno: this.wfno,
						tno: this.tno
					}
				}).then(response=>{
					console.log(response.data)
					this.page_list=response.data
					this.curpage=this.page_list.curpage
					this.totalpage=this.page_list.totalpage
					this.allpage=this.page_list.allpage
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
				this.dataRecv()
			},
			prev:function(){
				this.curpage=this.startPage-1;
				this.dataRecv()
			},
			next:function(){
				this.curpage=this.endPage+1;
				this.dataRecv()
			},
			tnoSelect:function(){
				this.curpage = 1
				this.dataRecv()
			},
			timeForToday:function(dbday) {
				const currentDate = new Date();
	            const dbDate = new Date(dbday);
	            const timeDiff = currentDate - dbDate;
	            
	            if (timeDiff < 60000) { // 1분 미만
	                return "방금 전";
	            } else if (timeDiff < 3600000) { // 1시간 미만
	                return Math.floor(timeDiff / 60000) + "분 전";
	            } else if (timeDiff < 86400000) { // 1일 미만
	                return Math.floor(timeDiff / 3600000) + "시간 전";
	            } else if (timeDiff < 2592000000) { // 30일 미만
	                return Math.floor(timeDiff / 86400000) + "일 전";
	            } else if (timeDiff < 31536000000) { // 1년 미만
	                return Math.floor(timeDiff / 2592000000) + "개월 전";
	            } else {
	                return Math.floor(timeDiff / 31536000000) + "년 전";
	            }
		 }
		}
	})
</script>
</body>
</html>