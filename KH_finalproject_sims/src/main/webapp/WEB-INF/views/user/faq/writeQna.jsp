<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
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
	
	<title>질문하기</title>
	
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
		<div class="container-sm div-sm">
			<div class="row box-myqna mx-auto">
				<div class="col-sm-12 p-2">
					<h5 class="mb-3 fw-bolder">질문의 제목을 구체적으로 적어주세요</h5>
					<form action="${cpath }/faq/qna/write" method="post" id="writeQna" onsubmit="return validateForm()">
						<div class="py-2">
							<input type="hidden" value="${username }" name="userId"> 
							<input class="border-0 w-100" type="text" name="aqTitle" id="aqTitle"
								placeholder="예시) 기존 통신사는 직접 해지해야 되나요?">
						</div>
						<hr>
						<div class="py-2">
							<textarea class="border-0 w-100" id="aqContent" rows="10" name="aqContent"
							placeholder="현재 사용하시는 통신사 혹은 질문과 관련된 자세한 내용을 함께 적어주시면 더 정확한 답변이 가능해요.
							
예시) 지금 약정이 3개월 남았어요.
예시) 지금 XX통신사를 사용하고 있는데...
예시) 갤럭시 S10 5G를 쓰고 있는데..."></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="text-end my-3">
				<button class="btn btn-secondary" type="button" onClick="history.back();">취소</button>
				<button class="btn btn-primary" type="submit" form="writeQna">작성</button>
			</div>
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
		function validateForm() {
			var aqTitle = document.getElementById("aqTitle").value;
			var aqContent = document.getElementById("aqContent").value;
			if (aqTitle == "" || aqContent == "") {
				alert("내용을 입력해주세요.");
				return false;
			}
		}
	</script>

</body>
</html>