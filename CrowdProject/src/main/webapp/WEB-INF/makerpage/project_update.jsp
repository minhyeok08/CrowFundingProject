<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.updatepage{
	border: 2px solid #a6d8ce;
	height: 900px; 
	overflow-y:auto; 
}
.makerpagemainrow{
	margin 0px auto;
	width: 700px;
	border: none;
}
.makerpagemainrow th,td	{
	
	border: none;
}
.fundinsert{
	height:800px;
}
</style>
<script type="text/javascript">
$(function(){
	$("form").submit(function(e) {
	    if ($("input[name='makername']").val().trim() === "") { // makername이 공백인 경우
	      e.preventDefault(); // 기본 동작(폼 제출)을 막음
	      $("input[name='makername']").focus(); // makername 입력 필드에 포커스를 줌
	    }
	    else if ($("input[name='makeremail']").val().trim() === "") { // makername이 공백인 경우
	      e.preventDefault(); // 기본 동작(폼 제출)을 막음
	      $("input[name='makeremail']").focus(); // makername 입력 필드에 포커스를 줌
	    }
	    else if ($("input[name='makertel']").val().trim() === "") { // makername이 공백인 경우
	      e.preventDefault(); // 기본 동작(폼 제출)을 막음
	      $("input[name='makertel']").focus(); // makername 입력 필드에 포커스를 줌
	    }
	    else if ($("input[name='ftitle']").val().trim() === "") { // makername이 공백인 경우
	      e.preventDefault(); // 기본 동작(폼 제출)을 막음
	      $("input[name='ftitle']").focus(); // makername 입력 필드에 포커스를 줌
	    }
	    else if ($("input[name='aim_amount']").val().trim() === "") { // makername이 공백인 경우
	      e.preventDefault(); // 기본 동작(폼 제출)을 막음
	      $("input[name='aim_amount']").focus(); // makername 입력 필드에 포커스를 줌
	    }
	    else if ($("input[name='fsubtitle']").val().trim() === "") { // makername이 공백인 경우
	      e.preventDefault(); // 기본 동작(폼 제출)을 막음
	      $("input[name='fsubtitle']").focus(); // makername 입력 필드에 포커스를 줌
	    }
	 })
})
</script>
</head>
<body>
<div class="updatepage">
	<div class="row makerpagemainrow">
		<form method="post" action="../makerpage/project_update_ok.do" enctype="multipart/form-data">	
			<table class="table fundinsert">
				<tr>
					<th width="30%" class="text-end">메이커명</th>
					<td width="70%">
						<input type=text name=makername size=50 class="input-sm" :value="detail_data.makername">
						<input type=hidden name=wfno :value="detail_data.wfno">
					</td> 
					
				</tr>
				<tr>
					<th width="30%" class="text-end">메이커사진</th>
					<td width="70%">
						<img v-if="detail_data.makerphoto.startsWith('http')" :src="detail_data.makerphoto" style="width: 100px;height: 100px;">
						<img v-else :src="'../Fundimages/'+detail_data.makerphoto" style="width: 100px;height: 100px;">
					</td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">문의메일</th>
					<td width="70%"><input type=text name=makeremail size=50 class="input-sm" :value="detail_data.makeremail"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">문의번호</th>
					<td width="70%"><input type=text name=makertel size=50 class="input-sm" :value="detail_data.makertel"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">홈페이지</th>
					<td width="70%"><input type=text name=makerhomepage size=50 class="input-sm" :value="detail_data.makerhomepage"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">instagram</th>
					<td width="70%"><input type=text name=makerinsta size=50 class="input-sm" :value="detail_data.makerinsta"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">facebook</th>
					<td width="70%"><input type=text name=makerfacebook size=50 class="input-sm" :value="detail_data.makerfacebook"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">twitter</th>
					<td width="70%"><input type=text name=makertwitter size=50 class="input-sm" :value="detail_data.makertwitter"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">카테고리</th>
					<td width="70%">	
						<select id="category" name="fcno" style="width: 408px">
							<option value="1">테크·가전</option>
							<option value="2">패션·잡화</option>
							<option :value="3" >홈·리빙</option>
							<option value="4">뷰티</option>
							<option value="5">푸드</option>
							<option value="6">출판</option>
							<option value="7">클래스·컨설팅</option>
							<option value="8">레저·아웃도어</option>
							<option value="9">스포츠·모빌리티</option>
							<option value="10">컬쳐·아티스트</option>
							<option value="11">캐릭터·굿즈</option>
							<option value="12">반려동물</option>
							<option value="13">베이비·키즈</option>
							<option value="14">게임·취미</option>
							<option value="15">여행·숙박</option>
							<option value="16">후원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th width="30%" class="text-end">제목</th>
					<td width="70%"><input type=text name=ftitle size=50 class="input-sm" :value="detail_data.ftitle"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">목표금액</th>
					<td width="70%"><input type=text name=aim_amount size=50 class="input-sm" :value="detail_data.aim_amount"></td> 
				</tr>
				<tr>
					<th width="30%" class="text-end">대표사진</th>
					<td width="70%">
						<img v-if="detail_data.mainimg.startsWith('http')" :src="detail_data.mainimg" style="width: 100px;height: 100px;">
						<img v-else :src="'../Fundimages/'+detail_data.mainimg" style="width: 100px;height: 100px;">
					</td>
				</tr>
				<tr>
				    <th width="30%" class="text-end" style="font-size: 10pt">시작일/종료일</th>
				    <td width="70%">
				        <input type="date" name="stropenday"> ~ <input type="date" name="strendday">
				    </td>
				</tr>
				<tr>
					<th width="30%" class="text-end">검색 태그</th>
					<td width="70%">
					<input type=text name=tag size=50 class="input-sm" :value="detail_data.tag">
					</td>
				</tr>
				<tr>
					<th width="30%" class="text-end">스토리 소개</th>
					<td width="70%">
						<textarea cols="50" rows="5" name="fsubtitle">{{detail_data.fsubtitle}}</textarea>
					</td>
				</tr>
				<tr>
					<th width="30%" class="text-end">소개 사진</th>
					<td width="70%" >
						<img v-for="img in detailimages" v-if="img.startsWith('http')" :src="img" style="width: 100px;height: 100px;">
						<img v-for="img in detailimages" v-else :src="'../Fundimages/'+img" style="width: 100px;height: 100px;">
					</td>
				</tr>
				
				<tr>
					<th width="30%" class="text-end">설명</th>
					<td width="70%">
						<textarea cols="50" rows="5" name="detailcont">{{detail_data.detailcont}}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button class="btn btn-sm btn-primary">수정</button>
						<input type=button value="취소" class="btn btn-sm btn-primary"
						onclick ="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>	
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			wfno:${wfno},
			detail_data:{},
			detailimages:[],
		},
		mounted:function(){
			axios.get("../makerpage/project_detail_vue.do",{
				params:{
					wfno:this.wfno
				}
			}).then(response=>{
				this.detail_data=response.data
				this.detailimages=this.detail_data.detailimg.split("^")
			})
		}
	})
</script>	
</body>
</html>