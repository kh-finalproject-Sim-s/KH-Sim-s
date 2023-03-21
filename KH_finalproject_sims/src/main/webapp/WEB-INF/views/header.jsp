<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<!-- ***** Logo Start ***** -->
					<a href="#" class="logo"> <img
						src="https://dummyimage.com/50x50" alt="Sim-s">
					</a>
					<!-- ***** Logo End ***** -->
					<!-- ***** Menu Start ***** -->
					<ul class="nav">
						<li><a href="<%=request.getContextPath()%>/" class="active">홈</a></li>
						<li><a href="<%=request.getContextPath()%>/">요금제 찾기</a></li>
						<li><a href="<%=request.getContextPath()%>/">자주 묻는 질문</a></li>
						<sec:authorize access="isAnonymous()">
						<li> <a href="<%=request.getContextPath()%>/login">로그인 </a> </li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<form:form action="${pageContext.request.contextPath}/logout" method="POST">
							<li><input type="submit" value="로그아웃" /></li>
						</form:form>
						</sec:authorize>
						<li><a href="<%=request.getContextPath()%>/">마이페이지</a></li>
					</ul>
					<a class='menu-trigger'> <span>Menu</span>
					</a>
					<!-- ***** Menu End ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>