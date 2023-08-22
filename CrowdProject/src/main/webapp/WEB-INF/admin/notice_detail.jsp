<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style type="text/css">
.adminContainer {
	margin: 0px auto;
	width: 800px;
}

.btn-custom {
	background-color: transparent;
	border-color: #00b2b2;
	color: #00b2b2;
	transition: background-color 0.3s;
	font-size: 14px;
}

.btn-custom:hover {
	background-color: rgb(234, 248, 249);
	border-color: #00b2b2;
	color: #00b2b2;
}

.form-group {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.form-label {
	width: 20%;
	text-align: center;
	margin-right: 1em;
}

.form-control {
	flex: 1;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

.form-control:focus {
	border-color: #00b2b2;
	outline: 0;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(0, 178, 178, 0.6);
}

.select-control {
	flex: 1;
	padding: 6px 12px;
	font-size: 14px;
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	appearance: none;
	-webkit-appearance: none;
	background: url('dropdown-arrow.png') no-repeat right;
	background-size: 16px;
	background-position: calc(100% - 8px) center;
	width: 50%; /* 크기 조정 */
}

.radio-group {
	display: flex;
	align-items: center;
}

.radio-group label {
	margin-right: 15px;
}

</style>
</head>
<body>
	<h1 class="text-center">상세보기</h1>
	<div style="height: 20px"></div>
	<div class="adminContainer">
			<div class="form-group">
				<label class="form-label" for="writer">이름</label>
				<input type="text" name="writer" class="form-control" :value="notice_detail.writer" size="20" readonly>
			</div>
			<div class="form-group">
				<label class="form-label" for="subject">제목</label>
				<input type="text" name="subject" class="form-control" :value="notice_detail.subject" size="50" readonly>
			</div>
			<div class="form-group">
				<label class="form-label" for="content">내용</label>
				<textarea rows="10" cols="52" name="content" class="form-control" readonly>{{notice_detail.content}}</textarea>
			</div>
			<div class="form-group">
				<label class="form-label" for="state">중요공지</label>
				<select name="state" class="select-control" disabled>
					<option value="no" :selected="notice_detail.state === 'no'">no</option>
					<option value="yes" :selected="notice_detail.state === 'yes'">yes</option>
				</select>
			</div>
			<div class="form-group" >
				<label class="form-label">타입</label>
				<div class="radio-group">
					<label>
						<input type="radio" name="category" value="event" :checked="notice_detail.category === 'event'" disabled>이벤트
					</label>
					<label>
						<input type="radio" name="category" value="notice" :checked="notice_detail.category === 'notice'" disabled>공지사항
					</label>
					<label>
						<input type="radio" name="category" value="news" :checked="notice_detail.category === 'news'" disabled>보도자료
					</label>
				</div>
			</div>
			<div class="text-center">
				<input type="submit" value="수정하기" class="btn btn-custom" @click="update(${wnno })">
				<input type="button" value="취소" class="btn btn-custom" onclick="javascript:history.back()">
			</div>
	</div>
	<script>
	new Vue({
        el: '.adminContainer',
        data: {
            notice_detail: {},
            wnno: ${wnno},
            isEditing: false // 추가: 수정 가능 상태를 저장할 변수
        },
        methods: {
            enableEditing() {
                this.isEditing = true; // 수정 버튼을 클릭하면 수정 가능 상태로 변경됨
            },
            update:function(wnno){
            	location.href='../admin/notice_update.do?wnno='+wnno;
            }
        },
        mounted: function () {
            axios.get('../admin/notice_detail_vue.do', {
                params: {
                    wnno: this.wnno
                }
            }).then(res => {
                console.log(res.data);
                this.notice_detail = res.data;
            }).catch(error => {
                console.log(error.response);
            });
        }
    });
	</script>
</body>
</html>
