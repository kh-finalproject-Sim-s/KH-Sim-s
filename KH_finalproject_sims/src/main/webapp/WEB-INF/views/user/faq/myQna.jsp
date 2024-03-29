<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<% pageContext.setAttribute("CRLF", "\r\n"); %>
<% pageContext.setAttribute("LF", "\n"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<title>내 질문/답변</title>
	
	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/qna.css">

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>

	<section>
		<div class="container-sm div-m">
		
			<!-- ***** 내 질문 목록 start  ***** -->
			<div class="box-myqna mx-auto">
				<h4 class="mb-4">내가 작성한 질문</h4>
				<c:if test="${empty myqnalist }">
					<p>작성하신 질문이 없습니다.</p>
				</c:if>
				<c:if test="${not empty myqnalist }">
					<c:forEach items="${myqnalist}" var="myqnas">
						<div class="row my-3">
							<div class="col-sm-8 my-auto">
								<a href="${cpath }/faq/qna/${myqnas.aqNo}">${myqnas.aqTitle}(${myqnas.aqAnswers })</a>
							</div>
							<div class="col-sm-2 m-auto">
								<p><fmt:formatDate value="${myqnas.aqDate}" pattern="YY.MM.dd"/></p>
							</div>
							<div class="col-sm-2 text-end my-auto">
								<div class="btn-group btn-group-sm" role="group">
									<button class="btn btn-gray" type="button" 
									onclick="location.href='${cpath }/faq/qnaupdate/${myqnas.aqNo}'">수정</button>
									<button type="button" class="btn btn-gray" 
									onclick="location.href='${cpath }/faq/qnadelete/${myqnas.aqNo}'">삭제</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- ***** 내 질문 목록 end  ***** -->
			<!-- ***** 내 답변 목록 start  ***** -->
			<div class="box-myqna mx-auto">
				<h4 class="mb-4">내가 작성한 답변</h4>
				<c:if test="${empty myanslist }">
					<p>작성하신 답변이 없습니다.</p>
				</c:if>
				<c:if test="${not empty myanslist }">
					<c:forEach items="${myanslist}" var="myanss">
						<div class="row my-3" id="aa-content-${myanss.aaNo}">
							<div class="col-sm-8 my-auto">
								<a href="${cpath }/faq/qna/${myanss.aqNo}">${fn:replace(fn:replace(myanss.aaContent, CRLF, '<br>'), LF, '<br>')}</a>
							</div>
							<div class="col-sm-2 small my-auto">
								<p><fmt:formatDate value="${myanss.aaDate}" pattern="YY.MM.dd"/></p>
							</div>
							<div class="col-sm-2 text-end my-auto">	
								<div class="btn-group btn-group-sm" role="group">
										<button class="btn btn-gray" type="button" onclick="answerForm(${myanss.aaNo});">수정</button>
										<button type="button" class="btn btn-gray btn-ans-delete"
										onclick="location.href='${cpath}/faq/ansdelete/${myanss.aqNo}/${myanss.aaNo}'">삭제</button>
								</div>
							</div>
						</div>
						<!-- 답변 수정 폼 -->
						<div id="update-answer-${myanss.aaNo}" style="display: none;">
							<form action="${cpath }/faq/ansupdate/${myanss.aaNo }" method="post" onsubmit="return validModAns(${myanss.aaNo})">
								<div class="card mt-2">
									<div class="card-body text-end">
										<textarea hidden="hidden" id="hiddenAa_${myanss.aaNo}">${myanss.aaContent}</textarea>
										<textarea id="modAaContent_${myanss.aaNo }" name="aaContent" class="myans-form">${myanss.aaContent}</textarea>
										<button class="btn btn-sm" type="submit">수정</button>
										<button class="btn btn-sm" type="button" onclick="back(${myanss.aaNo});">취소</button>
									</div>
								</div>
							</form>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- ***** 내 답변 목록 end  ***** -->
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
    <!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	
	<script>
		function validModAns(aaNo) {
			var aaContent = document.getElementById("modAaContent_" + aaNo).value;
			var hiddenAa = document.getElementById("hiddenAa_" + aaNo).value;
			if (aaContent == "") {
				alert("수정할 답변을 입력해주세요.");
				return false;
			} else if (aaContent == hiddenAa) {
				alert("수정할 내용이 없습니다.");
				return false;
			}
		}
		function answerForm(aaNo) {
			var aaContent = document.getElementById("aa-content-"+ aaNo);
			var upAnsForm = document.getElementById("update-answer-"+ aaNo);
			aaContent.style.display = 'none';
			upAnsForm.style.display = 'block';
		}
		function back(aaNo) {
			var aaContent = document.getElementById("aa-content-"+ aaNo);
			var upAnsForm = document.getElementById("update-answer-"+ aaNo);
			aaContent.style.display = '';
			upAnsForm.style.display = 'none';
		}
	</script>

</body>
</html>