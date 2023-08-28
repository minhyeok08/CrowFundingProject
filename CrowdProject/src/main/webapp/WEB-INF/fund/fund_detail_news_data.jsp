<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.makerpagemainrow{
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
.warningBox1 {
	margin: 25px 0px 25px 0px;
	line-height: 18px;
	color: rgba(0,0,0,.54);
	font-size: 13px;
}
.warningBox2 {
	margin: 40px auto;
	border: 0;
	background-color: rgba(255,102,102,.1);
	padding: 16px;
	color: rgba(0,0,0,.84);
	font-size: 13px;
}
.warningText1 {
	display: flex;
	align-items: center;
}
.warningIcon {
	transform: scale(1);
	transition: transform .3s ease-out;
	width: 1em;
	height: 1em;
	fill: currentColor;
	display: inline;
	margin-right: 5px;
	color: #f25555;
}
</style>
</head>
<body>
<div class="row makerpagemainrow">
	<div id="newstable">
		<table class="table">
			<tr>
    			<td colspan="4" class="text-end">
    				<a href="javascript:history.back()" class="btn btn-xs btn-secondary">목록</a>
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
    					<li v-for="fn,index in filenames">{{fn}}&nbsp;({{filesizes[index]}}Bytes)</li>
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
	<div class="warningBox1"><div class="warningBox2"><div class="warningText1"><svg viewBox="0 0 40 40" focusable="false" role="presentation" class="warningIcon" aria-hidden="true"><path d="M0 0v40h40V0zm20 39a19 19 0 1 1 19-19 19.06 19.06 0 0 1-19 19z" fill="none"></path><path d="M20 1a19 19 0 1 0 19 19A19.06 19.06 0 0 0 20 1zm-1 9.21h2v13h-2zm1 19.39a1.8 1.8 0 1 1 1.8-1.8 1.81 1.81 0 0 1-1.8 1.8z"></path></svg>댓글 작성 유의사항</div><div><div>최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 해당 프로젝트와 무관한 댓글 혹은 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있으니, 유의하여 주시기 바랍니다.</div><div>개인정보(실명, 휴대폰번호, 주소 등)가 노출되지 않도록 유의하세요. 메이커에게 개인정보를 전달해야하는 경우, [메이커에게 문의하기]를 이용해주세요.</div></div></div></div>
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
			axios.get('../fund/fund_news_detail_vue.do',{
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