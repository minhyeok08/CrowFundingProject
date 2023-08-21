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
.storytable{
	text-align: center;
}
.storytable img {
  width: 750px;
  height: auto;
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
			<table class="table storytable">
				<tr>
					<td>
						<img :src="'../Fundimages/'+detail_data.mainimg">
					</td>
				</tr>
				<tr>
					<td style="font-style: bold;color: #616161"><h4>프로젝트 스토리</h4></td>
				</tr>
				<tr v-if="detail_data.detailcont!=null">
					<td style="font-size: 17pt" class="text-start">{{detail_data.detailcont}}</td>
				</tr>
				<tr v-for="img in detailimg">
					<td>
						<img :src="'../Fundimages/'+img">
					</td>
				</tr>
			</table>
		</div>
		<div class="col-5">
			<table class="table">
				<tr>
					<td style="font-style: bold">{{detail_data.fcname}}&nbsp;&gt;&nbsp;<span style="color: #a6d8ce">#</span><span style="font-size: 10pt">{{detail_data.tag}}</span></td>
				</tr>
				<tr>
					<td style="font-size: 20pt;font-style: bold">{{detail_data.ftitle}}</td>
				</tr>
				<tr>
					<td style="font-size: 10pt;">{{detail_data.fsubtitle}}</td>
				</tr>
				<tr>
					<td style="font-size: 15pt;">목표금액&nbsp;<span style="color: #a6d8ce;font-size: 20pt">{{detail_data.str_aim_mount}}</span>원</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td width="20%" class="text-center">
						<img :src="'../Fundimages/'+detail_data.makerphoto" class="rounded-image">
					</td>
					<td width="80%">
						<h5 style="font-style: bold">{{detail_data.makername}}</h5>
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">문의 전화</th>
					<td width="80%">{{detail_data.makertel}}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">문의 메일</th>
					<td width="80%">{{detail_data.makeremail}}</td>
				</tr>
				<tr v-if=detail_data.makerhomepage!=null>
					<th width="20%" class="text-center">홈페이지</th>
					<td width="80%">{{detail_data.makerhomepage}}</td>
				</tr>
				<tr v-if="detail_data.makerinsta!=null || detail_data.makerfacebook!=null || detail_data.makertwitter!=null">
					<th width="20%" class="text-center">SNS</th>
					<td width="80%" style="font-size: 30pt">
						<a :href="'https://www.instagram.com/'+detail_data.makerinsta+'/'" target="_blank"><i v-if=detail_data.makerinsta!=null class="fa-brands fa-instagram"></i></a>					
						<a :href="'https://www.facebook.com/'+detail_data.makerfacebook+'/'" target="_blank"><i v-if=detail_data.makerfacebook!=null class="fa-brands fa-facebook"></i></a>					
						<a :href="'https://www.twitter.com/'+detail_data.makertwitter+'/'" target="_blank"><i v-if=detail_data.makertwitter!=null class="fa-brands fa-twitter"></i></a>					
					</td>
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
									<td width="70%">{{vo.strrprice}}</td>
								</tr>	
								<tr>
									<th width="30%">배송비</th>
									<td width="70%">{{vo.strdelfee}}</td>
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
										<a :href="'../makerpage/reward_update.do?rno='+vo.rno" class="btn btn-sm btn-warning">수정</a>
										<button class="btn btn-sm btn-danger" @click="rewardDelete(vo.rno)">삭제</button>
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
			
		},
		rewardDelete:function(no){
			axios.get("http://localhost/web/makerpage/reward_delete_vue.do",{
				params:{
					rno:no,
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