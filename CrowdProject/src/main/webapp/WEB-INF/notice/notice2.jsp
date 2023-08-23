<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1 {
	margin: 0px auto;
	width: 900px;
}

.noticeli {
	float: left;
	margin-right: 20px;
	list-style: none;
	cursor: pointer;
}

.selected {
	color: #00b2b2;
	border-radius: 6px;
	background-color: #f0f0f0;
	transition: background-color 0.3s ease-in-out, border-radius 0.3s
		ease-in-out;
}

.selected:hover {
	background-color: #3498db;
	border-radius: 6px; /* 둥글게 깎아줌 */
}

input[type="text"] {
	width: 200px;
}
.highlighted {
    color: #ffffff;
    background-color: green; /* 원하는 배경색 */
}
.btn-custom {
    background-color: transparent; 
    border-color: #00b2b2; 
    color: #00b2b2; 
    transition: background-color 0.3s;
   	font-size: 18px;
}
.btn-custom:hover {
    background-color: rgb(234, 248, 249); 
    border-color: #00b2b2; 
    color: #00b2b2;
}
.boardul{
	margin: 0;
    padding: 0;
    list-style: none;
}
.boardTitle{
	font-size: 20px;
	font-weight: bold;
}
.boardWriter{
	color: #868e96;
	font-size: 13px;
}
.boardWriterSpan{
	margin-right: 20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})
</script>
</head>
<body>
<div style="height: 50px"></div>
	<div class="container">
		<div class="row1">
			<h1 class="text-center">공지사항</h1>
			<div style="height: 20px"></div>
			<div style="text-align: center;">
				<ul style="list-style: none; display: inline-block; padding: 0;">
					<li :class="{ noticeli: true, selected: category === 'all' }"
						@click="selectCategory('all')" @mouseover="hoverEffect"
						@mouseout="unhoverEffect">전체</li>
					<li :class="{ noticeli: true, selected: category === 'event' }"
						@click="selectCategory('event')" @mouseover="hoverEffect"
						@mouseout="unhoverEffect">이벤트</li>
					<li :class="{ noticeli: true, selected: category === 'notice' }"
						@click="selectCategory('notice')" @mouseover="hoverEffect"
						@mouseout="unhoverEffect">공지사항</li>
					<li :class="{ noticeli: true, selected: category === 'news' }"
						@click="selectCategory('news')" @mouseover="hoverEffect"
						@mouseout="unhoverEffect">보도자료</li>
				</ul>
			</div>
			<div style="height: 20px;"></div>
			<div class="row">
				<input type="text" ref="fd" class="input-sm" placeholder="검색어 입력"
					id="keyword" v-on:keyup="selectMusic()">
			</div>
			<div style="height: 30px"></div>
			
			<div class="row">
				<ul class="boardul">
					<li>
						<span style="color: #00b2b2; font-size: 12px;">이벤트&nbsp;</span>·<span style="color: blue; font-size: 12px;">&nbsp;중요</span>
						<div class="boardTitle">게시판 글의 제목이 들어가는 자리</div>
						<div class="boardWriter">
							<span class="boardWriterSpan">Wadiz</span><span>2023.08.01</span>
						</div>
						<hr>
					</li>
					<li>
						<span style="color: #00b2b2; font-size: 12px;">이벤트&nbsp;</span>·<span style="color: blue; font-size: 12px;">&nbsp;중요</span>
						<div class="boardTitle">게시판 글의 제목이 들어가는 자리</div>
						<div class="boardWriter">
							<span class="boardWriterSpan">Wadiz</span><span>2023.08.01</span>
						</div>
						<hr>
					</li>
				</ul>
			</div>
			
			<notice v-bind:detaildata="notice_list"></notice>
			<b-modal ref="my-modal" hide-footer hide-header v-if="isShow" id="modal-lg"
				size="lg">
			<div class="text-center">
				<div class="text-center">
					<table class="table">
						<tr>
							<th>작성자</th>
							<td>{{ notice_detail ? notice_detail.writer : '' }}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>{{ notice_detail ? notice_detail.subject : '' }}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><pre style="white-space: pre-wrap;">{{ notice_detail ? notice_detail.content : '' }}</pre></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>{{ notice_detail ? notice_detail.dbday : '' }}</td>
						</tr>
					</table>
					<b-button class="btn-custom" @click="isShow=false">닫기</b-button>
				</div>
			</div>
			</b-modal>
		</div>
	</div>

	<script>
	/* component => Vue통신 */
	let eventBus=new Vue();
	Vue.component('notice',{
		props:['detaildata'],	// <notice>의 속성값을 detaildata로 받는다는 의미
		template:'<table class="table" id="user-table">'
					+'<tbody>'
					+'<tr v-for="vo in detaildata" @click="noticeDetail(vo.wnno,true)">'
					+'<td width="65%" class="text-center" @mouseover="hoverEffectComponent($event)" @mouseout="unhoverEffectComponent($event)">{{vo.subject }}</td>'
					+'<td width="15%" class="text-center">{{vo.writer }}</td>'
					+'<td width="10%" class="text-center">{{vo.dbday }}</td>'
					+'<td width="10%" class="text-center">{{vo.hit }}</td>'
					+'</tr>'
					+'</tbody>'
					+'</table>'
			,
			methods:{
				noticeDetail:function(value,bool){
					eventBus.$emit('noticeDetailEvent',value,bool)
				},
				hoverEffectComponent: function(event) {
					 event.target.style.backgroundColor = '#f0f0f0';
		        },
		        unhoverEffectComponent: function(event) {
		        	 event.target.style.backgroundColor = '';
		        }
			}
	})
	
new Vue({
	el:'.container',
	data:{
		category:'event',
		page:1,
		isShow:false,
		notice_list:[],
		notice_detail:{}
	},
	mounted:function(){
		this.noticeListData('event','1');
		$('#keyword').keyup(function(){
			let k=$(this).val();
			$('#user-table > tbody > tr').hide();
			let temp=$('#user-table > tbody > tr > td:nth-child(4n+2):contains("'+k+'")')
			$(temp).parent().show();
		})
	},
	updated:function(){
		let _this=this
		// 컴포넌트에서 지정한 event.$emit()을 받는 함수 eventBus.$on (게시물번호, true)
		eventBus.$on('noticeDetailEvent',function(value,bool){
			_this.isShow=true;
			axios.get('http://localhost/web/notice/detail_vue.do',{
				params:{
					wnno:value
				}
			}).then(response=>{
				console.log(response.data)
				_this.notice_detail=response.data
				_this.detailShow();
			})
		})
	},
	methods: {
        noticeListData: function (category, page) {
            axios.get('http://localhost/web/notice/notice_vue.do', {
                params: {
                    category: category,
                    page: '1'
                }
            }).then(response => {
                console.log(response.data)
                this.notice_list = response.data
            }).catch(error => {
                console.log(error.response)
            })
        },
        selectCategory: function (selectedCategory) {
            this.category = selectedCategory;
            this.noticeListData(selectedCategory, '1');	// 카테고리 이름 , 페이지
        },
        hoverEffect: function (event) {
            event.target.style.backgroundColor = '#f0f0f0'; // 마우스 오버 효과
        },
        unhoverEffect: function (event) {
            event.target.style.backgroundColor = ''; // 원래 상태로 복원
        },
        detailShow:function(){
        	this.$refs['my-modal'].show();			// 모달효과 
        }
    }
})
</script>
</body>
</html>