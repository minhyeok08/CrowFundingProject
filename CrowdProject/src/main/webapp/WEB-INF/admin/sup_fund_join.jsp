<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<div class="row">
	<div class="fund_join">
		<div class="col-md-3" v-for="fvo in fund_list">
			<div class="thumbnail" style="width: 260px;">
				<img :src="fvo.mainimg" class="store_poster" style="width:260px; height:180px">
				<div class="caption">
					<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{fvo.rname}}</p>
					<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
						<span style="color:orange">{{fvo.fcname}}</span>
						<span style="text-align:right; margin-left: auto; margin-right:10px;">{{fvo.makername}}</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
new Vue({
	el:'.fund_join',
	data:{
		fund_list:[]
	},
	mounted:function(){
		this.fundList();
	},
	methods:{
		fundList(){
			axios.get('../admin/fund_join_vue.do',{
				params:{
					id:'${sessionScope.id}'
				}
			}).then(res=>{
				this.fund_list=res.data
			}).catch(error=>{
				console.log(error)
			})
		}
	}
})
</script>
</body>
</html>