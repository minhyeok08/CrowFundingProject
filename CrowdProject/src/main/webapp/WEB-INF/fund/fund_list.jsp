<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}
.wlist {
	position: relative;
	margin: 0 auto 80px;
	padding: 0 16px 80px;
	padding-right: 16px;
	padding-left: 16px;
	max-width: 1024px;
}
.wcate1 {
	position: sticky;
	z-index: 10;
	background-color: #fff;
	padding: 8px 0;
	width: 100%;
}
.wcate2 {
	display: flex;
	justify-content: center;
}
.wcate3 {
	position: relative;
	min-height: 48px;
	overflow: hidden;
}
.wcate4 {
	display: flex;
	position: relative;
	gap: 8px;
	background-color: #fff;
	padding: 0 16px;
	height: 100%;
	overflow-x: auto;
	max-width: 1300px;
	scrollbar-width: none;
}

.wcate5 {
	background-repeat: no-repeat;
	background-size: cover;
	border: 1px solid black;
}

.all {
	background:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld0JveD0iMCAwIDQwIDQwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEg0MFY0MEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3NDguMDAwMDAwLCAtMjM5Ny4wMDAwMDApIHRyYW5zbGF0ZSgxNzQ4LjAwMDAwMCwgMjM5Ny4wMDAwMDApIi8+CiAgICAgICAgICAgICAgICA8ZyBmaWxsLXJ1bGU9Im5vbnplcm8iPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiMwRTdDODIiIGQ9Ik0xNS4wOTIgMTYuNmwtMTMuOCA1LjZDLjUyIDIyLjQ2IDAgMjMuMTg1IDAgMjRjMCAuODE1LjUyIDEuNTQgMS4yOTIgMS44bDEzLjggNS42YzEuOTIuOCA0LjA4LjggNiAwbDEzLjgtNS42Yy42OS0uMzM0IDEuMTI4LTEuMDMzIDEuMTI4LTEuOCAwLS43NjctLjQzOC0xLjQ2Ni0xLjEyOC0xLjhsLTEzLjgtNS42Yy0xLjkyLS44LTQuMDgtLjgtNiAweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3NDguMDAwMDAwLCAtMjM5Ny4wMDAwMDApIHRyYW5zbGF0ZSgxNzQ4LjAwMDAwMCwgMjM5Ny4wMDAwMDApIHRyYW5zbGF0ZSgyLjAwMDAwMCwgNC4wMDAwMDApIi8+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzBCOEM5MCIgZD0iTTE1LjA5MiA4LjZsLTEzLjggNS42Qy41MiAxNC40NiAwIDE1LjE4NSAwIDE2YzAgLjgxNS41MiAxLjU0IDEuMjkyIDEuOGwxMy44IDUuNmMxLjkyLjggNC4wOC44IDYgMGwxMy44LTUuNmMuNjktLjMzNCAxLjEyOC0xLjAzMyAxLjEyOC0xLjggMC0uNzY3LS40MzgtMS40NjYtMS4xMjgtMS44bC0xMy44LTUuNmMtMS45Mi0uOC00LjA4LS44LTYgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xNzQ4LjAwMDAwMCwgLTIzOTcuMDAwMDAwKSB0cmFuc2xhdGUoMTc0OC4wMDAwMDAsIDIzOTcuMDAwMDAwKSB0cmFuc2xhdGUoMi4wMDAwMDAsIDQuMDAwMDAwKSIvPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiMwMEIyQjIiIGQ9Ik0xNS4wOTIuNmwtMTMuOCA1LjZDLjYwMiA2LjUzNC4xNjQgNy4yMzMuMTY0IDhjMCAuNzY3LjQzOCAxLjQ2NiAxLjEyOCAxLjhsMTMuOCA1LjZjMS45Mi44IDQuMDguOCA2IDBsMTMuOC01LjZjLjY5LS4zMzQgMS4xMjgtMS4wMzMgMS4xMjgtMS44IDAtLjc2Ny0uNDM4LTEuNDY2LTEuMTI4LTEuOEwyMS4wOTIuNmMtMS45Mi0uOC00LjA4LS44LTYgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xNzQ4LjAwMDAwMCwgLTIzOTcuMDAwMDAwKSB0cmFuc2xhdGUoMTc0OC4wMDAwMDAsIDIzOTcuMDAwMDAwKSB0cmFuc2xhdGUoMi4wMDAwMDAsIDQuMDAwMDAwKSIvPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K);
}

