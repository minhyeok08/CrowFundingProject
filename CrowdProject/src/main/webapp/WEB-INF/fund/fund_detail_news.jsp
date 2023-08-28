<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="row" id="news">
		
		<div class="row">
		<span style="font-size:25px"><strong>새소식&nbsp;&nbsp;<span style="color: #a6d8ce;">{{count}}</span></strong></span><br><br>
		<hr>
			<div v-for="vo in news_data" class="row">
				<a :href="'../fund/fund_detail_news_detail.do?no=' +vo.no+'&wfno=' +vo.wfno">
				 <div>	
					<p style="font-size: 20px">{{vo.subject}}&nbsp;&nbsp;&nbsp;</p>
					<p style="font-size: 15px">{{vo.content}}</p>						
				<hr>	
				 </div>
				</a>
				
			</div>
			
		</div>
	</div>
	<script>
	 new Vue({
		 el:'#news',
		 data:{
			 wfno:${wfno},
			 news_data:[],
			 count:0,
		 },
		 mounted:function(){
			 axios.get('../fund/fund_newsListData_vue.do',{
				 params:{			
					 wfno:this.wfno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.news_data=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
			 axios.get('../fund/fund_newsCount_vue.do',{
				 params:{			
					 wfno:this.wfno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.count=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
		 }
	 })
	</script>
</body>
</html>