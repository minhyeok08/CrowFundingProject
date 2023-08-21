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
</style>
</head>
<body>
<div class="row makerpagemainrow">
	<form method="post" action="../makerpage/reward_update_ok.do">
		<table class="table">
			<tr>
				<th width="30%" class="text-end">리워드명</th>
				<td width="70%">
					<input type=text name=rname size=50 class="input-sm" :value="reward_data.rname">
					<input type=hidden name=rno value="${rno }">
					<input type=hidden name=wfno :value="reward_data.wfno">
				</td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">리워드 내용</th>
				<td width="70%"><input type=text name=rcont size=50 class="input-sm" :value="reward_data.rcont"></td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">가격</th>
				<td width="70%"><input type=text name=rprice size=50 class="input-sm" :value="reward_data.rprice"></td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">배송비</th>
				<td width="70%">
					<input type="text" name="delfee" size="5" :value="reward_data.delfee">
				</td>
			</tr>
			<tr>
				<th width="30%" class="text-end">배송시작 정보</th>
				<td width="70%"><input type=text name=delstart size=50 class="input-sm" :value="reward_data.delstart"></td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">한정 수량</th>
				<td width="70%"><input type=text name=limitq size=50 class="input-sm" :value="reward_data.limitq"></td> 
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-sm btn-primary">등록</button>
					<input type=button value="취소" class="btn btn-sm btn-primary"
					onclick ="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
</div>
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			rno:${rno},
			reward_data:{}
		},
		mounted:function(){
			axios.get("http://localhost/web/makerpage/reward_detail_vue.do",{
				params:{
					rno:this.rno
				}
			}).then(response=>{
				this.reward_data=response.data
			})
		}
	})
</script>
</body>
</html>