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
	height: 800px;
	margin: auto 0px;
	overflow-y: auto;
	
}
.Btnrow{
	height: 50	px;
	margin-right: 0px;
}
.projectrow{
}
</style>
</head>
<body>
<div class="makerpagemainrow">
	<div class="row projectrow">
		<div class="col-md-4" v-for="vo in project_list" v-if="vo.rewardok==1">
		    <div class="img-thumbnail">
		      <a href="#">
		        <img :src="'../Fundimages/'+vo.mainimg" style="width:400px;height: 200px;">
		        <div class="caption">
		          <p>{{vo.fcname}}</p>
		          <p>{{vo.ftitle}}</p>
		          <p>{{vo.stropenday}}~{{vo.strendday}}</p>
		          <p>{{vo.makername}}</p>
		        </div>
		      </a>
		    </div>
	  </div>
	  <div class="text-center">
	  	<table class="table">
	  		<tr>
			  	<td class="text-right">
					<a href="#" class="btn btn-sm btn-danger">이전</a>
						{{curpage }} page/ {{totalpage }} pages
					<a href="#" class="btn btn-sm btn-primary">다음</a>
				</td>
			</tr>
	  	</table>
	  </div>
	</div>
</div>
<script>
	new Vue({
			el:'.projectrow',
			data:{
				id:'${sessionScope.id}',
				project_list:[],
				curpage:1,
				totalpage:0
			},
			mounted:function(){
				this.dataRecv()
			},
			methods:{
				dataRecv:function(){
					axios.get("http://localhost/web/makerpage/project_list_vue.do",{
						params:{
							page:this.curpage,
							id:this.id
						}
					}).then(response=>{
						console.log(response.data)
						this.project_list=response.data
					})
					
					// 페이지 정보
					axios.get('http://localhost/web/makerpage/page_Oklist_vue.do',{
						params:{
							page:this.curpage,
							id:this.id
						}
					}).then(response=>{
						console.log(response.data)
						this.page_list=response.data
						this.curpage=this.page_list.curpage
						this.totalpage=this.page_list.totalpage
					}).catch(error=>{
						console.log(error.response)
					})
				}
				
			}
			
		})
		
</script>
</body>
</html>