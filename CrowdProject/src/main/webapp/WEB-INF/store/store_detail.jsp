<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row" id="fDetail">
		<div class="row">
			<div class="thumbnail"
				style="width: 700px; border: none; padding: 10px;">
				<img :src="store_detail.mainimg" style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
			</div>
		</div>
		<div class="row">
			<h4>프로젝트 스토리</h4>
			<div class="thumbnail"
				style="width: 700px; border: none; padding: 10px;" v-for="img in detailimages">
				<img :src="img" class="main_img"
					style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
			</div>
		</div>
	</div>
	<script>
	new Vue({
		 el:'#fDetail',
		 data:{
			 wsno:${wsno},
			 store_detail:{},
			 detailimages:[],
			 no:0
		 },
		 mounted:function(){
			 axios.get('../store/store_detail_vue.do',{
				 params:{
					 wsno:this.wsno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.store_detail=response.data
				 this.detailimages=response.data.detailimg.split("^")
				 
			 }).catch(error=>{
				 console.log(error.response)
			 })
		 }
	 })	
	</script>
</body>
</html>