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
	<h2 class="text-center">상세보기</h2>
	<div style="height: 30px;"></div>
	<div id="newstable">
		<table class="table">
			<tr>
    			<td colspan="4" class="text-end">
	    			<a href="#" class="btn btn-xs btn-project">수정</a>
    				<a href="#" class="btn btn-xs btn-danger">삭제</a>
    				<a href="../makerpage/makerpage_news.do" class="btn btn-xs btn-secondary">목록</a>
    			</td>
    		</tr>
			<tr>
				<th width="20%" class="text-end">프로젝트명</th>
				<td width="30%">{{news_detail.ftitle}}</td>
				<th width="20%" class="text-end">공지종류</th>
				<td width="30%">{{news_detail.tname}}</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">등록일</th>
				<td width="30%">{{news_detail.dbday}}</td>
				<th width="20%" class="text-end">조회수</th>
				<td width="30%">{{news_detail.hit}}</td>
			</tr>
			<tr>
				<th width="20%" class="text-end">제목</th>
				<td colspan="3">
					{{news_detail.subject}}
				</td>
			</tr>
			<tr v-if="filecount !=0">
    			<th width="20%" class="text-end">첨부파일</th>
    			<td colspan="3">
    				<ul>
    					<li v-for="fn,index in filenames"><a :href="'../makerpage/download.do?fn='+fn">{{fn}}</a>&nbsp;({{filesizes[index]}}Bytes)</li>
    				</ul>
    			</td>
    		</tr>
			<tr>
				<th width="20%" class="text-end">내용</th>
				<td colspan="3">
					<pre style="white-space: pre-wrap; background-color: white;border: none">{{news_detail.content}}</pre>
				</td>
			</tr>
			
		</table>
	</div>
</div>	
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			no:${no},
			news_detail:{},
			filecount:0,
			filenames:[],
			filesizes:[]
		},
		mounted:function(){
			axios.get('http://localhost/web/makerpage/makerpage_news_detail_vue.do',{
				params:{
					no:this.no
				}
			}).then(response=>{
				console.log(response.data)
				this.news_detail=response.data
				this.filecount=this.news_detail.filecount
				this.filenames=this.news_detail.filename.split(",")
				this.filesizes=this.news_detail.filesize.split(",")
			}).catch(error=>{
				console.log(error.response)
			})
		}
	})
</script>
</body>
</html>