.tech {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_tech.png");
}

.fashion {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_fashion.png");
}

.beauty {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_beauty.png");
}

.living {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_living.png");
}

.outdoor {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_outdoor.png");
}

.food {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_food.png");
}

.publishing {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_publishing.png");
}

.sport {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_sport.png");
}

.class {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_class.png");
}

.design {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_design.png");
}

.pet {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_pet.png");
}

.kid {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_kid.png");
}

.culture {
	background-image:
		url("https://cdn3.wadiz.kr/category/icon/category_culture.png");
}

.wbtn1 {
	border: 0;
	background-color: rgba(0, 0, 0, 0);
	cursor: pointer;
	min-width: 64px;
	height: 64px;
	overflow: hidden;
}

.wbtn2>* {
	pointer-events: none;
}

.wbtn3 {
	display: flex;
	position: relative;
	align-items: center;
	justify-content: center;
	border: 2px solid rgba(0, 0, 0, 0);
	border-radius: 8px;
	background-color: #f2f4f6;
	padding: 2px;
	width: 64px;
	height: 40px;
	overflow: hidden;
}

.wbtn4 {
	background-repeat: no-repeat;
	background-size: cover;
	box-sizing: border-box;
	width: 32px;
	height: 32px;
}

.wtext1 {
	display: flex;
	justify-content: center;
	margin-top: 4px;
	width: 100%;
	height: 18px;
}

