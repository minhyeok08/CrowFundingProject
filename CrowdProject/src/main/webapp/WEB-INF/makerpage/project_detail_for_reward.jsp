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
</style>
</head>
<body>
<div class="row makerpagemainrow">
	<div class="col-7">
		<table class="table">
			<tr>
				<td>{{detail_data.mainimg}}</td>
			</tr>
			<tr>
				<td><h4>스토리 소개</h4></td>
			</tr>
			<tr v-for="img in detailimg">
				<td>{{img}}</td>
			</tr>
			<tr v-if="detail_data.detailcont!=null">
			</tr>
		</table>
	</div>
	<div class="col-5">
		<table class="table">
			<tr>
				<td>{{detail_data.fcname}}&nbsp;{{detail_data.tag}}</td>
			</tr>
			<tr>
				<td><h2>{{detail_data.ftitle}}</h2></td>
			</tr>
			<tr>
				<td><h4>{{detail_data.fsubtitle}}</h4></td>
			</tr>
			<tr>
				<td><h4>목표금액:<span style="color: cyan">{{detail_data.aim_amount}}</span>원</h4></td>
			</tr>
			<tr>
				<td>
					<a href="../makerpage/reward_insert.do?wfno=${wfno }" class="btn btn-project">리워드 등록</a>
				</td>
			</tr>
		</table>
	</div>
</div>
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			wfno:${wfno},
			detail_data:{},
			detailimg:[]
		},
		mounted:function(){
			axios.get("http://localhost/web/makerpage/project_detail_for_reward_vue.do",{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				this.detail_data=response.data
				this.detailimg = this.detail_data.detailimg.split('^');
			})
		}
	})
</script>
</body>
</html>