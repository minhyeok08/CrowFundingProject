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
	height: 50	px;
	margin-right: 0px;
}
.projectlisttable{
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 20px;
	width:300px;
	height: 500px;
	margin: 0px auto;
	margin-top: 10px;
 	 border: 2px solid #a6d8ce; 
 	 
}
.projectlisttable tr,td,th{
	border:none;
}
.projectlisttable th{
	font-size: 13px;
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

</style>
</head>
<body>
<div class="makerpagemainrow">
	<div class="row projectrow">
		<div style="height: 20px"></div>
		<div class="col-md-12">
			<h2 class="text-center">${sessionScope.name }님의 프로젝트 리스트</h2>
		</div>
		<div class="BtnRow">
			<table class="table">
				<tr>
					<td class="text-start">
						<button class="btn btn-project" @click="changeAcno(1)" >진행중인 프로젝트</button>
						<button class="btn btn-project" @click="changeAcno(3)" >오픈예정 프로젝트</button>
					</td>
				</tr>
			</table>
		</div>
		<div v-if="acno==1" class="col-md-12">
			<h3 class="text-center" style="background-color: #a6d8ce;color: white">진행중인 프로젝트</h3>
		</div>
		<div v-else class="col-md-12">
			<h3 class="text-center" style="background-color: #a6d8ce;color: white">오픈예정 프로젝트</h3>
		</div>
		<div class="col-md-3" v-for="vo in project_list">
		    <table class="table projectlisttable">
		    	<tr>
		    		<td class="text-center" colspan="2">
		    			<a :href="'../makerpage/project_detail.do?wfno='+vo.wfno">
		    				<img :src="'../Fundimages/'+vo.mainimg" style="width:250px;height: 200px;">
		    			</a>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="2">
		    			<div class="progress" style="height:3px;">
						  <div class="progress-bar" :style="'width: '+vo.acheieve_rate+'% background-color:#a6d8ce;'"></div>
						</div>
		    		</td>
		    	</tr>
		    	<tr v-if="vo.achieve_rate!=0">
		    		<td colspan="2" class="text-end">
		    			<strong style="color: #a6d8ce;">달성률 {{vo.achieve_rate}}%</strong>
		    		</td>
		    	</tr>
		    	<tr v-else>
		    		<td colspan="2" class="text-end">
		    			<strong style="color: ##adb5bd;">달성률 {{vo.achieve_rate}}%</strong>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th width="30%" class="text-end">카테고리</th>
		    		<td width="70%" style="font-size: 15px">{{vo.fcname}}</td>
		    	</tr>
		    	<tr>
		    		<th width="30%" class="text-end">프로젝트명</th>
		    		<td width="70%" style="font-size: 15px">{{vo.ftitle}}</td>
		    	</tr>
		    	<tr v-if="acno==1">
		    		<th width="30%" class="text-end">진행기간</th>
		    		<td width="70%" style="color: #a6d8ce;font-size: 15px ">{{vo.stropenday}}~{{vo.strendday}}&nbsp;&nbsp;</td>
		    	</tr>
		    	<tr v-else>
		    		<th width="30%" class="text-end">오픈예정일</th>
		    		<td width="70%" style="color: #a6d8ce;font-size: 15px ">{{vo.opendaykor}}</td>
		    	</tr>
		    	<tr>
		    		<th width="30%" class="text-end">
		    			<img :src="'../Fundimages/'+vo.makerphoto" class="rounded-image" style="width: 50px;height: 50px">
		    		</th>
		    		<td width="70%" style="font-size: 15pz">{{vo.makername}}</td>
		    	</tr>
		    </table>
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
</div>
<script>
	new Vue({
			el:'.projectrow',
			data:{
				id:'${id}',
				project_list:[],
				page_list:{},
				curpage:1,
				totalpage:0,
				startPage:0,
				endPage:0,
				acno:1
			},
			mounted:function(){
				this.dataRecv()
			},
			methods:{
				changeAcno:function(acno){
					this.acno=acno
					this.dataRecv()
				},
				dataRecv:function(){
					axios.get("../makerpage/project_list_vue.do",{
						params:{
							page:this.curpage,
							acno:this.acno,
							id:this.id
						}
					}).then(response=>{
						console.log(response.data)
						this.project_list=response.data
					})
					
					// 페이지 정보
					axios.get('../makerpage/page_Oklist_vue.do',{
						params:{
							page:this.curpage,
							acno:this.acno,
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