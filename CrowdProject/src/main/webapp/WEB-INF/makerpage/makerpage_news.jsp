<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.makerpagemainrow{
	border: 2px solid #a6d8ce;
	height: 900px;
	margin: auto 0px;
}
#newstable{
	width: 1000px;
	height: 600px;
	border: 2px solid #a6d8ce;
	margin: 0px auto;
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
</style>
</head>
<body>
<div class="row makerpagemainrow">
	<div style="height: 50px;"></div>
	<h2 class="text-center">새소식</h2>
	<div id="newstable">
		<table class="table">
			<tr>
				<td class="inline text-start">
					<a href="../makerpage/makerpage_news_insert.do" class="btn btn-sm btn-project">새글</a>
				</td>
				<td class="inline text-end">
					<input type="text" size=30>
					<input type="button" class="btn btn-sm btn-project" value="검색">
				</td>
			</tr>
		</table>
		<table class="table">
		 	<tr>
				<th width="10%" class="text-center">번호</th>
				<th width="40%" class="text-center">제목</th>
				<th width="20%" class="text-center">프로젝트명</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="10%" class="text-center">조회수</th>
			</tr>
			<tr v-for="vo,index in board_list">
				<td width="10%" class="text-center">{{index+1}}</td>
				<td width="40%" class="text-center"><a :href="'../makerpage/news_update.do?no='+vo.no">[{{vo.tname}}]&nbsp;{{vo.subject}}</a></td>
				<td width="20%" class="text-center">{{vo.ftitle}}</td>
				<td width="20%" class="text-center">{{vo.dbday}}</td>
				<td width="10%" class="text-center">{{vo.hit}}</td>
			</tr>
		</table>
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
			id:'${id}',
			board_list:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		},
		mounted:function(){
			this.dataRecv()
		},
		methods:{
			dataRecv:function(){
				axios.get('http://localhost/web/makerpage/maker_news_list_vue.do',{
					params:{
						id:this.id,
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.board_list=response.data
				}).catch(error=>{
					console.log(error.response)
				})
				axios.get('http://localhost/web/makerpage/news_page_vue.do',{
					params:{
						id:this.id,
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
			}
		}
	})
</script>
</body>
</html>