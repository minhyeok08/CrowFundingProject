<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fund_join{
	align-items: center;	
}
.category_badge{
	margin-top: 5px;
	border: solid 1px #f2f4f6;
    background-color: #f2f4f6;
    color: #495057;
}
.review_item{
	display: flex;
    align-items: center;
    padding: 6px;
    width: 60%;
    border: 2px solid #f2f4f6;
    border-radius: 20px;
    margin-bottom: 10px;
}
.item_poster{
	position: static;
    transform: none;
    border-radius: 8px;
    width: 70px;
    height: 70px;
    object-fit: cover;
    margin-bottom: 15px;
}
.item_titles{
	display: flex;
    flex-direction: column;
    padding-left: 8px;
    width: 100%;
}
.item_category{
	margin-bottom: 4px;
    line-height: 14px;
    font-size: 10px;
    font-weight: 500;
}
.category_badge{
	margin-top: 5px;
	border: solid 1px #f2f4f6;
    background-color: #f2f4f6;
    color: #495057;
}
.item_title{
	line-height: 18px;
    font-size: 14px;
    font-weight: 400;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    min-height: 36px;
}
.item_subtitle{
	font-size: 11px;
	font-weight: 200;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    min-height: 36px;
   	color: grey;
}
.fund_join{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;  
}
</style>
</head>
<body>
<div class="fund_join">
	<h2>${sessionScope.name }님의 참여 내역</h2>
	<div class="review_item" v-for="rvo in fund_list">
		<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
			<img class="item_poster" :src="rvo.mainimg">
		</a>
		<div class="item_titles">
			<span class="item_category">
			<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
				<span class="category_badge">{{rvo.fcname}}</span>
			</a>
			<a :href="'../fund/fund_detail.do?wfno='+rvo.wfno">
				<p class="item_title">{{rvo.rname}}
					<br><span class="item_subtitle">{{rvo.rcont}}</span>
					<br><span class="item_subtitle">총 금액: {{Number(rvo.tprice).toLocaleString()}}원</span>
					&nbsp;&nbsp;&nbsp;<span class="item_subtitle">배송비: {{Number(rvo.delfee).toLocaleString()}}원</span>
					&nbsp;&nbsp;&nbsp;<span class="item_subtitle">결제일: {{rvo.myday}}</span>
					<br><span class="item_subtitle" style="color: #00b2b2">{{rvo.makername}}</span>
				</p>
			</a>
			</span>
		</div>
	</div>
</div>
<script>
new Vue({
	el:'.fund_join',
	data:{
		fund_list:[]
	},
	mounted:function(){
		this.fundList();
	},
	methods:{
		fundList(){
			axios.get('../admin/fund_join_vue.do',{
				params:{
					id:'${sessionScope.id}'
				}
			}).then(res=>{
				this.fund_list=res.data
			}).catch(error=>{
				console.log(error)
			})
		}
	}
})
</script>
</body>
</html>