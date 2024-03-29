<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<style>
	.ck-editor__editable {
	min-height: 500px;
}
</style>
<link rel="stylesheet" href="${path}/resources/css/admin/faqUpdate.css"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
<div class="pcoded-main-container">
	<div class="pcoded-wrapper container">
		<div class="pcoded-content">
			<div class="pcoded-inner-content">
				<div class="pcoded-inner-content">
					<div class="main-body">
						<div class="page-wrapper">
							<div class="page-header">
								<div class="page-block">
									<div class="row align-items-center">
										<div class="col-md-12">
											<div class="page-header-title">
												<h5 class="m-b-10">자주묻는질문 상세</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 상세</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
								<%-- <form:form action="faq/update/${faqlist.faqNo}" method="post"> <- 왜 이렇게 오류나는건지 이해가 안갑니다.. --%>
 								<form:form action="${pageContext.request.contextPath}/admin/faq/update/${faqlist.faqNo}" method="post" id="faqForm"> <!-- 해결 : 상대경로이용 -->
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right" type="submit" value="저장">
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="faqTitle" value="${faqlist.faqTitle }" >
	                                   			</div>
											</div>
											<!-- <div class="row"> -->
												<div class="col-sm-12">
					                                    <div class="form-group row text-center">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-4">
					                                            <input type="text" readonly class="form-control-plaintext" name="adminId" value="${faqlist.adminId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">작성일</label>
					                                        <div class="col-sm-4">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${faqlist.faqDate}" pattern="yyyy.MM.dd"/>">
					                                        </div>
					                                    </div>
				                                </div>
			                                <!-- </div> -->
											<div class="col-sm-12">
 											<div class="form-group">
			                                	<textarea class="form-control" name="faqContent" rows="20" id="faqContent_textarea" >${faqlist.faqContent }</textarea>
			                                </div>
<%-- 			                               <div class="form-group">
												  <div class="textarea-like" contenteditable="true">${faqlist.faqContent}</div>
												</div> --%>
											</div>
										</div>
									</div>
								</div>	
							</form:form>
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
<script>
ClassicEditor
.create(document.querySelector('#faqContent_textarea'))
.catch(error=>{
	console.error(error);
});

	$("#faqForm").submit(function() {
		  if(! $("input[name=faqTitle]").val() ) {
		    alert("제목을 입력해주세요.");
		    return false;
		  }
		  return true;
		});
</script>
</html>