<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.makerpagemainrow{
	border: 2px solid #a6d8ce;
	height: 900px;
}
#makerinfo{
	border: 2px solid #a6d8ce;
}
#makerhome{
	border: 2px solid #a6d8ce;
}
.makerhome_row{
	margin-top: 50px;
}
.userinfo th{
	font-size: 13px;
}
.pagination-container {
    display: flex;
    justify-content: center;
    margin-top: 20px; 
}
.pagination .page-link {
     border-radius: 30px;
     color: #333;
     background-color: #fff;
     border: 1px solid #ddd;
     transition: background-color 0.3s, border-color 0.3s, color 0.3s;
 }

 .pagination .page-link:hover {
     color: #fff;
     background-color: #a6d8ce;
     border-color: #a6d8ce;
 }

 .pagination .page-item.disabled .page-link {
     color: #ccc;
     background-color: transparent;
     border-color: #ddd;
 }

 .pagination .page-item.active .page-link {
     color: #fff;
     background-color: #a6d8ce;
     border-color: #a6d8ce;
 }

 /* 이전, 다음 버튼 스타일링 */
 .pagination .page-item:first-child .page-link,
 .pagination .page-item:last-child .page-link {
     border-radius: 30px; /* 둥글게 */
     color: #333;
     background-color: #fff;
     border: 1px solid #ddd;
     transition: background-color 0.3s, border-color 0.3s, color 0.3s;
 }

 .pagination .page-item:first-child .page-link:hover,
 .pagination .page-item:last-child .page-link:hover {
     color: #fff;
     background-color: #a6d8ce;
     border-color: #a6d8ce;
 }
.btn-custom {
	background-color: transparent;
	border-color: #00b2b2;
	color: #00b2b2;
	transition: background-color 0.3s;
	font-size: 14px;
}

