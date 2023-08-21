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
	height: 1000px;
	margin: auto 0px;
	overflow-y: auto;
	
}
</style>
<script type="text/javascript">
$(function(){
	 $('#delfeeExist').change(function() {
	        if ($(this).prop('checked')) 
	        {
	            // 체크되었을 때 실행할 코드 작성
	            $('#delfeeInput').prop('disabled', false)
	        }
	 })
	$('#noDelfee').change(function() {
	       if ($(this).prop('checked')) 
	       {
	           // 체크되었을 때 실행할 코드 작성
	           $('#delfeeInput').prop('disabled', 'disabled')
	       }
    })
})
</script>
</head>
<body>
<!-- 
/*
	    RNO      NOT NULL NUMBER         
		RPRICE            NUMBER         
		RNAME    NOT NULL VARCHAR2(1000) 
		RCONT    NOT NULL CLOB           
		DELFEE            NUMBER         
		DELSTART          VARCHAR2(1000) 
		LIMITQ            NUMBER         
		CURQ              NUMBER         
		WFNO              NUMBER     
*/
 -->
<div class="row makerpagemainrow">
	<form method="post" action="../makerpage/reward_insert_ok.do">
		<table class="table">
			<tr>
				<th width="30%" class="text-end">리워드명</th>
				<td width="70%">
					<input type=text name=rname size=50 class="input-sm">
					<input type="hidden" name=wfno value="${wfno }"> <!-- wfno전송 -->
				</td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">리워드 내용</th>
				<td width="70%"><input type=text name=rcont size=50 class="input-sm"></td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">가격</th>
				<td width="70%"><input type=text name=rprice size=50 class="input-sm"></td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">배송비</th>
				<td width="70%">
					<input type="text" name="delfee" size="5">
				</td>
			</tr>
			<tr>
				<th width="30%" class="text-end">배송시작 정보</th>
				<td width="70%"><input type=text name=delstart size=50 class="input-sm"></td> 
			</tr>
			<tr>
				<th width="30%" class="text-end">한정 수량</th>
				<td width="70%"><input type=text name=limitq size=50 class="input-sm"></td> 
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

</body>
</html>