<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-md-4" v-for="svo in store_list">
			<div class="thumbnail" style="width: 260px;">
				<a href="#"> <img :src="svo.main_poster" class="store_poster"
					style="width: 260px; height: 180px">
					<div class="caption">
						<p style="font-size: 16px; margin-bottom: 1px; height: 50px;">{{svo.goods_title}}</p>
						<p
							style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
							<strong style="color: #a6d8ce">{{svo.price}}</strong>&nbsp;원&nbsp;
							<span style="color: orange">{{svo.score}}</span> <span
								style="text-align: right; margin-left: auto; margin-right: 10px;">{{svo.maker_name}}</span>
						</p>
					</div>
				</a>
			</div>
		</div>
	</div>
	<script>
		new Vue({
			el:'.main_home',
			data:{
				store_list:[],
				fund_list:[]
			},
			mounted:function(){
				this.send()
			},
			methods:{
				send:function(){
					axios.get("../main/store_list_vue.do").then(response=>{
						console.log(response.data)
						this.store_list = response.data
					})
					axios.get("../main/fund_list_vue.do").then(response=>{
						console.log(response.data)
						this.fund_list = response.data
					})
				}
			}
		})
	</script>
</body>
</html>