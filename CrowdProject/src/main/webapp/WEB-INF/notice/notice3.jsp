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
</style>
</head>
<body>
<div style="height: 50px"></div>
	<div class="container">
		<div class="row1">
			<h1 class="text-center"><b>공지사항</b></h1>
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
			<hr>
			<div class="row">
				<input type="text" ref="fd" class="input-sm" placeholder="검색어 입력"
					id="keyword" v-on:keyup="selectMusic()">
			</div>
			<div style="height: 30px"></div>
			
			<div class="row">
				
					<notice v-bind:detaildata="notice_list"></notice>
				</ul>
			</div>
			
			<b-modal ref="my-modal" hide-footer hide-header v-if="isShow" id="modal-lg"
				size="lg">
			<div class="text-center">
				<div class="text-center">
					<table class="table">
						<tr>
							<th width="15%">작성자</th>
							<td>{{ notice_detail ? notice_detail.writer : '' }}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>{{ notice_detail ? notice_detail.subject : '' }}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><pre style="white-space: pre-wrap; text-align: left">{{ notice_detail ? notice_detail.content : '' }}</pre></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td class="text-left">{{ notice_detail ? notice_detail.dbday : '' }}</td>
						</tr>
					</table>
					<b-button class="btn-custom" @click="isShow=false">닫기</b-button>
				</div>
			</div>
			</b-modal>
			<div class="pagination-container">
				<nav aria-label="Page navigation">
				    <ul class="pagination justify-content-center">
				        <li class="page-item" v-if="startPage>1">
				        	<a class="page-link" href="#" aria-label="Previous" @click="prev()">
				        		<span aria-hidden="true">&laquo;</span>
				        	</a>
				        </li>
				        <li class="page-item" v-for="i in range(startPage, endPage)">
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
	</div>

	<script>
	/* component => Vue통신 */
	let eventBus=new Vue();
	Vue.component('notice',{
		props:['detaildata'],	// <notice>의 속성값을 detaildata로 받는다는 의미
		template:'<ul class="boardul" id="searchUl">'
				+'<li v-for="vo in detaildata" @click="noticeDetail(vo.wnno,true)">'
				+'<span style="color: #00b2b2; font-size: 12px;">{{vo.category}}&nbsp;</span><span v-if="vo.state===\'yes\'">·</span><span v-if="vo.state===\'yes\'" style="color: blue; font-size: 12px;">&nbsp;중요</span>'
				+'<div class="boardTitle" @mouseover="hoverEffectComponent($event)" @mouseout="unhoverEffectComponent($event)">{{vo.subject}}</div>'
				+'<div class="boardWriter">'
				+'<span class="boardWriterSpan">{{vo.writer}}</span><span>{{vo.dbday}}</span>'
				+'</div>'
				+'<hr>'
				+'</li>'
				+'</ul>'
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
		category:'all',
		isShow:false,
		notice_list:[],
		notice_detail:{},
		page_list:{},
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0,
	},
	mounted:function(){
		this.noticeListData('all',1);
		$('#keyword').keyup(function(){
			let k=$(this).val();
			$('#searchUl > li').hide();
			let temp=$('#searchUl > li > .boardTitle:contains("'+k+'")')
			$(temp).parent().show();
		})
	},
	updated:function(){
		let _this=this
		// 컴포넌트에서 지정한 event.$emit()을 받는 함수 eventBus.$on (게시물번호, true)
		eventBus.$on('noticeDetailEvent',function(value,bool){
			_this.isShow=true;
			axios.get('../notice/detail_vue.do',{
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
            axios.get('../notice/notice_vue.do', {
                params: {
                    category: category,
                    page: this.curpage
                }
            }).then(response => {
                console.log(response.data)
                this.notice_list = response.data
            }).catch(error => {
                console.log(error.response)
            })
            
            axios.get('../notice/notice_page_vue.do',{
				params:{
					page:this.curpage
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
			this.noticeListData();
		},
		prev:function(){
			this.curpage=this.startPage-1;
			this.noticeListData();
		},
		next:function(){
			this.curpage=this.endPage+1;
			this.noticeListData();
		}
    }
})
</script>
</body>
</html>