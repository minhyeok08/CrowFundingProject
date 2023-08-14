<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-heading">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="top-text header-text"></div>
            </div>
        </div>
    </div>
</div>
	<c:forEach var="vo" items="${list }">
		${vo.id }
		<br>
		${vo.profile_img_path }
	</c:forEach>
</body>
</html>