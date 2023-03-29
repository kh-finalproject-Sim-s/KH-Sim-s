<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>질문하기</title>
</head>
<body>
	<div class="container">
		<form action="${cpath }/faq/qna/write" method="post">
			<div>
				<label>제목</label>
				<div>
					<input type="hidden" value="${username }" name="userId">
					<input type="text" name="aqTitle">
				</div>
			</div>
			<div>
				<label>내용</label>
				<textarea rows="5" name="aqContent"></textarea>
			</div>
			<div class="row">
				<button type="button" onClick="history.back();">목록</button>
				<button type="submit">완료</button>
			</div>
		</form>
	</div>
</body>
</html>