<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
    
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/biz/applyDetail.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
    요금제 신청서 상세정보
    <table class="table">
		<tbody>
			<tr>
				<th scope="row">
					<span>신청번호</span>
				</th>
				<td>${applyDetailPlan.orderNo }</td>
				<th scope="row">
					<span>요금제명</span>
				</th>
				<td>${applyDetailPlan.planName }</td>
                <th scope="row">
                    <span>아이디</span>
                </th>
                <td>${applyDetail.userId }</td>
                <th scope="row">
                    <span>이름</span>
                </th>
                <td>${applyDetail.userName }</td>
                <th scope="row">
                    <span>신청일자</span>
                </th>
                <td>${applyDetailPlan.orderDate }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>주민등록번호</span>
				</th>
				<td>${applyDetail.userSsn }</td>
				<th scope="row">
					<span>휴대폰번호</span>
				</th>
				<td>${applyDetail.userPhone }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>주소</span>
				</th>
				<td colspan="4">${applyDetail.userAddress }</td>
                <th scope="row">
                    <span>이메일</span>
                </th>
                <td colspan="4">${applyDetail.userEmail }</td>
			</tr>
        </tbody>
	</table>

    <table class="table">
        <tbody>
			<tr>
				<th scope="row">
					<span>가입유형</span>
				</th>
				<td>
				<c:choose>
					<c:when test= "${applyDetailPlan.joinCategory eq 1}">
						번호이동
					</c:when>
					<c:otherwise>
						신규가입
					</c:otherwise>
				</c:choose>
				</td>
				<th scope="row">
					<span>심종류</span>
				</th>
				<td>
				<c:choose>
					<c:when test ="${applyDetailPlan.simType eq 1 }">
						일반유심
					</c:when>
					<c:otherwise>
						NFC 유심
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
            <tr>
				<th scope="row">
					<span>유심신청여부</span>
				</th>
				<td>
				<c:choose>
					<c:when test ="${applyDetailPlan.simYn eq 1}">
						N
					</c:when>
					<c:otherwise>
						Y
					</c:otherwise>
				</c:choose>
				</td>
				<th scope="row">
					<span>현재사용통신사</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.currentTelecom eq 1}">
						SKT
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 2}">
						KT
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 3}">
						LGU+
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 4}">
						SKT 알뜰폰
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 5}">
						KT 알뜰폰	
					</c:when>
					<c:otherwise>
						LGU+ 알뜰폰
					</c:otherwise>				
				</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					<span>청구서유형</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.planBill eq 1}">
						문자
					</c:when>
					<c:otherwise>
						이메일
					</c:otherwise>
				</c:choose>	
				</td>
				<th scope="row">
					<span>납부방법</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.planPay eq 1}">
						카드
					</c:when>
					<c:otherwise>
						계좌이체
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
        </tbody>
    </table>	

    <!--납부방법에 따라 뜨는거 다르게 할 것. -->
    <table class="table">
    <c:choose>
        <c:when test="${applyDetailPlan.planPay eq 1}">
            <tr>
                <th scope="row">
                    <span>카드번호</span>
                </th>
                <td>${applyDetailPlan.cardNumber }</td>
                <th scope="row">
                    <span>카드유효기간</span>
                </th>
                <td>${applyDetailPlan.cardExpiration }</td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <th scope="row">
                    <span>은행</span>
                </th>
                <td>${applyDetailPlan.bank }</td>
                <th scope="row">
                    <span>계좌번호</span>
                </th>
                <td>${applyDetailPlan.bankNumber }</td>
            </tr>
        </c:otherwise>
    </c:choose>
	</table>


    <table class="table">
    	<tr>
	        <th scope="row">
	            <span>기본료(원)</span>
	        </th>
	        <td>${applyDetailPlan.planPrice }</td>
	        <th scope="row">
	            <span>기본데이터(MB)</span>
	        </th>
	        <td>${applyDetailPlan.planData }</td>
	        <th scope="row">
	            <span>기본음성(분)</span>
	        </th>
	        <td>${applyDetailPlan.planVoice }</td>
	        <th scope="row">
	            <span>기본문자(건)</span>
	        </th>
	        <td>${applyDetailPlan.planMessage }</td>
        </tr>
    </table>

	<div class="applyStatus">
		<table class="table">
			<tr>
				<th scope="row">
					<span>가입 신청 상태</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.orderStatus eq 1}">
						신청완료
					</c:when>
					<c:when test="${applyDetailPlan.orderStatus eq 2}">
						승인완료
					</c:when>
					<c:otherwise>
						승인보류
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		<button type="button" class="btn approve">승인</button>
		<button type="button" class="btn hold">보류</button>
	</div>
	
	<button type="button" onclick="location.href='<%=request.getContextPath()%>/biz/applyList'">목록으로</button>


<!-- 에러발생..  -->
<script>
	$(".btn.approve").on("click", approveClickHandler);
	function approveClickHandler(){
			$.ajax({
				url:"<%=request.getContextPath()%>/biz/approveStatus"
				, type:"POST"
				, data : {orderNo : ${applyDetailPlan.orderNo }}
				, success:function(result){
					alert("승인되었습니다.");
					location.reload();
				}
				, error:function(){
					alert("에러가 발생했습니다.");
				}
			});
		}
	
	
	$(".btn.hold").on("click", holdClickHandler);
	function holdClickHandler(){
		$.ajax({
			url:"<%=request.getContextPath()%>/biz/holdStatus"
			, type:"POST"
			, data : {orderNo : ${applyDetailPlan.orderNo }}
			, success:function(result){
				alert("보류되었습니다.");
				location.reload();
			}
			, error:function(){
				alert("에러가 발생했습니다.");
			}
		});
	}
</script>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
  	
	
</body>
</html>