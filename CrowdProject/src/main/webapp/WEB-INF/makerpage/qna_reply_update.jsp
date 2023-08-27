<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.makerpagemainrow{
	border: 2px solid #a6d8ce;
	height: 900px;
	overflow-y: auto;
}
#qnatable{
	width: 700px;
	margin: 0px auto;
	border: 2px solid #a6d8ce;
}
.table{
	margin: 0px auto;
}
.table th,td{
	border: none;
}
</style>
</head>
<body>
<div class="makerpagemainrow">
	<div style="height: 50px;"></div>
	<h2 class="text-center">고객 문의 답변 수정</h2>
	<div id="qnatable">
		<table class="table">
			<tr>
				<td colspan="4" class="text-end">
					<button class="btn btn-sm btn-outline-danger" @click="del()">삭제</button>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">고객ID</th>
				<td width="30%">{{question_detail.id}}</td>
				<th width="20%" class="text-end">질문등록일</th>
				<td width="30%">{{question_detail.dbday}}</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">제목</th>
				<td colspan="3">{{question_detail.subject}}</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">내용</th>
				<td colspan="3">
					<pre style="white-space: pre-wrap; background-color: whtie;border: none">{{question_detail.content}}</pre>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th width="20%" class="text-end">답변제목</th>
				<td width="80%">
					<input type="text" v-model="answer_detail.subject" size=65>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">답변내용</th>
				<td width="80%">
					<textarea rows="4" cols="66" v-model="answer_detail.content"></textarea>
				</td>
			</tr>
			<tr>
		      <td colspan=2 class="text-center">
		        <button class="btn btn-sm btn-project" @click="update(answer_detail.qno)">답변수정</button>
		        <a href="javascript:history.back()" class="btn btn-sm btn-secondary" style="color: white">취소</a>
		      </td>
		    </tr>
		</table>
	</div>	
</div>
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			group_id:${group_id},
			question_detail: {},
			answer_detail: {},
			subject:'',
			content:''
		},
		mounted:function(){
			axios.get("../makerpage/question_detail_vue.do",{
        		params:{
        			group_id:this.group_id
        		}
        	}).then(response=>{
        	this.question_detail=response.data
        	})
        	axios.get("../makerpage/answer_detail_vue.do",{
        		params:{
        			group_id:this.group_id
        		}
        	}).then(response=>{
        	this.answer_detail=response.data
        	})	
		},
		methods:{
			update: function(no) {
			    if (this.answer_detail.subject === "") {
			        this.$refs.subject.focus();
			        return;
			    }
			    if (this.answer_detail.content === "") {
			        this.$refs.content.focus();
			        return;
			    }
			    
			    axios.post("../makerpage/reply_update_ok.do",null,{
			        params: {
			        	 qno: no,
		        	     subject: this.answer_detail.subject,
		        	     content: this.answer_detail.content
			        }
			    }).then(response => {
			        console.log(response.data);
			        
			        location.href = "../makerpage/qna_list.do";
			    });
			},
			del:function(){
				axios.get('../makerpage/qna_delete_all_vue.do',{
					params:{
						group_id:this.group_id
					}
				}).then(response=>{
					location.href="../makerpage/qna_list.do"
				})
			}
		}
	})
</script>	
</body>
</html>