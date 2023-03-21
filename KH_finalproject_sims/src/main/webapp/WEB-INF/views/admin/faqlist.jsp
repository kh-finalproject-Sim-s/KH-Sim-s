<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-sm">
		<button type="button" class="btn writing btn-outline-secondary btn-sm">글쓰기</button>
		<table class="table table-hover table-group-divider mt-3 mb-3">
			<thead class="table-light text-center">
			<tr>
				<th class="text-center">번호</th>
				<th>제목</th>
				<th class="text-center">작성자
				<!-- <th class="text-center">작성일</th -->
			</tr>
			</thead>
< 			<c:forEach items="${faqlist}" var="faq">
				<tbody>
					<tr>
						<td class="text-center">${faq.faqNo}</td>
						<td class="text-center"><a href="<%=request.getContextPath()%>/admin/faqdetail/${faq.faqNo}">${faq.faqTitle}</a></td>
						<td class="text-center">${faq.adminId}</td>
						<%-- <td class="text-center">${faq.adminId}</td> --%>
					</tr>
				</tbody>
 			</c:forEach>
		</table>
	</div>
</body>
</html>