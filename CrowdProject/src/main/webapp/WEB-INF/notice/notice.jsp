<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script
	src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
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
			<table class="table" id="user-table">
				<tbody>
					<tr v-for="vo in notice_list">
						<td width="55%" class="text-center">{{vo.subject }}</td>
						<td width="15%" class="text-center">{{vo.writer }}</td>
						<td width="20%" class="text-center">{{vo.dbday }}</td>
						<td width="10%" class="text-center">{{vo.hit }}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<script>
new Vue({
	el:'.container',
	data:{
		category:'event',
		page:1,
		notice_list:[]
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
        }
    }
})
</script>
</body>
</html>