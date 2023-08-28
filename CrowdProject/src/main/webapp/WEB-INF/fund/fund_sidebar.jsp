<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   td.inline { 
      width: 250px; /* 원하는 크기로 설정하세요 */
      height: 80px; /* 원하는 크기로 설정하세요 */
   }
   .button{
    margin-right: 10px; /* 이 값을 줄여서 간격을 조정할 수 있습니다 */
}
   .thumbnail.no-hover:hover {
       background-color: none;
   }
   .bordered-row {
    border: 1px solid #000; /* 원하는 스타일과 색상으로 설정하세요 */
    border-radius: 10px; /* 원하는 값을 설정하세요 */
    padding: 15px; /* 내부 간격 설정 */
}

.bordered-row > * {
    margin-bottom: 10px; /* 요소들 사이의 아래쪽 간격 설정 */
}

.bordered-row > *:last-child {
    margin-bottom: 0; /* 마지막 요소의 아래쪽 간격 제거 */
}
/* 모달 스타일 설정 */
   /* 모달 스타일 설정 */
   .modal {
       display: none;
       position: fixed;
       z-index: 1;
       left: 0;
       top: 0;
       width: 100%;
       height: 100%;
       overflow: auto;
       background-color: rgba(0,0,0,0.4);
   }

   .modal-content {
       background-color: #fefefe;
       margin-top: 15%;
       margin-left:auto;
       margin-right:auto;
       padding-bottom :20px ;
       border-radius :10px ;
       width :50% ;
     }

     .close {
         color:black ;
         float:right ;
         font-size :28 px ;
         font-weight:bold ;
         cursor:pointer ;
     }

     .close:hover,
      .close:focus{
      color:red ; 
      text-decoration:none ; 
      cursor:pointer ; 
      }
  
     textarea{
        width :80% ; 
        height :150 px ; 
        margin-left:auto; 
        margin-right:auto;  
        display:block;  
     }
     
.modal-content form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.modal-content textarea {
    margin-top: 20px; /* textarea 위쪽에 여백 추가 */
    margin-bottom: 20px;
   padding: 10px; /* 텍스트와 테두리 사이에 패딩 추가 */
   height :100 px ; 
   border-radius :5 px ; 
   width :90% ;
}

.button-container{
   display:flex ;
   width :100% ;
}

.support-button, .close {
   flex-grow :1 ; 
   margin-top: 10px;
   padding: 10px; 
   border-radius :5 px ; 
   background-color :#f2f2f2 ; 
   border:none ;
   cursor:pointer ;
   color:black ;  
   text-align:center ;
}

