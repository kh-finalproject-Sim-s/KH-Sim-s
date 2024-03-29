<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

	<title>Sims</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/like.css"/>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
    
    <section>
		<div class="container-fluid d-flex justify-content-center mt-5 like-plan-div">
	       	<div class="row like-plan-row">
	       		<div class="col">
       				<div class="mb-5">
	       				<p class="like-plan-p" style="font-weight: bold;">찜한 요금제</p>
       				</div>
       				<div>
       					<c:if test="${not empty likeList}">
    					<c:forEach var="list" items="${likeList}">
		    			<div class="row mt-3 list-div">
		    				<div class="col-8">
		    					<div class="row">
		    						<div class="col-4">
		       							<a href="<%=request.getContextPath()%>/bizinfo/${list.bizId}">
		       								<img src="<%=request.getContextPath()%>/resources/img/${list.bizId}.png" style="max-width: 100px; max-height: 40px;">
	       								</a>
		    						</div>
		       						<div class="col-8">
				    					<p class="planName">${list.planName}</p>
				    					<div class="planInfo">
					    					<c:if test="${list.netNo eq 1}"><p>KT | </p></c:if>
					    					<c:if test="${list.netNo eq 2}"><p>SKT | </p></c:if>
					    					<c:if test="${list.netNo eq 3}"><p>LGU+ | </p></c:if>
					    					<c:if test="${list.genNo eq 1}"><p>5G | </p></c:if>
					    					<c:if test="${list.genNo eq 2}"><p>LTE | </p></c:if>
					    					<c:if test="${list.genNo eq 4}"><p>3G | </p></c:if>
					    					<p>${list.bizName}</p>
				    					</div>
		       						</div>
	       						</div>
	       						
	       						<div class="planData ms-2">
	       							<c:if test="${list.planData eq 0}">
	       								<p>없음</p>
	       							</c:if>
	       							<c:if test="${list.planData ne 0}">
		       							<p>월&nbsp;<p>
				    					<p>
				    					<c:if test="${list.planData lt 1000}">
				    					${list.planData} MB 
				    					</c:if>
				    					<c:if test="${list.planData gt 1000}">
				    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${list.planData / 1000}" />
				    					${data} GB
				    					</c:if>
				    					</p>
			    					</c:if>
	       						</div>
		    					
		    					<div class="ms-2">
			    					<c:if test="${list.planVoice eq 0 and list.planMessage eq 0}">
			       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;기본제공&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;기본제공</p>
			    					</c:if>
			    					<c:if test="${list.planVoice ne 0 or list.planMessage ne 0}">
			       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;${list.planVoice}분&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;${list.planMessage}건</p>
			    					</c:if>
		    					</div>
		    					
		    					<div class="planPrice ms-2 mt-3">
			    					<p>월&nbsp;<p>
			    					<p class="priceText"><fmt:formatNumber value="${list.planPrice}" pattern="###,###" /></p>
			    					<p>&nbsp;원</p>
		    					</div>
		    				</div>
		    				<div class="d-flex flex-column col-4 mb-2">
		    					<div class="text-end">
		    						<a data-tooltip="찜 삭제" onclick="toggleLike(${list.planNo})">
			    						<i class="fa-solid fa-heart fa-xl" style="color: #f72b2b;"></i>
		    						</a>
		    					</div>
		    					<div class="mt-auto text-end">
			    					<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/plan/${list.planNo}'">자세히 보기</button>
		    					</div>
	    					</div>
		    			</div>
	    				</c:forEach>
	    				</c:if>
	    				<c:if test="${empty likeList}">
	       					<div class="row none-div">
	       						<div class="text-center align-self-center" style="font-size: 14px; color: black;">
		       						최근 본 요금제가 없습니다.
	       						</div>
	       					</div>
	       				</c:if>
       				</div>
	       		</div>
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
		function toggleLike(planNo) {
			console.log(planNo);
			$.ajax({
	            url: '${cpath}/plan/'+ planNo +'/like',
	            type: 'POST',
	            dataType: 'json',
	            data: {
	                planNo: planNo
	            },
	            success: function(result) {
	            	location.reload();
	            },
	            error: function(xhr, status, error) {
	                console.log("xhr.status: " + xhr.status);
	                console.log("xhr.statusText: " + xhr.statusText);
	                console.log("xhr.responseText: " + xhr.responseText);
	                console.log("xhr.readyState: " + xhr.readyState);
	            }
	        });
		}
	</script>
  
</body>
</html>