<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 1100px;
	margin-top: 30px;
}

.reserveImg {
	width: 120px;
	height: 120px;
	border-radius: 8px;
}

.buyBox {
	position: fixed;
	width: 400px;
}

#thunderImg {
	width: 28px;
	height: 33px;
}

.text-right {
	text-align: right !important;
}

.btn-buy {
	width: 300px;
	height: 50px;
}

.btn-wish {
	width: 300px;
	height: 40px;
}

.buyTd {
	stext-align: center;
	margin: 10px;
}

.wishTd {
	stext-align: center;
	margin: 10px;
}

.wishTd button {
	display: block; /* 버튼을 블록 레벨 요소로 설정하여 가운데 정렬을 적용할 수 있도록 함 */
	margin: 0 auto; /* 수평 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정 */
}

.buyTd a {
	display: flex; /* 버튼을 flex 컨테이너로 설정 */
	justify-content: center; /* 가로 방향 가운데 정렬 */
	align-items: center; /* 세로 방향 가운데 정렬 */
	margin: 0 auto; /* 수평 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정 */
}
.payImg{
	width: 48px;
	height: 30px;
	align-items: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: none;
}

table td {
	padding: 10px;
}

#score_icon {
	width: 10px;
	height: 10px;
	vertical-align: middle;
	margin-top: -5px;
}

#agreeBtn1 {
	vertical-align: middle;
	margin-top: -10px;
	border: none;
	border-radius: 14px;
}

#agreeBtn2 {
	vertical-align: middle;
	margin-top: -10px;
	border: none;
	border-radius: 14px;
}

#agreeBtn3 {
	vertical-align: middle;
	margin-top: -12px;
	border: none;
	border-radius: 14px;
}
</style>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="//unpkg.com/vue@2.6.14/dist/vue.js"></script>

