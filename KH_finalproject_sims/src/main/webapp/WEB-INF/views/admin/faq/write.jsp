<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<style>
	.ck-editor__editable {
	min-height: 500px;
}
</style>
<title>자주묻는질문 작성</title>
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
												<h5 class="m-b-10">자주묻는질문 작성</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 작성</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form:form action="${pageContext.request.contextPath}/admin/faq/write" method="post" id="faqForm">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input type="hidden" value="${username }" name="adminId">
										<input class="btn btn-primary right" type="submit" value="저장">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
                                        			<input type="text" class="form-control" name="faqTitle" placeholder="제목을 입력하세요">
                                    			</div>
											</div>
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="faqContent" rows="20" placeholder="내용을 입력하세요" id="faqContent_textarea"></textarea>
			                                    </div>
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
</body>
</html>