.btn-custom:hover {
	background-color: rgb(234, 248, 249);
	border-color: #00b2b2;
	color: #00b2b2;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	 google.charts.load('current', {'packages':['bar']});
	 google.charts.setOnLoadCallback(drawChart);
	
	 function drawChart() {
	   var data = google.visualization.arrayToDataTable([
	     ['상품이름', '누적 금액'],
	<c:forEach var="vo" items="${list}">
	     ['<c:out value="${vo.ftitle}"/>','<c:out value="${vo.cum_amount}"/>'],
	</c:forEach>
	   ]);
	
	   var options = {
	     chart: {
	       title: '프로젝트 TOP 5',
	       subtitle: '누적 금액 ',
	     },
	     bars: 'horizontal' // Required for Material Bar Charts.
	   };
	
	   var chart = new google.charts.Bar(document.getElementById('barchart_material'));
	
	   chart.draw(data, google.charts.Bar.convertOptions(options));
	 }
</script>
</head>
<body>
	<div class="row makerpagemainrow">
		<div class="col-sm-3 text-center" id="makerinfo">
			<div style="height: 150px"></div>
				<h3 class="text-center"><strong style="color: #a6d8ce">${sessionScope.name }</strong>&nbsp;님의 정보</h3>
			<div style="height: 50px"></div>
			<div class="mb-3">
				<a href="../mypage/mypage_main.do">
					<img :src="user_info.profile_url" style="border-radius: 50%; width: 200px; height: 200px; border: 1px solid #a6d8ce;">
				</a>
			</div>
			<br>
			<div style="height: 50px"></div>
			
			<table class="table userinfo">
				<tr>
					<th width="20%" class="text-end">닉네임</th>
					<td width="80%" class="text-start">{{user_info.nickname}}</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">성별</th>
					<td width="80%" class="text-start">{{user_info.sex}}</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">생년월일</th>
					<td width="80%" class="text-start">{{user_info.birthday}}</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">전화번호</th>
					<td width="80%" class="text-start">{{user_info.phone}}</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">email</th>
					<td width="80%" class="text-start">{{user_info.email}}</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">주소</th>
					<td width="80%" class="text-start" style="font-size: 13px">{{user_info.addr1}}&nbsp;<span v-if="user_info.addr2!=null">{{user_info.addr2}}</span></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-9" id="makerhome">
			<div class="row makerhome_row" style="border: solid 1px #a6d8ce">
				<h3>진행중인 프로젝트 목록</h3>
				<div class="col-3" v-for="vo in project_list">
					<div class="img-thumbnail">
				      <a href="#">
				        <img v-if="vo.mainimg.startsWith('https')" :src="vo.mainimg" style="width:100%;height: 200px;">
				        <img v-else :src="'../Fundimages/'+vo.mainimg" style="width:100%;height: 200px;">
				        <div class="caption">
				          
				          <p>
				          	<div class="progress" style="height:3px;">
							  <div class="progress-bar" :style="{ width: vo.achieve_rate + '%' }" style="background-color:#a6d8ce;"></div>
							</div>
				          </p>
				          <p v-if="vo.achieve_rate!=0">
				          	<strong style="color: #a6d8ce;">달성률 {{vo.achieve_rate}}%</strong>
				          </p>
				          <p v-else>
				          	<strong style="color: #adb5bd;">달성률 {{vo.achieve_rate}}%</strong>
				          </p>
				          <p class="text-center"><strong>{{vo.ftitle}}</strong></p>
				        </div>
				      </a>
				    </div>
				</div>
				<div style="height: 10px"></div>
				<div class="pagination-container">
					<nav aria-label="Page navigation">
					    <ul class="pagination justify-content-center">
					        <li class="page-item" v-if="startPage>1">
					        	<a class="page-link" href="#" aria-label="Previous" @click="prev()">
					        		<span aria-hidden="true">&laquo;</span>
					        	</a>
					        </li>
					        <li class="page-item" :class="i==curpage?'active':''" v-for="i in range(startPage, endPage)">
					        	<a class="page-link" href="#" @click="pageChange(i)">{{i}}</a>
					        </li>
					        <li class="page-item" v-if="endPage<totalpage">
					        	<a class="page-link" href="#" aria-label="Next" @click="next()">
					        		<span aria-hidden="true">&raquo;</span>
					        	</a>
					        </li>
					    </ul>
					</nav>
				</div>
			</div>
			<div style="height: 20px;"></div>
			
			<div id="barchart_material" style="width: 900px; height: 300px;"></div>
		</div>
	</div>
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			id:'${sessionScope.id}',
			user_info:{},
			project_list:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			acno:1,
			chart_list:[]
		},
		mounted:function(){
			axios.get('../makerpage/userinfno_vue.do',{
				params:{
					id:this.id
				}
			}).then(response=>{
				this.user_info=response.data
			})
			this.dataRecv()
		},
		methods:{
			dataRecv:function(){
				axios.get('../makerpage/makerpage_home_vue.do',{
					params:{
						id:this.id,
						acno:this.acno,
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.project_list=response.data
				}).catch(error=>{
					console.log(error.response)
				})
				axios.get('../makerpage/makerpage_home_project_page_vue.do',{
					params:{
						page:this.curpage,
						acno:this.acno,
						id:this.id
					}
				}).then(response=>{
					console.log(response.data)
					this.page_list=response.data
					this.curpage=this.page_list.curpage
					this.totalpage=this.page_list.totalpage
					this.startPage=this.page_list.startPage
					this.endPage=this.page_list.endPage
				}).catch(error=>{
					console.log(error.response)
				})
			},
			range:function(start, end){
				let arr=[];
				let length=end-start;
				for(let i=0;i<=length;i++){
					arr[i]=start;
					start++;
				}
				return arr;
			},
			pageChange:function(page){
				this.curpage=page;
				this.dataRecv()
			},
			prev:function(){
				this.curpage=this.startPage-1;
				this.dataRecv()
			},
			next:function(){
				this.curpage=this.endPage+1;
				this.dataRecv()
			}
		}
	})
</script>	
</body>
</html>