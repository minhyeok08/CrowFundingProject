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
	margin: auto 0px;
}
#newstable{
	width: 1000px;
	height: 600px;
	border: 2px solid #a6d8ce;
	margin: 0px auto;
	overflow-y: auto; 
}
</style>

</head>
<body>
<div class="row makerpagemainrow">
	<div style="height: 50px;"></div>
	<h2 class="text-center">새소식 등록</h2>
	<div style="height: 30px;"></div>
	<div id="newstable">
		<form @submit.prevent="submitForm">
			<table class="table">
				<tr>
					<th width="20%" class="text-end">프로젝트명</th>
					<td width="30%">
						<select ref="wfno" v-model="wfno" >
							<option value=0>프로젝트를 골라주세요</option>
						    <option v-for="vo in project_list" :value="vo.wfno" >{{vo.ftitle}}</option>
						</select>
					</td>
					<th width="20%" class="text-end">공지종류</th>
					<td width="30%">
						<select ref="tno" v-model="tno">
							<option value="1">결제</option>
							<option value="2">교환/환불/AS</option>
							<option value="3">이벤트</option>
							<option value="4">리워드 안내</option>
							<option value="5">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">제목</th>
					<td colspan="3">
						<input type="text" ref="subject" v-model="subject" class="input-sm" size="95">
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">첨부파일</th>
					<td colspan="3">
						<input type=file ref="fundfiles" v-model="fundfiles" class="input-sm" multiple="multiple">
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-end">내용</th>
					<td colspan="3">
						<textarea rows="15" cols="96" ref="content" v-model="content"></textarea> 
					</td>
				</tr>
				<tr>
	    			<td colspan="4" class="text-center">
		    			<input type=submit value="등록" class="btn btn-sm btn-project">
		    			<input type=button value="취소" class="btn btn-sm btn-secondary"
		    			onclick="javascript:history.back()">
	    			</td>
	    		</tr>
			</table>
		</form>	
	</div>
</div>	
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			id:'${id}',
			project_list:[],
			tno:1,
			wfno:0,
			subject:'',
			content:'',
			fundfiles:''
		},
		mounted:function(){
			axios.get("../makerpage/project_list_for_news_vue.do",{
				params:{
					id:this.id
				}
			}).then(response=>{
				console.log(response.data)
				this.project_list=response.data
			})
		},
		methods:{
			submitForm:function(){
				if(this.wfno==0)
				{
					this.$refs.wfno.focus()
					return
				}
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
				
				let form=new FormData()
				form.append("wfno",this.wfno)
				form.append("tno",this.tno)
				form.append("subject",this.subject)
				form.append("content",this.content)
				form.append("id",this.id)
				let leng=this.$refs.fundfiles.files.length
				if(leng>0)
				{
					for(let i=0;i<this.$refs.fundfiles.files.length;i++)
					{
						form.append("fundfiles["+i+"]",this.$refs.fundfiles.files[i])
					}
				}
				axios.post('../makerpage/news_insert_vue.do',form,{
					headers:{
						'Context-Type':'multipart/form-data'
					}
				}).then(response=>{
					console.log(response.data)
					location.href="../makerpage/makerpage_news.do"
				}).catch(error=>{
					console.log(error.response);
				})
			}
		}
	})
</script>			
</body>
</html>