.wtext2 {
	line-height: 18px;
	font-size: 12px;
	font-weight: 400;
	color: #495057;
}
.wslider1 {
	position: absolute;
	width: 40px;
	height: 74px;
	right: 0;
	top: 0;
	background: linear-gradient(90deg,rgba(255,255,255,0) 0%,#FFFFFF 60%);
	color: #495057;
	display: flex;
	align-items: center;
	justify-content: end;
	cursor: pointer;
}
.wslider2 {
	display: block;
	transform: scale(1);
	transition: transform .3s ease-out;
	width: 1em;
	height: 1em;
	fill: currentColor;
}
</style>
</head>
<body>
	<div class="container-fluid" id="wFund">
		<div class="row" style="margin-top:50px;">
			<div class="row">
				<div class="wcate1 undefined" style="top: 0px;">
					<div class="wcate2">
						<div class="wcate3">
							<ul class="wcate4">
								<li data-index="0"><button class="wbtn1" @click="categoryGetData(0)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4 all"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">전체</span>
										</div>
									</button></li>
								<li data-index="1"><button class="wbtn1" @click="categoryGetData(1)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_tech.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">테크·가전</span>
										</div>
									</button></li>
								<li data-index="2"><button class="wbtn1" @click="categoryGetData(2)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_fashion.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">패션·잡화</span>
										</div>
									</button></li>
								<li data-index="3"><button class="wbtn1" @click="categoryGetData(3)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_living.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">홈·리빙</span>
										</div>
									</button></li>
								<li data-index="4"><button class="wbtn1" @click="categoryGetData(4)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_beauty.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">뷰티</span>
										</div>
									</button></li>
								<li data-index="5"><button class="wbtn1" @click="categoryGetData(5)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_food.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">푸드</span>
										</div>
									</button></li>
								<li data-index="6"><button class="wbtn1" @click="categoryGetData(6)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_publishing.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">출판</span>
										</div>
									</button></li>
								<li data-index="7"><button class="wbtn1" @click="categoryGetData(7)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_class.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">클래스·컨설팅</span>
										</div>
									</button></li>
								<li data-index="8"><button class="wbtn1" @click="categoryGetData(8)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_outdoor.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">레저·아웃도어</span>
										</div>
									</button></li>
								<li data-index="9"><button class="wbtn1" @click="categoryGetData(9)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_sport.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">스포츠·모빌리티</span>
										</div>
									</button></li>
								<li data-index="10"><button class="wbtn1" @click="categoryGetData(10)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_culture.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">컬쳐·아티스트</span>
										</div>
									</button></li>
								<li data-index="11"><button class="wbtn1" @click="categoryGetData(11)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_design.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">캐릭터·굿즈</span>
										</div>
									</button></li>
								<li data-index="12"><button class="wbtn1" @click="categoryGetData(12)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_pet.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">반려동물</span>
										</div>
									</button></li>
								<li data-index="13"><button class="wbtn1" @click="categoryGetData(13)">
										<div class="wbtn2">
											<div class="wbtn3">
												<div class="wbtn4"
													style="background-image: url(&quot;https://cdn3.wadiz.kr/category/icon/category_kid.png&quot;);"></div>
											</div>
										</div>
										<div class="wtext1">
											<span class="wtext2">베이비·키즈</span>
										</div>
									</button></li>
							</ul>
							<!-- <div class="wslider1" @click="handleSliderClick" ref="slider">
								<svg viewBox="0 0 24 24" fill="none" focusable="false" role="presentation" class="wslider2" style="width: 20px; height: 20px;" aria-hidden="true">
									<path fill-rule="evenodd" clip-rule="evenodd" d="M7.924 2.576l-.848.848L15.65 12l-8.575 8.576.848.848L17.35 12 7.924 2.576z"></path>
								</svg>
							</div> -->
						</div>
					</div>
				</div>
		      </div>
		    </div>
		<div class="col-lg-12 wlist">
			<div class="row">
				<h2 style="margin: 20px 0px 20px 0px;"></h2>
				<div class="col-md-4" v-for="vo in fund_list">
					<div class="thumbnail" style="width: 260px;">
						<a :href="'../fund/fund_detail_before.do?wfno='+vo.wfno"> 
						<img v-if="vo.mainimg.startsWith('http')" :src="vo.mainimg" class="store_poster"
							style="width: 260px; height: 180px">
						<img v-else :src="'../Fundimages/'+vo.mainimg" class="store_poster"
							style="width: 260px; height: 180px">
							<div class="caption">
								<p style="font-size: 16px; margin-bottom: 1px; height: 50px;">{{vo.ftitle}}</p>
								<p
									style="font-size: 12px; display: flex; justify-content: space-between; align-items: center;">
									<strong style="color: #a6d8ce">{{vo.cum_amount}}</strong>&nbsp;원&nbsp;
									<span style="color: orange">{{vo.achieve_rate}}%</span> <span
										style="text-align: right; margin-left: auto; margin-right: 10px;">{{vo.makername}}</span>
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
		<script>
		new Vue({
			el:'#wFund',
			data:{
				fcno:1,
				fund_list:[]
			},
			mounted:function(){
				this.categoryGetData(this.fcno);
			},
			methods:{
				categoryGetData:function(fcno){
					axios.get("../fund/fund_list_vue.do",{
						params:{
							fcno:fcno
						}
					}).then(response=>{
						console.log(response.data)
						this.fund_list = response.data
					}).catch(error=>{
						console.log(error.response)
					})
					
				}
				/* handleSliderClick: function() {
					  var slider = this.$refs.slider; // slider 엘리먼트의 ref를 지정해주세요

					  if (slider) {
					    slider.scrollTo({
					      left: slider.scrollLeft + slider.offsetWidth * 0.8,
					      behavior: "smooth"
					    });
					  }
					} */
			}
		})
	</script>
</body>
</html>