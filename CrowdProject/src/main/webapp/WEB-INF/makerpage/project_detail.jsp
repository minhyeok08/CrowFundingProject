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
	overflow-y: auto;
	
}
.Btnrow{
	height: 50px;
	margin-right: 0px;
}
.rewardtable{
	border: 2px solid #a6d8ce;
	height: 600px;
	overflow-y: auto;
}
</style>
</head>
<body>
<div class="makerpagemainrow">
	<div class="Btnrow">
		<table class="table">
			<tr class="text-end">
				<td>
					<a href="../makerpage/project_update.do?wfno=${wfno }" class="btn btn-warning">수정</a>
					<a href="#" class="btn btn-danger">삭제</a>
				</td>
			</tr>
		</table>
	</div>
	<div class="row" >
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
			</table>
			<div class="rewardtable">
				<table class="table">
					<tr>
						<td>
							<h5>리워드 목록</h5>
						</td>
					</tr>
					<tr class="text-end">
						<td>
							<a href="../makerpage/reward_insert.do?wfno=${wfno }" class="btn btn-sm btn-project">리워드 추가</a>
						</td>
					</tr>
					<tr>
						<td>
							<table class="table" v-for="vo,index in reward_list">
								<tr>
									<th colspan="2" class="text-start" style="color: #a6d8ce;font-size: 15pt">리워드 {{index+1}}</th>
								</tr>
								<tr>
									<th width="30%">리워드명</th>
									<td width="70%">{{vo.rname}}</td>
								</tr>	
								<tr>
									<td colspan="2">{{vo.rcont}}</td>
								</tr>	
								<tr>
									<th width="30%">가격</th>
									<td width="70%">{{vo.rprice}}</td>
								</tr>	
								<tr>
									<th width="30%">배송비</th>
									<td width="70%">{{vo.delfee}}</td>
								</tr>	
								<tr>
									<th width="30%">배송시작일</th>
									<td width="70%">{{vo.delstart}}</td>
								</tr>	
								<tr>
									<th width="30%">한정 수량</th>
									<td width="70%">{{vo.limitq}}</td>
								</tr>
								<tr class="text-end">
									<td colspan="2">
										<a href="#" class="btn btn-sm btn-warning">수정</a>
										<a href="#" class="btn btn-sm btn-danger">삭제</a>
									</td>
								</tr>	
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
new Vue({
	el:'.makerpagemainrow',
	data:{
		wfno:${wfno},
		detail_data:{},
		detailimg:[],
		reward_list:[]
	},
	mounted:function(){
		this.dataRecv()
	},
	methods:{
		dataRecv:function(){
			axios.get("http://localhost/web/makerpage/project_detail_vue.do",{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				this.detail_data=response.data
				this.detailimg = this.detail_data.detailimg.split('^');
			})
			
			axios.get("http://localhost/web/makerpage/reward_list_vue.do",{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				this.reward_list=response.data
			})
			
		}
	}
})
</script>	
</body>
</html>