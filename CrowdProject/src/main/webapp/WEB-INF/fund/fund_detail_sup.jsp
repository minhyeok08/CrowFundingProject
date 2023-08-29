<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.oval-container {
  display: flex;
  align-items: center;
  border-radius: 30%;
  padding: 10px;
}

.circle-image {
  width: 50px;
  height: 50px;
  border-radius: 30%;
}

.thumbnail-content {
  margin-left: 10px;
}
</style>
</head>
<body>
	<div class="row" id="sup">
		<h5><strong>참여하는 서포터</strong></h5><br><br>
		<hr><br><br>
			<!-- <div v-for="vo in sup_list" class="thumbnail bordered-thumbnail"
				style="width: 95%; height: 90%; text-align: left; font-size: 15px"><br>
				<div class="circle-image">
						<img src="#" alt="">
				</div>
				<span style="font-size: 15px">{{vo.id}}님이&nbsp;&nbsp;
				<span style="font-size: 15px"><strong>{{vo.tprice}}원 예약구매했어요</strong><br><br></span></span>
				
			</div> -->
			<!-- <div class="row" v-for="vo in sup_list">
			 <div class="thumbnail bordered-thumbnail">
				<span>
					<div class="circle-image">
						<img src="#" alt="">
					</div>
				</span>
				<span>
					<div>{{vo.id}}님이&nbsp;&nbsp;<strong>{{vo.tprice}}원 예약구매했어요</strong></div>
					<br>
				</span>
			 </div>	
			</div> -->	
			<div class="row" v-for="vo in sup_list">
    <div class="thumbnail bordered-thumbnail">
        <div class="oval-container">
            <div class="circle-image">
                <img :src="vo.profile_url" alt="">
            </div>
            <div class="thumbnail-content">
                {{vo.id}} 님이&nbsp;&nbsp;<strong>{{vo.tprice}} 원 예약구매했어요</strong>
            </div>
        </div>
    </div>	
</div>	
	</div>
	<script>
		new Vue({
			el:'#sup',
			data:{
				wfno:${wfno},
				sup_list:[]
			},
		mounted:function(){
			axios.get('../fund/fund_sup_vue.do',{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				console.log(response.data)
				this.sup_list=response.data
				
			}).catch(error=>{
				console.log(error.response)
			})
		}
	})
	</script>
</body>
</html>