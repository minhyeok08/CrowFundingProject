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
	overflow-y: auto;
	
}
.Btnrow{
	height: 50px;
	margin-right: 0px;
}
.projectlisttable{
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 20px;
	width: 300px;
	height: 500px;
	margin: 0px auto;
	margin-top: 10px;
 	 border: 2px solid #a6d8ce; 
}
.projectlisttable tr,td,th{
	border:none;
}
.rounded-image {
  border-radius: 50%;
  max-width: 50px; /* 이미지 너비 설정 */
  max-height: 50px; /* 이미지 높이 설정 */
  border: 2px solid #a6d8ce; 
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
 .imgContainer{
 	width:50px;
 	height: 50px;
 	text-align: end;
 }
</style>
</head>
<body>
<div class="makerpagemainrow">
	<div style="height: 20px"></div>
		<table class="table" style="border: none">
			<tr>
				<th width="80%" class="text-center"  style="border: none"><h2>${sessionScope.name }님의 프로젝트 리스트</h2></th>
				<td width="20%">					
					<a href ="../makerpage/fund_insert.do" class="btn btn-project text-center" id="projectBtn" >프로젝트 등록</a>
				</td>
			</tr>
		</table>
	<div class="row projectrow" >
		<h4>리워드 등록 필요</h4>
		<div class="col-md-3" v-for="vo in project_list" v-if="vo.rewardok==0">
		    <table class="table projectlisttable">
		    	<tr>
		    		<td class="text-center" colspan="2">
		    			<a :href="'../makerpage/project_detail_for_reward.do?wfno='+vo.wfno">
		    				<img :src="'../Fundimages/'+vo.mainimg" style="width:250px;height: 200px;">
		    			</a>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th width="30%" class="text-end">카테고리 명</th>
		    		<td width="70%" style="font-size: 15pt">{{vo.fcname}}</td>
		    	</tr>
		    	<tr>
		    		<th width="30%" class="text-end">프로젝트명</th>
		    		<td width="70%" style="font-size: 15pt">{{vo.ftitle}}</td>
		    	</tr>
		    	<tr>
		    		<td colspan="2" class="text-end" style="color: #a6d8ce;font-size: 15pt">{{vo.stropenday}}~{{vo.strendday}}&nbsp;&nbsp;</td>
		    	</tr>
		    	<tr>
		    		<th width="30%" class="text-end">
		    			<img :src="'../Fundimages/'+vo.makerphoto" class="rounded-image">
		    		</th>
		    		<td width="70%" style="font-size: 15pt">{{vo.makername}}</td>
		    	</tr>
		    </table>
	  </div>
  </div>
	  <div style="height: 30px"></div>
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
			id:'${sessionScope.id}',
			project_list:[],
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
				axios.get("../makerpage/project_list_for_reward_vue.do",{
					params:{
						page:this.curpage,
						id:this.id
					}
				}).then(response=>{
					console.log(response.data)
					this.project_list=response.data
				}).catch(error=>{
					console.log(error.response)
				})
				
				// 페이지 정보
				axios.get('../makerpage/page_list_vue.do',{
					params:{
						page:this.curpage,
						id:this.id
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
				this.dataRecv()
			},
			prev:function(){
				this.curpage=this.startPage-1;
				this.dataRecv()
			},
			next:function(){
				this.curpage=this.endPage+1;
				this.dataRecv()
			}
			
		}
		
	})
	
</script>
</body>
</html>