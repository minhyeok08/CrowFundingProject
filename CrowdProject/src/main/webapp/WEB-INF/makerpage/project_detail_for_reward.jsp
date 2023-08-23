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
.reward
{
	border-radius: 30%;
	border: 5px dotted #a6d8ce; 
}
</style>
</head>
<body>
<div class="row makerpagemainrow">
	<div class="Btnrow">
		<table class="table">
			<tr class="text-end">
				<td>
					<a href="../makerpage/project_update_for_reward.do?wfno=${wfno }" class="btn btn-warning">수정</a>
					<button type="button" class="btn btn-xs btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
    					삭제
    				</button>
				</td>
			</tr>
		</table>
	</div>
	<div class="col-sm-7">
		<table class="table storytable">
			<tr>
				<td>
					<img :src="'../Fundimages/'+detail_data.mainimg">
				</td>
			</tr>
			<tr>
				<td style="font-style: bold;color: #616161;font-size: 30pt">프로젝트 스토리</td>
			</tr>
			<tr v-if="detail_data.detailcont!=null" class="text-start">
				<td style="font-size: 15pt">{{detail_data.detailcont}}</td>
			</tr>
			<tr v-for="img in detailimg">
				<td>
					<img :src="'../Fundimages/'+img">
				</td>
			</tr>
		</table>
	</div>
	<div class="col-sm-5">
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
				<td width="80%" style="font-size: 20pt">
					<a :href="'https://www.instagram.com/'+detail_data.makerinsta+'/'" target="_blank"><i v-if=detail_data.makerinsta!=null class="fa-brands fa-instagram"></i></a>					
					<a :href="'https://www.facebook.com/'+detail_data.makerfacebook+'/'" target="_blank"><i v-if=detail_data.makerfacebook!=null class="fa-brands fa-facebook"></i></a>					
					<a :href="'https://www.twitter.com/'+detail_data.makertwitter+'/'" target="_blank"><i v-if=detail_data.makertwitter!=null class="fa-brands fa-twitter"></i></a>					
				</td>
			</tr>
		</table>
		<table class="table reward">
			<tr>
				<td style="height: 100px;border: none">
				</td>
			</tr>
			<tr>
				<td class="text-center" style="border: none">
					<a href="../makerpage/reward_insert.do?wfno=${wfno }" class="btn btn-project">리워드 등록</a>
				</td>
			</tr>
			<tr>
				<td style="height: 100px;border: none">
				</td>
			</tr>
		</table>
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
			detailimg:[]
		},
		mounted:function(){
			axios.get("../makerpage/project_detail_for_reward_vue.do",{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				this.detail_data=response.data
				this.detailimg = this.detail_data.detailimg.split('^');
			})
		},
		methods:{
			del:function(){
				axios.get('../makerpage/makerpage_project_for_reward_delete_vue.do',{
					params:{
						wfno:this.wfno
					}
				}).then(res=>{
					location.href="../makerpage/project_list_for_reward.do"
				})
			}
		}
	})
</script>
</body>
</html>