<script type="text/javascript">
	$(function() {
		$('#checkall').click(function() {
			if ($('#checkall').is(':checked')) {
				$('.checkbox').prop("checked", true);
				$('#buyBtn').prop("disabled", false);
				$('#agreeMsg').hide();
			} else {
				$('.checkbox').prop("checked", false);
				$('#buyBtn').prop("disabled", true);
				$('#agreeMsg').show();
			}
		});
		$(window).scroll(
				function() {
					$("#yourDiv").css("margin-top",
							Math.max(-450, 0 - $(this).scrollTop()));
				});
		$('#agreeBtn1').click(function() {
			Shadowbox.open({
				content : '../fund/agreeBtn1.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 제공 동의 (필수)'
			})
		})

		$('#agreeBtn2').click(function() {
			Shadowbox.open({
				content : '../fund/agreeBtn2.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 수집 및 이용 동의 (필수)'
			})
		})

		$('#agreeBtn3').click(function() {
			Shadowbox.open({
				content : '../fund/agreeBtn3.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 국외 이전 동의 (필수)'
			})
		})
	})
	
	var IMP = window.IMP; // 생략 가능
		IMP.init("imp36806187"); // 예: imp00000000
		function requestPay() {
			console.log('clicked');
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({
				pg : 'html5_inicis', // version 1.1.0부터 지원.
				/*
				    'kakao':카카오페이,
				    'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
				    'nice':나이스,
				    'jtnet':jtnet,
				    'uplus':LG유플러스
				 */
				pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
				merchant_uid : 'merchant_' + new Date().getTime(),
				name: vm.member_data.name,
		        amount: vm.finalTotalAmount.replace(/,/g, ''), // 콤마 제거하고 문자열을 숫자로 변환합니다.
		        buyer_email: vm.member_data.email,
		        buyer_name: vm.member_data.name,
		        buyer_tel: vm.member_data.phone,
		        buyer_addr: vm.member_data.addr1,
		        buyer_postcode: vm.member_data.postcode, 
				app_scheme : 'iamporttest' //in app browser결제에서만 사용 
			}, function(rsp) {
				if (rsp.success) {
					alert("결제 완료")
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
				 	location.href = "../mypage/mypage_main.do";
					/* $.ajax({
						type:'get',
						url:'../fund/fund_count.do',
						data:{"rno":rno,"wfno":wfno,"gcount":gcount},
						success:function(result){
							console.log("카운트성공")
						}
					}) */
				}
			});
		}

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h3>
					<strong>결제</strong>
				</h3>
				<div style="height: 30px"></div>
				<h4>
					<strong>상품정보</strong>
				</h4>
				<hr>
				<input type="hidden" id="gcount" :value="gcount"> 
				<input type="hidden" id="tprice" :value="finalTotalAmount">
				<input type="hidden" id="rprice" :value="reward_data.rprice">
				<input type="hidden" id="delfee" :value="reward_data.delfee">
				<input type="hidden" id="delstart" :value="reward_data.delstart">
				<input type="hidden" id="rcont" :value="reward_data.rcont">
				<input type="hidden" id="usepoint" :value="member_data.point">
				<input type="hidden" id="usepointCheck" :value="usePoints">
				
				<table class="table">
					 
					<tr>
						<td rowspan="3" width="20%"><img :src="fund_data.mainimg" class="reserveImg"></td>
						<td width="80%" style="font-size: 17px; font-weight: bold;">{{reward_data.rname }}</td>
					</tr>
					<tr>
						<td style="color: gray">{{fund_data.fsubtitle }}</td>
					</tr>
					<tr>
						<td style="color: gray"></td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">상품 가격</td>
						<td width="80%" class="text-right">{{ rpriceAmount.toLocaleString() }}원</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">개수</td>
						<td width="80%" class="text-right">${gcount }개</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">배송비</td>
						<td width="80%" class="text-right">{{ delfeeAmount.toLocaleString() }}원</td>
					</tr>
					 <tr>
			            <td width="20%">포인트 사용</td>
			            <td width="50%" class="text-right">
			                <input type="checkbox" id="usePoints" v-model="usePoints">모두 사용 (보유 포인트 {{ member_data.point }}P)
			            </td>
			        </tr>
				</table>
				<div style="height: 20px"></div>
				<h4>
					<strong>구매자 정보</strong>
				</h4>
				<hr>
				<table class="table">
					<tr>
						<td width="20%">이름</td>
						<td width="80%" id="name" class="text-right">{{member_data.name }}</td>
					</tr>
					<tr>
						<td width="20%">이메일</td>
						<td width="80%" id="email" class="text-right">{{member_data.email }}</td>
					</tr>
					<tr>
						<td width="20%">전화번호</td>
						<td width="80%" id="phone" class="text-right">{{member_data.phone }}</td>
					</tr>
					<tr>
						<td width="20%">주소</td>
						<td width="80%" id="addr1" class="text-right">{{member_data.addr1 }}</td>
					</tr>
				</table>
				<div style="height: 20px"></div>
				<h4>
					<strong>결제 방법</strong>
				</h4>
				<hr>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
				  	<label class="form-check-label" for="flexRadioDefault1">
				    신용/체크카드
				  	</label>
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    카카오페이
				 	</label>
				 	<img src="../images/kakao.png" class="payImg">
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    토스페이
				 	</label>
				 	<img src="../images/toss.png" class="payImg">
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    네이버페이
				 	</label>
				 	<img src="../images/naver.png" class="payImg">
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    페이코
				 	</label>
				 	<img src="../images/payco.png" class="payImg">
				</div>
				<div style="height: 100px"></div>
			</div>
			<div class="col-sm-4" style="color: black" id="yourDiv">
				<div class="buyBox">
					<div class="buyBoxContent">
						<table class="table buyBoxAll">
							<tr>
								<td colspan="2">
									<div style="height: 15px;"></div>
									<h4>
										<strong>결제 정보</strong>
									</h4>
									<hr>
								</td>
							</tr>
							<tr style="vertical-align: middle; font-size: 10pt;">
								<td>주문 금액</td>
								<td>{{ (gcount * rpriceAmount + delfeeAmount).toLocaleString() }}원</td>
							</tr>
							<tr style="vertical-align: middle; font-size: 10pt;">
								<td>포인트</td>
								<td>{{ usePoints ? member_data.point : '0' }}원</td>
							</tr>
							<tr height="60px;"
								style="vertical-align: middle; background-color: rgb(246, 251, 255);">
								<td style="color: #a6d8ce;"><strong>총 결제
										금액</strong></td>
								<td style="font-size: 20pt; color: #a6d8ce;"><b>
									<div>{{ finalTotalAmount.toLocaleString() }}원</div>
								</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="height: 20px;"></div>
									<h4>
										<strong>약관 안내</strong>
									</h4>
									<hr>
								</td>
							</tr>
							<tr>
								<td colspan="2"><input class="checkbox" style="zoom: 2.0;"
									type="checkbox" id="checkall"> <label
									style="position: relative; bottom: 6px;">전체 약관 동의</label>
									<table class="table buyBoxAll" style="font-size: 12pt;">
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check1"> <label
												style="position: relative; bottom: 6px;">개인정보 제공 동의
													(필수) </label>
												<button id="agreeBtn1">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check2"> <label
												style="position: relative; bottom: 6px;">개인정보 수집 및
													이용 동의 (필수) </label>
											<button id="agreeBtn2">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check3"> <label
												style="position: relative; bottom: 6px;">개인정보 국외 이전
													동의 (필수) </label>
											<button id="agreeBtn3">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr id="agreeMsg">
											<td style="color: orange; font-size: 10pt;">약관에 동의해주세요.</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td colspan="2" class="center wishTd">
									<div class="d-grid">
										<input type="hidden" id="total_price" :data-total="finalTotalAmount"> 
										<input type="hidden" id="rno" :data-rno="reward_data.rno"> 
										<input type="hidden" id="wfno" :data-wfno="fund_data.wfno">
										<input type="hidden" id="rname" :data-rname="reward_data.rname">
										<input type="hidden" id="post" :value="member_data.post"> 
										<input type="hidden" id="addr1" :value="member_data.addr1">
										<c:if test="${sessionScope.id!=null }">
											<button class="btn btn-block btn-wish" style="height: 50px; background-color: #a6d8ce; color: white;" disabled="disabled" id="buyBtn">
												<h5>
													<strong> {{ finalTotalAmount.toLocaleString() }}원
														결제하기
													</strong>
												</h5>
											</button>
										</c:if>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	var vm = new Vue({
		el: '.container',
		data: {
			rno:${rno},
			wfno:${wfno},
			gcount:${gcount},
			id:'${id}',
			reward_data: {},
		    fund_data: {},
		    member_data: {},
		    usePoints: false
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				axios.get("../fund/fund_buy_fundData_vue.do", {
					params:{
						wfno:this.wfno
					}
				}).then(res=>{
					console.log(res.data)
					this.fund_data = res.data
				}).catch(err=>{
					console.log(err.response)
				})
				axios.get("../fund/fund_buy_rewardData_vue.do", {
					params:{
						rno:this.rno
					}
				}).then(res=>{
					console.log(res.data)
					this.reward_data = res.data
				}).catch(err=>{
					console.log(err.response)
				})
				axios.get("../fund/fund_buy_memberData_vue.do", {
					params:{
						id:this.id
					}
				}).then(res=>{
					console.log(res.data)
					this.member_data = res.data
				}).catch(err=>{
					console.log(err.response)
				})
			}
		},
		computed: {
		    rpriceAmount:function(){
		        return this.reward_data.rprice ? parseInt(this.reward_data.rprice, 10) : 0;
		    },
		    pointAmunt:function(){
		        return this.member_data.point ? parseInt(this.member_data.point, 10) : 0;
		    },
		    delfeeAmount:function(){
		        return this.reward_data.delfee ? parseInt(this.reward_data.delfee, 10) : 0;
		    },
		    plusAmount:function(){
		        if (this.reward_data.rprice && this.gcount) {
		            const rprice = parseInt(this.reward_data.rprice, 10);
		            return rprice * this.gcount;
		        }
		        return 0;
		    },
		    finalTotalAmount: function() {
		    	  if (this.reward_data.rprice && this.gcount && this.member_data.point) {
		    	      const rprice = parseInt(this.reward_data.rprice, 10);
		    	      const delfee = parseInt(this.reward_data.delfee, 10);
		    	      let totalAmount = rprice * this.gcount + delfee;

		    	      if (this.usePoints) {
		    	        totalAmount -= parseInt(this.member_data.point, 10);
		    	      }

		    	      return totalAmount.toLocaleString();
		    	    }
		    	    return '0';
		    	}
		}
	});
	
	$('#buyBtn').click(function(){
	    $.ajax({
	        type:'get',
	        url:'../fund/fund_buy_ok.do',
	        data:{
	        	"rno":vm.reward_data.rno,
	            "wfno":vm.fund_data.wfno,
	            "rname":vm.reward_data.rname,
	            "name":vm.member_data.name,
	            "gcount":vm.gcount,
	            "tprice": vm.finalTotalAmount.replace(/,/g, ''), // 콤마를 제거하고 문자열을 숫자로 변환합니다.
	            "rprice": vm.rpriceAmount,
	            "rcont" : vm.reward_data.rcont, 
		       	"delfee" : vm.delfeeAmount, 
		       	"delstart" : vm.reward_data.delstart,
				"usePoints" : vm.usePoints
	        },
	        success:function(result){
	           requestPay()
	            
	        }
	    })
	}) 
</script>
</body>
</html>