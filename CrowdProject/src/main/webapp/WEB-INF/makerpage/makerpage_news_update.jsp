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
					<td width="30%">{{news_detail.ftitle}}</td>
					<th width="20%" class="text-end">공지종류</th>
					<td width="30%">{{news_detail.tname}}</td>
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
			no:${no},
			news_detail:{},
			fundfiles:'',
			subject:'',
			content:''
		},
		mounted:function(){
			axios.get('http://localhost/web/makerpage/makerpage_news_detail_vue.do',{
				params:{
					no:this.no
				}
			}).then(response=>{
				console.log(response.data)
				this.news_detail=response.data
				this.subject=this.news_detail.subject
				this.content=this.news_detail.content
			}).catch(error=>{
				console.log(error.response)
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
				form.append("subject",this.subject)
				form.append("content",this.content)
				form.append("no",this.no)
				let leng=this.$refs.fundfiles.files.length
				if(leng>0)
				{
					for(let i=0;i<this.$refs.fundfiles.files.length;i++)
					{
						form.append("fundfiles["+i+"]",this.$refs.fundfiles.files[i])
					}
				}
				axios.post('../makerpage/news_update_vue.do',form,{
					headers:{
						'Context-Type':'multipart/form-data'
					}
				}).then(response=>{
					console.log(response.data)
					location.href="../makerpage/makerpage_news_detail.do?no="+this.no
				}).catch(error=>{
					console.log(error.response);
				})
			}
		}
	})
</script>			
</body>
</html>