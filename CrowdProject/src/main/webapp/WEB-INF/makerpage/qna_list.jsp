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
	width: 1000px;
	height: 700px;
	border: 2px solid #a6d8ce;
	margin: 0px auto;
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
<div class="makerpagemainrow">
	<div style="height: 50px;"></div>
	<h2 class="text-center">고객 문의</h2>
	<div id="qnatable">
		<table class="table">
			<tr>
				<td class="inline text-end">
			        <select ref="wfno" v-model="wfno" >
						<option value=0>전체</option>
					    <option v-for="vo in project_list" :value="vo.wfno" >{{vo.ftitle}}</option>
					</select>
				    <button type="button" class="btn btn-sm btn-project" @click.prevent='submitForm'>검색</button>
			    </td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th width="10%" class="text-center">고객명</th>
				<th width="40%" class="text-center">제목</th>
				<th width="20%" class="text-center">프로젝트명</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="10%" class="text-center"></th>
			</tr>
			<tr v-for="vo in qna_list">
				<td width="10%" class="text-center">{{vo.id}}</td>
				<td width="40%" class="text-center">{{vo.subject}}</td>
				<td width="20%" class="text-center">{{vo.ftitle}}</td>
				<td width="20%" class="text-center">{{vo.dbday}}</td>
				<td width="10%" class="text-center" v-if="vo.isreply==0">
					<a :href="'../makerpage/qna_reply.do?qno='+vo.qno" class="btn btn-sm btn-project">
    					답변하기
    				</a>
				</td>
				<td width="10%" class="text-center" v-if="vo.isreply==1">
					<button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#confirmModal" @click="qnaDetail(vo.group_id)">
    					답변확인
    				</button>
				</td>
			</tr>
		</table>
	</div>
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
	<!-- Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">답변 상세 보기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table class="table">
	        	<tr>
	        		<th width="20%" class="text-end">고객ID</th>
	        		<td width="30%">{{question_detail.id}}</td>
	        		<th width="20%" class="text-end">등록일</th>
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
	        		<th width="20%" class="text-end">답변 제목</th>
	        		<td colspan="3">{{answer_detail.subject}}</td>    		
	        	</tr>	
	        	<tr>
	        		<th width="20%" class="text-end">답변 내용</th>
	        		<td colspan="3">
	        		<pre style="white-space: pre-wrap; background-color: whtie;border: none">{{answer_detail.content}}</pre>
	        		</td>    		
	        	</tr>	
	        </table>
	        
	      </div>
	      <div class="modal-footer">
	        <a :href="'../makerpage/qna_reply_update.do?group_id='+question_detail.group_id" class="btn btn-xs btn-warning">수정</a> 
	        <button type="button" class="btn btn-xs btn-danger" @click="del(question_detail.group_id)">삭제</button>
	        <button type="button" class="btn btn-xs btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<script>
	new Vue({
		el:'.makerpagemainrow',
		data:{
			id:'${id}',
			wfno:0,
			project_list:[],
			page_list:{},
			qna_list:[],
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			qna_detail:{},
			group_id:0,
			qno:0,
			question_detail: { subject: '', content: '' },
			answer_detail: { subject: '', content: '' }
		},
		mounted:function(){
			axios.get("../makerpage/project_list_for_qna_vue.do",{
				params:{
					id:this.id
				}
			}).then(response=>{
				console.log(response.data)
				this.project_list=response.data
			})
			this.dataRecv()
		},
		methods:{
			dataRecv:function(){
				axios.get("../makerpage/qna_list_for_maker.do",{
					params:{
						id:this.id,
						wfno:this.wfno,
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.qna_list=response.data
				}).catch(error=>{
					console.log(error.response)
				})
				axios.get('../makerpage/qna_list_page_vue.do',{
					params:{
						id:this.id,
						wfno:this.wfno,
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
				this.dataRecv()
			},
			prev:function(){
				this.curpage=this.startPage-1;
				this.dataRecv()
			},
			next:function(){
				this.curpage=this.endPage+1;
				this.dataRecv()
			},
			submitForm:function(){
				this.curpage = 1;  // 검색 시 항상 첫 페이지부터 시작
                this.dataRecv();   // fdno와 fd가 바뀐 상태로 dataRecv 호출
	        },
	        qnaDetail:function(no){
	        	axios.get("../makerpage/question_detail_vue.do",{
	        		params:{
	        			group_id:no
	        		}
	        	}).then(response=>{
	        	this.question_detail=response.data
	        	})
	        	axios.get("../makerpage/answer_detail_vue.do",{
	        		params:{
	        			group_id:no
	        		}
	        	}).then(response=>{
	        	this.answer_detail=response.data
	        	})	
	        },
	        del:function(no){
	        	axios.get('../makerpage/qna_delete_all_vue.do',{
					params:{
						group_id:no
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