<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/plans.css"/>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<section>
		<div class="container-fluid d-flex justify-content-center filter-div">
	       	<div class="row align-self-center border-0 rounded-3">
	       		<div class="col m-3 filter-area">
	       			<p>데이터</p>
	       			<c:choose>
		       			<c:when test="${param.planData eq 100000}">
		       				<p class="fs-4">100GB 이상</p>
		       			</c:when>
		       			<c:when test="${param.planData eq 50000}">
		       				<p class="fs-4">50~100GB</p>
		       			</c:when>
		       			<c:when test="${param.planData eq 10000}">
		       				<p class="fs-4">10~50GB</p>
		       			</c:when>
		       			<c:when test="${param.planData eq 5000}">
		       				<p class="fs-4">5~10GB</p>
		       			</c:when>
		       			<c:when test="${param.planData eq 1000}">
		       				<p class="fs-4">5GB 이하</p>
		       			</c:when>
	       				<c:otherwise>
	       					<p class="fs-4">전체</p>
	       				</c:otherwise>
	       			</c:choose>
	       		</div>
   				
	       		<div class="col m-3 filter-area">
	       			<p>통화량</p>
	       			<c:choose>
		       			<c:when test="${param.planVoice eq 0}">
		       				<p class="fs-4">기본제공</p>
		       			</c:when>
		       			<c:when test="${param.planVoice eq 300}">
		       				<p class="fs-4">300분 이상</p>
		       			</c:when>
		       			<c:when test="${param.planVoice eq 180}">
		       				<p class="fs-4">180~300분</p>
		       			</c:when>
		       			<c:when test="${param.planVoice eq 60}">
		       				<p class="fs-4">60~180분</p>
		       			</c:when>
		       			<c:when test="${param.planVoice eq 30}">
		       				<p class="fs-4">60분 이하</p>
		       			</c:when>
	       				<c:otherwise>
	       					<p class="fs-4">전체</p>
	       				</c:otherwise>
	       			</c:choose>
	       		</div>
   				
	       		<div class="col m-3 filter-area">
	       			<p>가격</p>
	       			<c:choose>
		       			<c:when test="${param.planPrice eq 30000}">
		       				<p class="fs-4">3만원 이상</p>
		       			</c:when>
		       			<c:when test="${param.planPrice eq 20000}">
		       				<p class="fs-4">2~3만원</p>
		       			</c:when>
		       			<c:when test="${param.planPrice eq 10000}">
		       				<p class="fs-4">1~2만원</p>
		       			</c:when>
		       			<c:when test="${param.planPrice eq 5000}">
		       				<p class="fs-4">5천~1만원</p>
		       			</c:when>
		       			<c:when test="${param.planPrice eq 1000}">
		       				<p class="fs-4">5천원 이하</p>
		       			</c:when>
	       				<c:otherwise>
	       					<p class="fs-4">전체</p>
	       				</c:otherwise>
	       			</c:choose>
	       		</div>
	       	</div>
       	</div>
 		<div class="container-fluid d-flex justify-content-center">
			<div class="row row-cols-auto my-3 mt-4 choose-div">
				<div class="col">
					<c:if test="${empty param.select}">
						<button class="pl on choose-btn">분류</button>
					</c:if>
					<c:if test="${param.select eq 'choose'}">
						<button class="pl on choose-btn">선택순</button>
					</c:if>
					<c:if test="${param.select eq 'star'}">
						<button class="pl on choose-btn">별점순</button>
					</c:if>
					<c:if test="${param.select eq 'data'}">
						<button class="pl on choose-btn">데이터 순</button>
					</c:if>
					<div style="position:absolute;">
					    <ul class="listbox" id="listbox" style="display: none; position:relative;">
					        <li><button class="list" value="choose">선택순</button></li>
					        <li><button class="list" value="star">별점순</button></li>
					        <li><button class="list" value="data">데이터 순</button></li>
					    </ul>
					</div>
				</div>
				<div class="col" style="display: flex; justify-content : center;">
      				<div class="vr" style="background-color:black; height:43px;"></div>
   				</div>
				<div class="col">
					<button type="button" class="btn btn-light btn-outline-secondary modalBtn" data-bs-toggle="modal" data-bs-target="#filter-modal">
						필터
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="filter-modal" tabindex="-1" aria-labelledby="filter-modal" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header-div">
									<div class="row m-3 mb-1">
										<div class="col text-start">
											<h5 class="modal-title" id="filter-modal" style="font-weight: bold">필터</h5>
										</div>
										<div class="col text-end">
											<button type="button" class="btn-close text-end" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
									</div>
									<div class="btn-div text-start mx-4">
										<button onclick="goToScroll('planData')">데이터</button>
										<button onclick="goToScroll('planVoice')">통화량</button>
										<button onclick="goToScroll('planMessage')">문자량</button>
										<button onclick="goToScroll('planPrice')">가격</button>
										<button onclick="goToScroll('netInfo')">통신정보</button>
										<button onclick="goToScroll('bizName')">통신사</button>
									</div>
									<hr style="border:0;border-top:1px solid #555;margin:0;height:1px;" />
								</div>
								<div class="modal-body">
					        		<div class="filter-list text-start m-3">
					        			<div id="planData">
					        				<div>
						        				<p class="mb-2">데이터</p>
						        				<div class="range-div my-2 mb-3">
						        					<div class="text-center">
						        						<label class="range1-label" for="range1">전체</label>
						        					</div>
						        			
							        				<div slider id="slider-distance">
													  <div>
													    <div inverse-left style="width:70%;"></div>
													    <div inverse-right style="width:70%;"></div>
													    <div range style="left:0%;right:0%;"></div>
													    <span thumb style="left:0%;"></span>
													    <span thumb style="left:100%;"></span>
													    <div sign style="left:0%;">
													      <span id="value">0</span>
													    </div>
													    <div sign style="left:100%;">
													      <span id="value">100</span>
													    </div>
													  </div>
													  <input type="range" id="range1" tabindex="0" value="0" max="100" min="0" step="5" oninput="
													  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[1].style.width=value+'%';
													  children[5].style.left=value+'%';
													  children[7].style.left=value+'%';children[11].style.left=value+'%';
													  children[11].childNodes[1].innerHTML=this.value;" />
													
													  <input type="range" tabindex="0" value="100" max="100" min="0" step="5" oninput="
													  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[3].style.width=(100-value)+'%';
													  children[5].style.right=(100-value)+'%';
													  children[9].style.left=value+'%';children[13].style.left=value+'%';
													  children[13].childNodes[1].innerHTML=this.value;" />
													</div>
												</div>
						        				<div>
					        						<fieldset>
														<label class="mx-1">
													    	<input type="radio" name="data" value="999999" checked />
													    	<span class="px-2">전체</span>
														</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="100000" />
													    	<span class="px-2">100GB 이상</span>
													  	</label>
													
													 	<label class="mx-1">
													    	<input type="radio" name="data" value="50000" />
													    	<span class="px-2">50~100GB</span>
													  	</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="10000" />
													    	<span class="px-2">10~50GB</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="5000" />
													    	<span class="px-2">5~10GB</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="1000" />
													    	<span class="px-2">5GB 이하</span>
													  	</label>
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="planVoice">
					        				<div>
						        				<p class="my-2">통화량</p>
						        				<div class="range-div my-2 mb-3">
						        					<div class="text-center">
						        						<label class="range2-label" for="range2">전체</label>
						        					</div>
						        			
							        				<div slider id="slider-distance">
													  <div>
													    <div inverse-left style="width:70%;"></div>
													    <div inverse-right style="width:70%;"></div>
													    <div range style="left:0%;right:0%;"></div>
													    <span thumb style="left:0%;"></span>
													    <span thumb style="left:100%;"></span>
													    <div sign style="left:0%;">
													      <span id="value">0</span>
													    </div>
													    <div sign style="left:100%;">
													      <span id="value">300</span>
													    </div>
													  </div>
													  <input type="range" id="range2" tabindex="0" value="0" max="300" min="0" step="10" oninput="
													  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[1].style.width=value+'%';
													  children[5].style.left=value+'%';
													  children[7].style.left=value+'%';children[11].style.left=value+'%';
													  children[11].childNodes[1].innerHTML=this.value;" />
													
													  <input type="range" tabindex="0" value="300" max="300" min="0" step="10" oninput="
													  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[3].style.width=(100-value)+'%';
													  children[5].style.right=(100-value)+'%';
													  children[9].style.left=value+'%';children[13].style.left=value+'%';
													  children[13].childNodes[1].innerHTML=this.value;" />
													</div>
												</div>
						        				<div>
					        						<fieldset>
														<label class="mx-1">
													    	<input type="radio" name="voice" value="999999" checked />
													    	<span class="px-2">전체</span>
														</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="1" />
													    	<span class="px-2">기본제공</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="300" />
													    	<span class="px-2">300분 이상</span>
													  	</label>
													
													 	<label class="mx-1">
													    	<input type="radio" name="voice" value="180" />
													    	<span class="px-2">180~300분</span>
													  	</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="60" />
													    	<span class="px-2">60~180분</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="30" />
													    	<span class="px-2">60분 이하</span>
													  	</label>
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="planMessage">
					        				<div>
						        				<p class="my-2">문자량</p>
						        				<div class="range-div my-2 mb-3">
						        					<div class="text-center">
						        						<label class="range3-label" for="range3">전체</label>
						        					</div>
						        			
							        				<div slider id="slider-distance">
													  <div>
													    <div inverse-left style="width:70%;"></div>
													    <div inverse-right style="width:70%;"></div>
													    <div range style="left:0%;right:0%;"></div>
													    <span thumb style="left:0%;"></span>
													    <span thumb style="left:100%;"></span>
													    <div sign style="left:0%;">
													      <span id="value">0</span>
													    </div>
													    <div sign style="left:100%;">
													      <span id="value">300</span>
													    </div>
													  </div>
													  <input type="range" id="range3" tabindex="0" value="0" max="300" min="0" step="10" oninput="
													  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[1].style.width=value+'%';
													  children[5].style.left=value+'%';
													  children[7].style.left=value+'%';children[11].style.left=value+'%';
													  children[11].childNodes[1].innerHTML=this.value;" />
													
													  <input type="range" tabindex="0" value="300" max="300" min="0" step="10" oninput="
													  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[3].style.width=(100-value)+'%';
													  children[5].style.right=(100-value)+'%';
													  children[9].style.left=value+'%';children[13].style.left=value+'%';
													  children[13].childNodes[1].innerHTML=this.value;" />
													</div>
												</div>
						        				<div>
					        						<fieldset>
														<label class="mx-1">
													    	<input type="radio" name="message" value="999999" checked />
													    	<span class="px-2">전체</span>
														</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="message" value="1" />
													    	<span class="px-2">기본제공</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="message" value="300" />
													    	<span class="px-2">300건 이상</span>
													  	</label>
													
													 	<label class="mx-1">
													    	<input type="radio" name="message" value="100" />
													    	<span class="px-2">100~300건</span>
													  	</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="message" value="50" />
													    	<span class="px-2">50~100건</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="message" value="10" />
													    	<span class="px-2">50건 이하</span>
													  	</label>
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="planPrice">
					        				<div>
						        				<p class="my-2">가격</p>
						        				<div>
					        						<fieldset>
					        							<div class="row">
					        								<div class="col">
																<label class="mx-1">
															    	<input type="radio" name="price" value="999999" checked />
															    	<span class="px-2">전체</span>
																</label>
															
															  	<label class="mx-1">
															    	<input type="radio" name="price" value="30000" />
															    	<span class="px-2">3만원 이상</span>
															  	</label>
															  	
															  	<label class="mx-1">
															    	<input type="radio" name="price" value="20000" />
															    	<span class="px-2">2~3만원</span>
															  	</label>
					        								</div>
					        								<div class="col">
															 	<label class="mx-1">
															    	<input type="radio" name="price" value="10000" />
															    	<span class="px-2">1~2만원</span>
															  	</label>
															
															  	<label class="mx-1">
															    	<input type="radio" name="price" value="5000" />
															    	<span class="px-2">5천~1만원</span>
															  	</label>
															  	
															  	<label class="mx-1">
															    	<input type="radio" name="price" value="1000" />
															    	<span class="px-2">5천원 이하</span>
															  	</label>
														  	</div>
					        							</div>
													
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="netInfo">
					        				<div>
						        				<p class="my-2">통신정보</p>
						        				<div class="row info-div">
						        					<div class="col">
							        					<p class="my-1">통신망</p>
							        					<div id="netNo">
							        						<fieldset>
																<label class="mx-1">
															    	<input type="radio" name="netNo" value="1" />
															    	<span class="px-2">KT</span>
																</label>
															
															  	<label class="mx-1">
															    	<input type="radio" name="netNo" value="2" />
															    	<span class="px-2">SKT</span>
															  	</label>
															  	
															  	<label class="mx-1">
															    	<input type="radio" name="netNo" value="3" />
															    	<span class="px-2">LGU+</span>
															  	</label>
															</fieldset>
														</div>
						        					</div>
						        					<div class="col">
							        					<p class="my-1">통신기술</p>
							        					<div id="genNo">
							        						<fieldset>
																<label class="mx-1">
															    	<input type="radio" name="genNo" value="1" />
															    	<span class="px-2">5G</span>
																</label>
															
															  	<label class="mx-1">
															    	<input type="radio" name="genNo" value="2" />
															    	<span class="px-2">LTE</span>
															  	</label>
															  	
															  	<label class="mx-1">
															    	<input type="radio" name="genNo" value="4" />
															    	<span class="px-2">3G</span>
															  	</label>
															</fieldset>
							        					</div>
						        					</div>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="bizName">
					        				<div>
						        				<p class="mt-2">통신사</p>
						        				<div>
					        						<fieldset>
					        							<div class="row">
					        								<div class="col">
						        								<c:choose>
						        									<c:when test="${fn:length(bizList) % 2 eq 0}">
					        										<fmt:parseNumber var="endNum" integerOnly="true" value="${fn:length(bizList) / 2 - 1}" />
						        										<c:forEach items="${bizList}" var="bizList" end="${endNum}">
																			<label class="mx-1">
																		    	<input type="radio" name="bizName" value="${bizList}" />
																		    	<span class="px-2">${bizList}</span>
																			</label>
						        										</c:forEach>
						        									</c:when>
						        									<c:when test="${fn:length(bizList) % 2 eq 1}">
					        										<fmt:parseNumber var="endNum" integerOnly="true" value="${fn:length(bizList) / 2}" />
						        										<c:forEach items="${bizList}" var="bizList" end="${endNum}">
																			<label class="mx-1">
																		    	<input type="radio" name="bizName" value="${bizList}" />
																		    	<span class="px-2">${bizList}</span>
																			</label>
						        										</c:forEach>
						        									</c:when>
						        								</c:choose>
					        								</div>
					        								<div class="col">
					        									<c:choose>
						        									<c:when test="${fn:length(bizList) % 2 eq 0}">
					        										<fmt:parseNumber var="begNum" integerOnly="true" value="${fn:length(bizList) / 2}" />
						        										<c:forEach items="${bizList}" var="bizList" begin="${begNum}">
																			<label class="mx-1">
																		    	<input type="radio" name="bizName" value="${bizList}" />
																		    	<span class="px-2">${bizList}</span>
																			</label>
						        										</c:forEach>
						        									</c:when>
						        									<c:when test="${fn:length(bizList) % 2 eq 1}">
					        										<fmt:parseNumber var="begNum" integerOnly="true" value="${fn:length(bizList) / 2 + 1}" />
						        										<c:forEach items="${bizList}" var="bizList" begin="${begNum}">
																			<label class="mx-1">
																		    	<input type="radio" name="bizName" value="${bizList}" />
																		    	<span class="px-2">${bizList}</span>
																			</label>
						        										</c:forEach>
						        									</c:when>
						        								</c:choose>
														  	</div>
					        							</div>
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        		</div>
					      		</div>
					      		<div class="modal-footer">
					        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        		<button type="button" class="btn btn-primary search-btn">확인</button>
					      		</div>
				    		</div>
					  	</div>
					</div>
				</div>
			</div>
	    </div>
	    <div class="container-fluid d-flex justify-content-center mt-3">
	    	<div class="row list-par-div">
	    		<div class="col-8">
	    			<div>
	    				<c:if test="${param.searchText ne null}">
	    					<p class="ms-3">검색어 '${param.searchText}' 총 ${cnt}개</p>
	    				</c:if>
	    				<c:if test="${param.searchText eq null}">
	    					<p class="ms-3">총 ${cnt}개</p>
	    				</c:if>
	    			</div>
	    			<c:if test="${not empty planList}">
	    			<c:forEach var="list" items="${planList}">
	    			<div class="row mt-3 list-div">
	    				<div class="col-8">
	    					<div class="row">
	    						<div class="col-4 align-self-center">
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
	    				<div class="d-flex flex-column col-4">
	    					<div class="text-end">
	    						<i class="fa-solid fa-star me-2" style="color: #ffdd00;"></i><span>${list.bizReviewStar}</span>
	    						<p class="viewCount">${list.orderCount}명 선택</p>
	    					</div>
	    					<div class="mt-auto text-end">
		    					<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/plan/${list.planNo}'">자세히 보기</button>
	    					</div>
    					</div>
	    			</div>
	    			</c:forEach>
	    			</c:if>
	    			<c:if test="${empty planList}">
	    			<div class="row ms-4 mt-3 none-planList">
   						<div class="text-center align-self-center" style="font-size: 14px; color: black;">
    						검색된 요금제가 없습니다.
   						</div>
   					</div>
	    			</c:if>
	    		</div>
	    		<div class="col-4">
	    			<div class="float-div">
		    			<div class="input-div">
		    				<input type="text" class="form-control searchText" placeholder="요금제이름 또는 통신사">
		    				<span class="material-symbols-outlined search-icon">search</span>	
		    			</div>
		    			<div class="row my-3">
	        				<div class="col">
		        				<p class="recent-p">최근 본 요금제</p>
	        				</div>
	        				<div class="col text-end">
		        				<p class="plus-p">더보기</p>
	        				</div>
	        			</div>
	        			<div class="mt-3">
	        				<c:if test="${not empty recentList}">
	    					<c:forEach var="list" items="${recentList}">
			    			<div class="row mt-3 recent-list">
    							<input class="recent-planNo" type="hidden" value="${list.planNo}">
	    						<div class="col-4 align-self-center">
	       							<img src="<%=request.getContextPath()%>/resources/img/${list.bizId}.png" style="max-width: 100px; max-height: 40px;">
	    						</div>
	       						<div class="col-8">
	       							<div>
				    					<p class="planName">${list.planName}</p>
	       							</div>
			    					<div class="planPrice mt-1">
				    					<p>월&nbsp;<p>
				    					<p class="priceText"><fmt:formatNumber value="${list.planPrice}" pattern="###,###" /></p>
				    					<p>&nbsp;원</p>
			    					</div>
			    				</div>
			    			</div>
		    				</c:forEach>
		    				</c:if>
	        				<c:if test="${empty recentList}">
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
	    </div>
	</section>

	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	<spring:eval expression="@apikey['apikey.channelIO']" var="channelIO"/>
  <!-- Scripts -->
  <script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/user/plans.js"></script>
  
</body>
</html>