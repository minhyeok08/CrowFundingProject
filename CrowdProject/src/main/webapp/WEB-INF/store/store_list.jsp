<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row" style="padding:40px 80px 40px 80px">
		    <div class="row">
		      <div class="text-center">
		        <button @click="categoryGetData(0)">전체</button>
		        <button @click="categoryGetData(1)">푸드</button>
		        <button @click="categoryGetData(2)">패션·잡화</button>
		        <button @click="categoryGetData(3)">테크·가전</button>
		        <button @click="categoryGetData(4)">뷰티</button>
		        <button @click="categoryGetData(5)">리빙·베이비</button>
		        <button @click="categoryGetData(6)">여행·스포츠</button>
		        <button @click="categoryGetData(7)">반려동물</button>
		       
		      </div>
		    </div>
			<div class="col-lg-12">
				<div class="row" style="padding-left:">
				<h2>스토어 리스트</h2>
				<div class="col-md-4" v-for="vo in store_list">
					<div class="thumbnail" style="width: 260px;">
						<a href="#">
							<img :src="vo.main_poster" class="main_poster" style="width:260px; height:180px">
							<div class="caption">
								<p style="font-size: 16px; margin-bottom:1px; height: 50px;">{{vo.goods_title}}</p>
								<p style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
									<strong style="color:#a6d8ce">{{vo.price}}</strong>&nbsp;원&nbsp;
									<span style="color:orange">{{vo.score}}점</span>&nbsp;
									<span style="color:blue">{{vo.parti_count}}명 참여</span>
									<span style="text-align:right; margin-left: auto; margin-right:10px;">{{vo.maker_name}}</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				</div>
			</div>
			
		</div>
	</div>
		<script>
		new Vue({
			el:'.container',
			data:{
				scno:1,
				store_list:[]
			},
			mounted:function(){
				this.categoryGetData(this.scno);
			},
			methods:{
				categoryGetData:function(scno){
					axios.get("../store/store_list_vue.do",{
						params:{
							scno:scno
						}
					}).then(response=>{
						console.log(response.data)
						this.store_list = response.data
					}).catch(error=>{
						console.log(error.response)
					})
					
				}
				
			}
		})
	</script>
</body>
</html>