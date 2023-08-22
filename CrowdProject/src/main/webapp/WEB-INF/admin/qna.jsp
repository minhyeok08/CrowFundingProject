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
</style>
</head>
<body>
	<div style="height: 40px;"></div>
	<div class="adminContainer">
		<table class="table" id="member_table">
		<thead>
			<tr style="border-bottom: 1px solid gray;">
				<th class="text-center">아이디</th>
				<th class="text-center">제목</th>
				<th class="text-center">작성일</th>
				<th class="text-center">답변상태</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="vo in qna_list">
				<td class="text-center">{{vo.id}}</td>
				<td class="text-center">{{vo.subject}}</td>
				<td class="text-center">{{vo.dbday}}</td>
				<td class="text-center">{{vo.state}}</td>
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
	</div>
	</div>
	<script>
		new Vue({
	 		el:'.adminContainer',
	 		data:{
	 			qna_list:[],
	 			qna_detail:{},
	 			curpage:1,
				totalpage:0,
				startPage:0,
				endPage:0
	 		},
	 		mounted:function(){
	 			this.send();
	 		},
	 		methods: {
	 	        send: function () {
	 	            axios.get('http://localhost/web/admin/qna_list_vue.do', {
	 	                params: {
	 	                    page: this.curpage
	 	                }
	 	            }).then(response => {
	 	                console.log(response.data)
	 	                this.qna_list = response.data
	 	            }).catch(error => {
	 	                console.log(error.response)
	 	            })
	 	            
	 	           axios.get('http://localhost/web/admin/qna_page_vue.do',{
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
				}
	 	    }
		})
	</script>
</body>
</html>