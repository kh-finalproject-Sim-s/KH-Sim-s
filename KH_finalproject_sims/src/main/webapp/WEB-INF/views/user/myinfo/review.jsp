<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/review.css"/>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-fluid d-flex justify-content-center mt-5 review-div">
	       	<div class="row review-row">
	       		<div class="col-12">
	       			<div class="row row-cols-auto text-div mb-5 ms-5">
	       				<div class="col text-center write-review">
		       				<p style="font-weight: bold; font-size: 20px;">리뷰 작성</p>
	       				</div>
	       				<div class="col" style="display: flex; justify-content : center;">
		       				<div class="vr" style="background-color:black; height:28px;"></div>
	       				</div>
	       				<div class="col text-center written-review">
	       					<p style="font-size: 20px;">작성한 리뷰</p>
	       				</div>
	       			</div>
	       			<div class="write-review-list">
	       				<c:if test="${not empty poList}">
	       				<c:forEach items="${poList}" var="po">
	       					<div class="insert-div">
			       				<div class="row my-3 list-row">
			       					<div class="col-2 text-center align-self-center">
		       							<img src="<%=request.getContextPath()%>/resources/img/${po.bizId}.png" style="max-width: 100px; max-height: 40px;">
			       					</div>
			       					<div class="col-7 align-self-center">
			       						<p class="plan-name-text">
			       							<input class="bizId" type="hidden" value="${po.bizId}">
			       							${po.planName} + 
			       							<c:if test="${po.planData eq 0}">
			       								없음
			       							</c:if>
			       							<c:if test="${po.planData ne 0}">
						    					<c:if test="${po.planData lt 1000}">
						    					${po.planData} MB 
						    					</c:if>
						    					<c:if test="${po.planData gt 1000}">
						    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${po.planData / 1000}" />
						    					${data} GB
						    					</c:if>
					    					</c:if>
			       						</p>
			       						<p>
			       							<c:if test="${po.netNo eq 1}">KT 망</c:if>
			       							<c:if test="${po.netNo eq 2}">SKT 망</c:if>
			       							<c:if test="${po.netNo eq 3}">LGU+ 망</c:if>
			       							 | 
			       							<c:if test="${po.genNo eq 1}">5G</c:if>
			       							<c:if test="${po.genNo eq 2}">LTE</c:if>
			       							<c:if test="${po.genNo eq 4}">3G</c:if>
			       						</p>
			       					</div>
			       					<div class="col-3 text-center align-self-center button-container">
			       						<button class="review-btn">
									        	리뷰 작성
									        <i class="fa fa-check"></i>
									    </button>
			       					</div>
			       				</div>
		       					<div class="row write-div" style="display: none;">
		       						<div class="col-9">
				  						<textarea class="insert-textarea">${ntc.ntcContent}</textarea>
		       						</div>
		       						<div class="col-3 text-center">
		       							<div class="mb-2">
			       							<span class="star">
			       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<!--
												★★★★★
												<span>★★★★★</span>
												-->
												<input class="insert-star" type="range" value="1" step="1" min="1" max="10">
											</span>
		       							</div>
			       						<div class="mt-1">
			       							<button class="insert-btn">작성</button>
			       						</div>
		       						</div>
			  					</div>
		       				</div>
	       				</c:forEach>
	       				</c:if>
	       				<c:if test="${empty poList}">
	       					<div class="row none-div">
	       						<div class="text-center align-self-center" style="font-size: 14px; color: black;">
		       						작성 할 리뷰가 없습니다.
	       						</div>
	       					</div>
	       				</c:if>
	       			</div>
	       			<div class="written-review-list" style="display: none;">
	       				<c:if test="${not empty reviewList}">
	       				<c:forEach items="${reviewList}" var="review">
	       					<div class="row my-3 list-row">
	       						<div class="col-9 m-2">
			       					<div class="row written-row">
				       					<div class="col-3">
				       						<input class="reviewNo" type="hidden" value="${review.reviewNo}">
				       						<input class="bizId" type="hidden" value="${review.bizId}">
				       						<p class="biz-name">${review.bizName}</p>
				       					</div>
				       					<div class="col-7">
				       						<span class="star" style="top: -6px;">
				       							<c:if test="${review.reviewStar eq 1}">
													<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 2}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 3}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 4}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 5}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 6}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 7}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 8}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 9}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
				       							</c:if>
				       							<c:if test="${review.reviewStar eq 10}">
													<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
				       							</c:if>
			       								<!--
												★★★★★
												<span>★★★★★</span>
												-->
												<input class="starInput insert-star" type="hidden" value="${review.reviewStar}" step="1" min="1" max="10">
											</span>
				       					</div>
				       					<div class="col-2">
				       						<c:if test="${empty review.reviewRedate}">
				       							<p class="review-date"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd"/></p>
					       					</c:if>
					       					<c:if test="${not empty review.reviewRedate}">
					       						<p class="review-date"><fmt:formatDate value="${review.reviewReDate}" pattern="yyyy.MM.dd"/></p>
					       					</c:if>
				       					</div>
			       					</div>
			       					<div>
			       						<div class="written-content">
					  						<textarea class="updateTextarea" readonly>${review.reviewContent}</textarea>
					  					</div>
			       					</div>
		       					</div>
		       					<div class="col-2 align-self-center text-center">
		       						<div class="my-2"><button class="ad-btn">수정</button></div>
		       						<div class="my-2" style="display:none;"><button class="update-btn">수정</button></div>
		       						<div class="my-2"><button class="del-btn">삭제</button></div>
		       					</div>
	       					</div>
	       				</c:forEach>
	       				</c:if>
	       				<c:if test="${empty reviewList}">
	       					<div class="row none-div">
	       						<div class="text-center align-self-center" style="font-size: 14px; color: black;">
		       						작성 한 리뷰가 없습니다.
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
	<script src="<%= request.getContextPath() %>/resources/js/user/review.js"></script>
  
</body>
</html>