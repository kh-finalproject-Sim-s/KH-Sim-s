<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

	<title>Sims</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    
     <style>

    .input-form {
      max-width: 680px;

      margin-top: 150px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
	  <c:if test="${resultId eq null}">
	  <div class="container">
	    <div class="input-form-backgroud row">
	      <div class="input-form col-md-12 mx-auto">
	        <h4 class="mb-3">아이디 찾기</h4>
	        
        	<!-- 유형 -->
        	<div class="container text-center">
	            <div class="row">
		          <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0" type="radio" value="ROLE_USER" name="role" checked="checked">
					  </div>
					  <input type="text" class="form-control" aria-label="Text input with checkbox" value="사용자" readonly>
				  </div>
				  <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0" type="radio" value="ROLE_BIZ" name="role">
					  </div>
					  <input type="text" class="form-control" aria-label="Text input with checkbox" value="통신사" readonly>
				  </div>
	            </div>
	        </div>
		        
	        <c:url value="/findid" var="findidUrl" />
	        <form:form class="userForm validation-form" name="f" action="${findidUrl}" method="post" novalidate="novalidate">
	        
	        <!-- 유저 정보 -->
	        <input type="hidden" name="role" value="ROLE_USER">
	        
	      <div class="user">
		          <div class="mb-3">
		              <label for="userName">이름</label>
		              <input type="text" class="form-control" name="userName" placeholder="이름" required>
		              <div class="invalid-feedback">이름을 입력해주세요.</div>
		          </div>
				
	            <div class="row">
		          <div class="col-9 mb-3 text-left">
		            <label for="userEmail">이메일</label>
		            <input type="email" class="form-control" name="userEmail" placeholder="you@example.com" required>
		            <div class="invalid-feedback">이메일을 입력해주세요.</div>
		          </div>
		          <div class="col-3 mb-3 text-center align-self-end">
		            <button class="btn btn-primary btn-sm btn-block" name="emailBtn" type="button" disabled="disabled">본인인증</button>
		          </div>
	            </div>
		
		          <div class="mb-3">
		            <label for="emailCheck">인증번호</label>
		            <input type="text" class="form-control" name="emailCheck" placeholder="인증번호" required>
		            <div class="invalid-feedback">인증번호를 입력하세요</div>
		          </div>
		          
		        <div class="emailCheckDiv" style="display:none;"></div>
	        
	        	<button class="btn btn-primary btn-lg btn-block subBtn" type="submit" disabled>다음</button>
	        </div>
	        </form:form>
	        
	        <form:form class="bizForm validation-form" name="f" action="${findidUrl}" style="display:none" method="post" novalidate="novalidate">
	          <!-- 통신사 정보 -->
	          <input type="hidden" name="role" value="ROLE_BIZ">
	          
	          <div class="biz">
		          <div class="mb-3">
		              <label for="bizName">법인명</label>
		              <input type="text" class="form-control" name="bizName" placeholder="법인명" required>
		              <div class="invalid-feedback">법인명을 입력해주세요.</div>
		          </div>
		          
		          <div class="row">
			          <div class="col-9 mb-3 text-left">
			            <label for="userEmail">이메일</label>
			            <input type="email" class="form-control" name="bizEmail" placeholder="you@example.com" required>
			            <div class="invalid-feedback">이메일을 입력해주세요.</div>
			          </div>
			          <div class="col-3 mb-3 text-center align-self-end">
			            <button class="btn btn-primary btn-sm btn-block" name="emailBtn" type="button" disabled="disabled">본인인증</button>
			          </div>
		          </div>
		
		          <div class="mb-3">
		            <label for="emailCheck">인증번호</label>
		            <input type="text" class="form-control" name="emailCheck" placeholder="인증번호" required>
		            <div class="invalid-feedback">인증번호를 입력하세요</div>
		          </div>
			          
			      <div class="emailCheckDiv" style="display:none;"></div>
		          
	           
	           	  <button class="btn btn-primary btn-lg btn-block subBtn" type="submit" disabled>다음</button>
	          </div>
            </form:form>
	      </div>
	      <c:if test="${msg ne null}">
	      <div class="text-center mt-4"><h5 style="color:red">${msg}</h5></div>
	      </c:if>
	    </div>
	    </div>
	    </c:if>
	    
	    <c:if test="${resultId ne null}">
	    <!-- 아이디 결과 -->
	    <div class="container">
		    <div class="input-form-backgroud row">
		      <div class="input-form col-md-12 mx-auto">
			      <h4 class="mb-3">아이디 정보</h4>
			        
		          <div class="mb-3">
		              <h6 class="mb-3">고객님의 정보와 일치하는 아이디 입니다.</h6>
		              <input type="text" class="form-control resultId" value="${resultId}" disabled>
		          </div>
		          <div class="row">
		          <c:if test="${resultEna eq null}">
			          <div class="col text-center">
			          	<button class="btn btn-primary btn-sm btn-block login-btn" type="button">로그인 하기</button>
			          </div>
			          <div class="col text-center">
			          	<button class="btn btn-primary btn-sm btn-block findpw-btn" type="button">비밀번호 찾기</button>
			          </div>
		          </c:if>
		          <c:if test="${resultEna ne null}">
		              <div class="col text-center">
			          	<button class="btn btn-primary btn-sm btn-block rel-btn" type="button">휴면 풀기</button>
			          </div>
		          </c:if>
		          </div>
		      </div>
		    </div>
	    </div>
	    </c:if>
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
  <script src="<%= request.getContextPath() %>/resources/js/main/findid.js"></script>
  
  
</body>
</html>