.support-button:hover, .close:hover{
   background-color :#ddd ;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
   <div id="fReward">
      <span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px; color: black; font-size: 14px;">
       <strong><span>#</span>{{fund_detail.tag}}</strong>
       </span>
      <hr>
      <div class="row">
         <p>
            <strong>{{fund_detail.ftitle}}</strong>
         </p>
         <hr>
         <p style="font-size: 13px">{{fund_detail.fsubtitle}}</p>
         <hr>
         <p style="color: #a6d8ce;">
            <span style="font-size: 25px"><strong>{{fund_detail.cum_amount | numberWithCommas}}</strong></span>원 달성
         </p>
         <p style="font-size: 17px">
            <strong>{{fund_detail.achieve_rate}}% 달성</strong>&nbsp;&nbsp;&nbsp;
            <span style="background-color: #f2f2f2; padding: 2px 5px; border-radius: 4px;
                color: black; font-size: 14px;">{{fund_detail.parti_count}}명 참여
            </span>
         </p>
      </div>
   
      <hr>
   
      <!-- <button class="bordered-button">
         <img width="30" height="30" src="../images/hands-clapping.svg">
      </button>
      
      <button class="bordered-button">
       <img width="30" height="30" src="../images/heart.svg" @click="fundJjim">
      </button> -->
      <table>
         <tr> 
            <td>
                <button class="rounded" style="border: none; font-size: 12px" onclick="openModal()">
                    <img width="40" height="30" alt="Clapping Hands" src="../images/hands-clapping.svg">
                    <br>
                    {{fund_detail.support}}   
                </button>
            </td>
             
            <td>
                       <button class="rounded" style="border: none; font-size:12px" >
                          <img width="40" height="30" alt="Clapping Hands"
                             src="../images/heart.svg" @click="fundJjim">
                          <br>
                             {{fund_detail.jjim}}   
                       </button>
             </td>
             
                <td>
                       <a href="#3">
                       <button class="rounded" style="border: none; width: 250px; height: 50px;">
                               리워드 선택  
                       </button>
                       </a>
                </td>
         </tr>
      </table>

      <br>
      <br>
      <div class="row bordered-row" style="width: 100%;">
         <div class="row">
         <br>
            <div class="col-lg-3">
               <div class="circle-image">
                  <img :src="fund_detail.makerphoto" alt="">
               </div>
            </div>
            <div class="col-lg-8">
               <div>{{fund_detail.makername}}</div>
               <br>
            </div>
         </div>
         <hr>
         <!-- <div class="table">
                      <th>이메일</th>
                      <td>{{fund_detail.makeremail}}</td>
                      <th>문의전화</th>
                      <td>{{fund_detail.makertel}}</td>
                      <th>홈페이지</th>
                      <td>{{fund_detail.makerehomepage}}</td>
                      <th>SNS</th>
                      <td></td>
                   </div> -->
         <table>
            <tr>
               <th style="text-align: center;">이메일</th>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
               <td style="text-align: left;">{{fund_detail.makeremail}}</td>
            </tr>
            <tr>
               <th style="text-align: center;">문의전화</th>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
               <td style="text-align: left;">{{fund_detail.makertel}}</td>
            </tr>
            <tr>
               <th style="text-align: center;">홈페이지</th>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
               <td v-if='!fund_detail.makerhomepage' style='text-align:left;'>http://wadiz.com</td>
               <td v-else style='text-align:left;'>{{fund_detail.makerhomepage}}</td>
            </tr>
            <tr>
             <th style="text-align: center;">SNS</th>
             <td>&nbsp;</td>
               <td>&nbsp;</td>
             <td>
                 <i class="fab fa-instagram" style="font-size: 25px;"></i>
                 <i class="fab fa-facebook" style="font-size: 25px;"></i>
                 <i class="fab fa-twitter" style="font-size: 25px;"></i>
             </td>
         </tr>
               
         </table>
         <hr>
         
         <div class="row" style="height: 10%">
           <div class="col-4" style="height: 10%"></div>
           <div class="col-4">
               <div class="thumbnail bordered-thumbnail inquiry-button"
                    style="width :100px ; height :80% ; text-align:center ; font-size :13 px ; display:flex ; align-items:center ; justify-content:center;" id="3">
                    <a href="#">문의하기</a>
               </div>
             
           </div>
           <div class="col-4" style="height: 10%"></div>
      </div>
      </div>
      <br>
      <h5>리워드 선택</h5>
      <br>
      <div class="row" style="max-height: 400px; overflow-y: auto;">
         <div v-for="vo in fund_reward" class="thumbnail bordered-thumbnail" style="width: 95%;">
               <div class="caption">
                  <p style="font-size: 16px; margin-bottom: 1px;">
                     <strong>{{ vo.rprice }}원<br></strong>
                  </p>
                  <p style="font-size: 14px; margin-bottom: 1px;">{{ vo.rname }}</p>
                  <hr>
                  <p style="font-size: 14px; margin-bottom: 1px;">
                     리워드 구성 : <br><br>{{ vo.rcont }}
                  </p>
                  <hr>
                  <p v-if="vo.delfee == 0" style="font-size: 14px; margin-bottom: 1px;">배송비 : 무료</p>
                    <p v-else style="font-size: 14px; margin-bottom: 1px;">배송비 : {{ vo.delfee }}원</p>
                  
                  <hr>
                  <p style="font-size: 14px; margin-bottom: 1px;">배송시작일 : {{vo.delstart }}</p>
                  <hr>
                  <span style="font-size: 14px; margin-bottom: 1px;">{{ vo.curq}}개 남음</span><br>
                  <hr>
                  <span> 수량 선택 : &nbsp;&nbsp;
                     <select ref="gcount" v-model="gcount">
                        <option selected>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>         
                     </select>
                  </span>
                  <!-- <a :href="'../fund/fund_buy.do?rno=' + vo.rno + '&wfno=' + fund_detail.wfno + '&gcount=' + gcount"> --> 
                   
                     <div class="button-container">
                        <c:if test="${sessionScope.id!=null }">
                         <button class="bordered-button" id="buyBtn" @click="buyReward(vo.rno)" >구매하기</button>
                        </c:if>
                         <c:if test="${sessionScope.id==null }">
                         <a href="../member/member_login.do">
                         <button class="bordered-button">구매하기</button>
                        </a>
                         </c:if> 
                     </div>
                   
                  
                  <!-- </a>  -->
                     <!--  <a :href="'../fund/fund_buy.do?wfno='+wfno" class="button">구매하기</a>-->
                     <!-- <button class="bordered-button" id="buyBtn">수량 선택</button> -->   
               </div>
            
         </div>
      </div>
      <div id="myModal" class="modal">
    <!-- 모달 내용 -->
    <div class="modal-content">
    <br>
    <h4 style="text-align:center">친구에게 소개해 보세요</h4>
    <h6 style="text-align:center">지지서명으로 메이커에게 힘이 되어주세요!</h6>
        <!-- 글 내용 입력 폼 -->
         <form @submit.prevent="submitForm">
          <textarea v-model="message"></textarea>
          <!-- 저장 버튼 등 필요한 요소들 추가 -->
          <div class="button-container">
              <button type="submit" class="support-button">지지하기</button>
              <button type="button" class="close">취소하기</button>
          </div>
        </form>
    </div>
</div>
            
   </div>
    <script>
   var sessionId = '${sessionScope.id}';
   
      // 모달 창 열기
    function openModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "block";
    }

    // 모달 창 닫기
    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }

     window.onload = function() {
       // 닫기 버튼 클릭 시 모달 창 닫기
        var closeBtn = document.querySelector("#myModal .close");
        closeBtn.onclick = closeModal;

        // 배경 클릭 시 모달 창 닫기
        window.onclick = function(event) {
          var modal = document.getElementById("myModal");
          if (event.target == modal) {
               closeModal();
          }
        };
     };
   
    new Vue({
       el:'#fReward',
       data:{
          wfno:${wfno},
          fund_reward:[],
          fund_detail:{},
          no:0,
          gcount:1,
          rno:1,
          JjimStatus:'0',
          id: sessionId,
          message: ''
       },
       mounted:function(){
          axios.get('../fund/fund_detail_vue.do',{
             params:{
                wfno:this.wfno
             }
          }).then(response=>{
             console.log(response.data)
             this.fund_detail=response.data
          }).catch(error=>{
             console.log(error.response)
          })
          
          axios.get('../fund/fund_reward_vue.do',{
             params:{
                wfno:this.wfno
             }
          }).then(response=>{
             console.log(response.data)
             this.fund_reward=response.data
          }).catch(error=>{
             console.log(error.response)
          })
       },
        methods: {
              buyReward: function(rno) {
                  // 버튼 클릭 시 수행되는 함수
                  let _this=this;
                  const gcount = this.$refs.gcount.value; // 선택된 수량 가져오기
                  const url = "fund_buy.do?rno="+rno+"&wfno="+_this.wfno+"&gcount="+this.gcount;
                 
                  window.location.href = url; // 페이지 이동
              },
              fundJjim(){
                 if(this.id == null || this.id == undefined || this.id == '' || this.id == 0){
                    alert("로그인을 진행해주세요");
                    return;
                 } else {
                    axios.get('../fund/fund_jjim_vue.do',{
                       params:{
                          wfno:this.wfno,
                          id:this.id
                       }
                    }).then(response=>{
                       console.log(response.data)
                       this.JjimStatus=response.data
                       if(this.JjimStatus == '0'){
                          alert("찜하기 완료")
                       } else {
                          alert("찜하기 취소")
                       }
                       location.reload();
                    }).catch(error=>{
                       console.log(error)
                    })
                    
                 }

              }, 
              submitForm:function() {
                  axios.post('../fund/fund_jiji_vue.do',null,{ 
                     params:{
                        message: this.message,
                        wfno:this.wfno,
                        id:this.id
                     }
                  }).then(response => {
                      console.log(response);
                      alert("지지하기 완료");
                      const returnUrl = '../fund/fund_detail.do?wfno=' + this.wfno;
                      // 페이지 이동
                      window.location.href = returnUrl;
                      
                      
                   }).catch(error => {
                      console.error(error);
                      // 에러 발생 시 처리
                    })
                }
              
          },filters: {
		        numberWithCommas: function (value) {
		            // 숫자에 쉼표 추가 함수 정의
		            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        }
		  }
    })   
   </script>
</body>
</html>