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
.reward{
	border-collapse: collapse;
	border-radius: 10px; /* 원하는 radius 값으로 조정 가능 */
	border: 1px solid #dde2e6;
	height: 600px;
	overflow-y: auto;
}
.storytable{
	text-align: center;
}
.storytable img {
  width: 650px;
  height: auto;
  border-radius: 8px; 
  box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px;
}
.storytable tr,td{
	border: none;
}
.rounded-image {
  border-radius: 50%;
  width: 30x; /* 이미지 너비 설정 */
  height: 30px; /* 이미지 높이 설정 */
}
.makertable{
	border-collapse: collapse;
	border-radius: 10px; /* 원하는 radius 값으로 조정 가능 */
	overflow: hidden; /* 모서리 내용이 반경을 벗어나지 않도록 함 */
	box-shadow: rgba(0, 0, 0, 0.3) 0px 4px 6px;
}
.makertable th{
	border: none;
	color: #adb5bd;
	font-size: 10pt
}
.makertable td{
	border: none;
	font-size: 10pt
}
.rewardtable{
	border-collapse: collapse;
	border-radius: 10px; /* 원하는 radius 값으로 조정 가능 */
	overflow: hidden; /* 모서리 내용이 반경을 벗어나지 않도록 함 */
	box-shadow: rgba(0, 0, 0, 0.3) 0px 4px 6px;
}
.rewardtable th,td{
	border:none;
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
					<button type="button" class="btn btn-xs btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
    					삭제
    				</button>
				</td>
			</tr>
		</table>
	</div>
	<div class="row" >
		<div class="col-7">
			<table class="table storytable">
				<tr>
					<td>
						<img v-if="detail_data.mainimg.startsWith('https')" :src="detail_data.mainimg">
						<img v-else :src="'../Fundimages/'+detail_data.mainimg">
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
						<img v-if="img.startsWith('https')" :src="img">
						<img v-else :src="'../Fundimages/'+img">
					</td>
				</tr>
			</table>
		</div>
		<div class="col-5">
			<table class="table">
				<tr>
					<td style="font-style: bold">{{detail_data.fcname}}&nbsp;&gt;&nbsp;<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px; color: black; font-size: 14px;"><span style="color: #a6d8ce">#</span>{{detail_data.tag}}</span></td>
				</tr>
				<tr>
					<td>
						<strong>{{detail_data.ftitle}}</strong>
					</td>
				</tr>
				<tr>
					<td style="font-size: 13px">{{detail_data.fsubtitle}}</td>
				</tr>
				<tr>
					<td style="font-size: 10pt;"><strong>목표금액&nbsp;<span style="color: #a6d8ce;font-size: 15pt">{{detail_data.str_aim_amount}}</span>원</strong></td>
				</tr>
				<tr>
					<td style="color: #a6d8ce;">
						<span style="font-size: 25px"><strong>{{detail_data.str_cum_amount}}</strong></span>원 달성
					</td>
				</tr>
				<tr>
					<td style="font-size: 17px">
						<strong>{{detail_data.str_achieve_rate}}% 달성</strong>&nbsp;&nbsp;&nbsp;
						<span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px; color: black; font-size: 14px;">{{detail_data.str_parti_count}}명 참여</span>
					</td>
				</tr>
				<tr>
					<td>
						<button class="rounded" style="border: none">
							<img width="30" height="20" alt="Clapping Hands"
								src="../images/hands-clapping.svg">
								<br>
								{{detail_data.jjim}}	
						</button>
						<button class="rounded" style="border: none">
							<img width="30" height="20" alt="Clapping Hands"
								src="../images/heart.svg">
							<br>
								{{detail_data.jjim}}	
						</button>
					</td>
				</tr>
			</table>
			<table class="table makertable">
				<tr>
					<td width="20%" class="text-center circle-image">
						<img  v-if="detail_data.makerphoto.startsWith('https')" :src="detail_data.makerphoto" class="rounded-image" style="width: 30px;height: 30px;">
						<img  v-else :src="'../Fundimages/'+detail_data.makerphoto" class="rounded-image" style="width: 30px;height: 30px;">
					</td>
					<td width="80%">
						<strong>{{detail_data.makername}}</strong>
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
					<td width="80%" style="font-size: 15pt">
						<a :href="'https://www.instagram.com/'+detail_data.makerinsta+'/'" target="_blank"><i v-if=detail_data.makerinsta!=null class="fa-brands fa-instagram"></i></a>					
						<a :href="'https://www.facebook.com/'+detail_data.makerfacebook+'/'" target="_blank"><i v-if=detail_data.makerfacebook!=null class="fa-brands fa-facebook"></i></a>					
						<a :href="'https://www.twitter.com/'+detail_data.makertwitter+'/'" target="_blank"><i v-if=detail_data.makertwitter!=null class="fa-brands fa-twitter"></i></a>					
					</td>
				</tr>
			</table>
			<div class="reward">
				<table class="table">
					<tr>
						<td>
							<div class="row">
								<div class=col-6><span style="font-size: 20px" class="text-start">리워드 목록</span></div>
								<div class=col-6 class="text-end"><strong style="font-size: 12px;color: #adb5bd;">진행기간&nbsp;{{detail_data.stropenday}}~{{detail_data.strendday}}</strong></div>
							</div>
							
						</td>
					</tr>
					<tr class="text-end">
						<td>
							<a href="../makerpage/reward_insert_add.do?wfno=${wfno }" class="btn btn-sm btn-project">리워드 추가</a>
						</td>
					</tr>
					<tr>
						<td>
							<table class="table rewardtable" v-for="vo,index in reward_list">
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
	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">프로젝트 만들기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        게시물을 정말 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-xs btn-project" @click="del()">확인</button>
	        <button type="button" class="btn btn-xs btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
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
			axios.get("../makerpage/project_detail_vue.do",{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				this.detail_data=response.data
				this.detailimg = this.detail_data.detailimg.split('^');
			})
			
			axios.get("../makerpage/reward_list_vue.do",{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				this.reward_list=response.data
			})
			
		},
		rewardDelete:function(no){
			axios.get("../makerpage/reward_delete_vue.do",{
				params:{
					rno:no,
					wfno:this.wfno
				}
			}).then(response=>{
				this.reward_list=response.data
				this.dataRecv()
			})
		},
		del:function(){
			axios.get('../makerpage/makerpage_project_delete_vue.do',{
				params:{
					wfno:this.wfno
				}
			}).then(res=>{
				location.href="../makerpage/project_list.do"
			})
		}
	}
})
</script>	
</body>
</html>