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
}
.projectlisttable tr,td,th{
	border:none;
}
.rounded-image {
  border-radius: 50%;
  width: 50x; /* 이미지 너비 설정 */
  height: 50px; /* 이미지 높이 설정 */
}
</style>
</head>
<body>
<div class="makerpagemainrow">
	<div class="row projectrow">
		<div class="col-md-4" v-for="vo in project_list" v-if="vo.rewardok==1">
		    <table class="table projectlisttable">
		    	<tr>
		    		<td class="text-center" colspan="2">
		    			<a :href="'../makerpage/project_detail.do?wfno='+vo.wfno">
		    				<img :src="'../Fundimages/'+vo.mainimg" style="width:400px;height: 300px;">
		    			</a>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th width="30%" class="text-end">카테고리</th>
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