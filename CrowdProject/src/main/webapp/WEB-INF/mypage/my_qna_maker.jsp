<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.qnaBody{
	width: 800px;
	margin: 0px auto;
}
.qnaTitle strong{
	font-size: 10pt;
}
.qnaContent span{
	font-size: 10pt;
}
.openDetailPage:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="wrap qnaBody">
		<div class="wrap mt-5 mb-4">
			<h3><strong>메이커 문의내용</strong></h3>
		</div>
		<div class="row mt-1" v-for="vo,index in qna_data" style="border: 0.7px solid #d3d3d3;border-radius: 10px;">
			<div class="wrap col-sm-11" style="padding: 10px;">
				<div class="row projectName">
					<strong style="color: #00c4c4;overflow: hidden; text-overflow: ellipsis;">{{vo.ftitle}}</strong>
				</div>
				<div class="row qnaTitle">
					<div class="col-sm-3">
						<strong>제목</strong>
					</div>
					<div class="col-sm-5">
						<strong>메이커명</strong>
					</div>
					<div class="col-sm-2">
					<strong>등록일</strong>
					</div>
					<div class="col-sm-2">
					<strong>답변상태</strong>
					</div>
				</div>
				<div class="row qnaContent">
					<div class="col-sm-3">
						<span>{{vo.subject}}</span>
					</div>
					<div class="col-sm-5">
						<span>{{vo.makername}}</span>
					</div>
					<div class="col-sm-2">
						<span>{{vo.dbday}}</span>
					</div>
					<div class="col-sm-2" v-if="vo.isreply == 0">
						<span>{{isReply='답변대기'}}</span>
					</div>
					<div class="col-sm-2" v-if="vo.isreply == 1">
						<span>{{isReply='답변완료'}}</span>
					</div>
				</div>
			</div>
				<div class="wrap col-sm-1" style="display: flex; align-items: center;border-left: 0.7px solid #d3d3d3;">
					<div class="wrap openDetailPage" style="margin-left: 0px;" @click="openDetailPage(vo.group_id)">
						<span style="font-size: 10.5pt">상세</span><br>
						<span style="font-size: 10.5pt">보기</span>
					</div>
				</div>
				<div class="wrap qnaDetailData" v-show="selectedGroupId === vo.group_id" style="border-top: 0.7px solid #d3d3d3;">
					<div class="row mt-1 mb-1" style="border-radius: 5px;border: 0.5px solid #d3d3d3;">
						<strong style="font-size: 10pt;">내용</strong>
						<label class="form-text">
						{{vo.content}}
						</label>
					</div>
					<div class="wrap mt-2 mb-2" v-if="reply_data != null" style="border-radius: 5px;border: 0.5px solid #d3d3d3;">
						<div class="row">
							<strong style="font-size: 10pt">[{{reply_data.makername}} 답변]</strong>
							<div class="row">
								<span style="font-size: 10pt">등록일 : {{reply_data.dbday}}</span>
							</div>
							<div class="row">
								<span style="font-size: 10pt">제목 : {{reply_data.subject}}</span>
							</div>
							<div class="row mt-2">
								<strong style="font-size: 10pt;margin-bottom: 10px;">답변 내용</strong>
								<span style="font-size: 10pt">{{reply_data.content}}</span>
							</div>
						</div>
				</div>
				</div>
		</div>
	</div>
<script>
var sessionId='${sessionScope.id}';
new Vue({
	el:'.qnaBody',
	data:{
		id:sessionId,
		qna_data:[],
		isReply:'',
		modalOpen:false,
		reply_data:[],
		selectedGroupId: null
	},
	mounted(){
		this.myQnaToMaker();
	},
	methods:{
		myQnaToMaker(){
			axios.get('../mypage/my_qna_maker_data.do',{
				params:{
					id:this.id
				}
			}).then(response=>{
				console.log(response.data)
				this.qna_data=response.data
			}).catch(error=>{
				console.log(error)
			})
		},
		openDetailPage(group_id){
			axios.get('../mypage/my_qna_maker_reply.do',{
				params:{
					group_id:group_id
				}
			}).then(response=>{
				console.log(response.data)
				this.reply_data=response.data
				// Toggle selectedGroupId value
        if (this.selectedGroupId === group_id) {
            this.selectedGroupId = null;  // Hide detail info if it's already showing
        } else {
            this.selectedGroupId = group_id;  // Show detail info for the clicked item
        }
			}).catch(error=>{
				console.log(error)
			})
		}
	}
})
</script>
</body>
</html>