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
	<h2 class="text-center">고객 문의 답변</h2>
	<div id="qnatable">
		<table class="table">
			<tr>
				<td colspan="4" class="text-end">
					<button class="btn btn-sm btn-outline-danger" @click="del()">삭제</button>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">고객ID</th>
				<td width="30%">{{qna_detail.id}}</td>
				<th width="20%" class="text-end">질문등록일</th>
				<td width="30%">{{qna_detail.dbday}}</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">제목</th>
				<td colspan="3">{{qna_detail.subject}}</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">내용</th>
				<td colspan="3">
					<pre style="white-space: pre-wrap; background-color: whtie;border: none">{{qna_detail.content}}</pre>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th width="20%" class="text-end">답변제목</th>
				<td width="80%">
					<input type="text" ref="subject" v-model="subject" size=65>
					<input type="hidden" ref="wfno" v-model="qna_detail.wfno">
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">답변내용</th>
				<td width="80%">
					<textarea rows="4" cols="66" ref="content" v-model="content"></textarea>
				</td>
			</tr>
			<tr>
		      <td colspan=2 class="text-center">
		        <button class="btn btn-sm btn-project" @click="reply()">답변</button>
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
			id:'${id}',
			qno:${qno},
			qna_detail:{},
			subject:'',
			content:'',
			wfno:0
		},
		mounted:function(){
			axios.get("../makerpage/qna_detail_vue.do",{
				params:{
					qno:this.qno
				}
			}).then(response=>{
				this.qna_detail=response.data
			})
		},
		methods:{
			reply:function(){
				if(this.subject=="")
		    	{
		    		this.$refs.subject.focus()
		    		return
		    	}
		    	if(this.content=="")
		    	{
		    		this.$refs.content.focus()
		    		return
		    	}
				axios.post("../makerpage/reply_ok.do",null,{
					params:{
						id:this.id,
						qno:this.qno,
						subject:this.subject,
						content:this.content,
						wfno: this.qna_detail.wfno
					}
				}).then(response=>{
					console.log(response.data)
					this.subject=''
					this.content=''
					location.href="../makerpage/qna_list.do"
				})
			},
			del:function(){
				axios.get('../makerpage/qna_delete_vue.do',{
					params:{
						qno:this.qno
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