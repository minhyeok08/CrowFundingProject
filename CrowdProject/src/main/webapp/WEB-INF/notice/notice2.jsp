<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
	color: #3498db;
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
</style>
</head>
<body>
	<div class="container">
		<div class="row1">
			<h1 class="text-center">공지사항</h1>
			<div style="text-align: center;">
				<ul style="list-style: none; display: inline-block; padding: 0;">
					<li :class="{ noticeli: true, selected: category === 'all' }"
						@click="selectCategory('전체')" @mouseover="hoverEffect"
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
					<b-button variant="secondary" @click="isShow=false">닫기</b-button>
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
					+'<thead>'
					+'<tr class="danger">'
					+'<th width="10%" class="text-center">번호</th>'
					+'<th width="45%" class="text-center">제목</th>'
					+'<th width="15%" class="text-center">이름</th>'
					+'<th width="10%" class="text-center">작성일</th>'
					+'<th width="10%" class="text-center">조회수</th>'
					+'<th width="10%" class="text-center"></th>'
					+'</tr>'
					+'</thead>'
					+'<tbody>'
					+'<tr v-for="vo in detaildata">'
					+'<td width="10%" class="text-center">{{vo.wnno }}</td>'
					+'<td width="45%" class="text-center">{{vo.subject }}</td>'
					+'<td width="15%" class="text-center">{{vo.writer }}</td>'
					+'<td width="10%" class="text-center">{{vo.dbday }}</td>'
					+'<td width="10%" class="text-center">{{vo.hit }}</td>'
					+'<td width="10%" class="text-center">'
					+'<b-button id="show-btn" variant="outline-success" @click="noticeDetail(vo.wnno,true)">Detail</b-button>'
					+'</td>'
					+'</tr>'
					+'</tbody>'
					+'</table>'
			,
			methods:{
				noticeDetail:function(value,bool){
					eventBus.$emit('noticeDetailEvent',value,bool)
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
		// 컴포넌트에서 지정한 event.$emit()을 받는 함수 eventBus.$on
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
            this.noticeListData(selectedCategory, '1');
        },
        hoverEffect: function (event) {
            event.target.style.backgroundColor = '#f0f0f0'; // 마우스 오버 효과
        },
        unhoverEffect: function (event) {
            event.target.style.backgroundColor = ''; // 원래 상태로 복원
        },
        detailShow:function(){
        	this.$refs['my-modal'].show();
        }
    }
})
</script>
</body>
</html>