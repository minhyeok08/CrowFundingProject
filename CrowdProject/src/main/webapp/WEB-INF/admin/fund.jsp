<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
<div class="row" id="app">
	<div class="col-md-4" v-for="fvo in fund_list">
		<div class="thumbnail" style="width: 260px;">
			<a href="#">
				<img :src="fvo.mainimg" class="store_poster" style="width:260px; height:180px">
				<div class="caption">
					<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{fvo.ftitle}}</p>
					<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
						<strong style="color:#a6d8ce">{{fvo.achieve_rate}}</strong>&nbsp;원&nbsp;
						<span style="color:orange">{{fvo.fcname}}</span>
						<span style="text-align:right; margin-left: auto; margin-right:10px;">{{fvo.makername}}</span>
					</p>
				</div>
			</a>
		</div>
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
		        	<a :class="i==curpage?'page-link active':'page-link'" href="#" @click="pageChange(i)">{{i}}</a>
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
		el:'#app',
		data:{
			fund_list:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			fcno:1
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				
				axios.get("../admin/fund_list_vue.do",{
					params:{
						curpage:this.curpage,
						fcno:this.fcno
					}
				}).then(response=>{
					console.log(response.data)
					this.fund_list = response.data
				})
				
				axios.get('http://localhost/web/admin/fund_page_vue.do',{
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
	