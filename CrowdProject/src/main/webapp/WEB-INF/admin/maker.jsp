<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.adminContainer{
	margin: 0px auto;
	width: 90%;
}
#member_table > thaed {
	font-size: 11pt;
	border-bottom: 1px solid;
}
#member_table > tbody {
	font-size: 10pt;
}
</style>
</head>
<body>
	<div style="height: 40px;"></div>
	<div class="adminContainer">
		<table class="table" id="member_table">
		<thead>
			<tr style="border-bottom: 1px solid gray;">
				<th class="text-center">아이디</th>
				<th class="text-center">이름</th>
				<th class="text-center">이메일</th>
				<th class="text-center">연락처</th>
				<th class="text-center">성별</th>
				<th class="text-center">생년월일</th>
				<th>주소</th>
				<th class="text-center">관리자</th>
				<th class="text-center">포인트</th>
				<th class="text-center">등록일</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="vo in maker_list">
				<td class="text-center">{{vo.id}}</td>
				<td class="text-center">{{vo.name}}</td>
				<td class="text-center">{{vo.email}}</td>
				<td class="text-center">{{vo.phone}}</td>
				<td class="text-center">{{vo.sex}}</td>
				<td class="text-center">{{vo.birthday}}</td>
				<td>{{vo.addr1}}</td>
				<td class="text-center">{{vo.admin}}</td>
				<td class="text-center">{{vo.point}}</td>
				<td class="text-center">{{vo.dbday}}</td>
			</tr>
		</tbody>
	</table>
	</div>
	<script>
		new Vue({
	 		el:'.adminContainer',
	 		data:{
	 			page:1,
	 			maker_list:[],
	 			maker_detail:{}
	 		},
	 		mounted:function(){
	 			this.makerListData(1);
	 		},
	 		methods: {
	 	        makerListData: function (page) {
	 	            axios.get('http://localhost/web/admin/maker_list_vue.do', {
	 	                params: {
	 	                    page: '1'
	 	                }
	 	            }).then(response => {
	 	                console.log(response.data)
	 	                this.maker_list = response.data
	 	            }).catch(error => {
	 	                console.log(error.response)
	 	            })
	 	        }
	 	    }
		})
	</script>
</body>
</html>