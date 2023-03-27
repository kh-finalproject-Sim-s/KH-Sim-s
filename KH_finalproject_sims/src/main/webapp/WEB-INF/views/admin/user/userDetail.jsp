<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� ����� ���� ��</title>
</head>
<body>
<jsp:include page="../include/header.jsp" />
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
												<h5 class="m-b-10">����� ����
													<c:choose>
														<c:when test="${cmd eq 'read' }"> ��</c:when>
														<c:otherwise> ����</c:otherwise>
													</c:choose>
												</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/adminNotice/noticeList/"><i class="breadcrumb-item"></i>����� ����</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>����� ���� 
													<c:choose>
														<c:when test="${cmd eq 'read' }"> ��</c:when>
														<c:otherwise> ����</c:otherwise>
													</c:choose>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/adminUser/saveUserModify" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/adminUser/userList'" value="���">
										<c:choose>
											<c:when test="${cmd eq 'read' }">
												<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/adminUser/selectUserModify/${userDetail.userId}'" value="����">
											</c:when>
											<c:otherwise>
												<input class="btn btn-primary right" type="submit" value="����">
											</c:otherwise>
										</c:choose>
										<input type="hidden" value="${userId }" name="userId">
										<input type="hidden" value="${userDetail.userId }" name="userId">
									</div>
								</div>
							</form>
							 <div class="col-sm-12">
                				<div class="card">
                    				<div class="card-header">
                        				<h5>����� ������</h5>
                    				</div>
                    				<div class="card-body">
	                                    <div class="form-group row">
	                                        <label for="inputEmail3" class="col-sm-1 col-form-label text-center">���̵�</label>
	                                        <div class="col-sm-5">
	                                            <input type="email" class="form-control" id="inputEmail3" placeholder="id" value="${userDetail.userId}">
	                                        </div>
	                                        <label for="inputPassword3" class="col-sm-1 col-form-label text-center">�̸�</label>
	                                        <div class="col-sm-5">
	                                            <input type="password" class="form-control" id="inputPassword3" placeholder="�̸�" value="${userDetail.userName}">
	                                        </div>
	                                    </div>
	                           			 <div class="form-group row">
	                                        <label for="inputEmail3" class="col-sm-1 col-form-label text-center">����</label>
	                                        <div class="col-sm-5">
	                                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email" value="${userDetail.userEmail}">
	                                        </div>
	                                         <label for="inputEmail3" class="col-sm-1 col-form-label text-center">����</label>
	                                        <div class="col-sm-5">
	                                            <input type="email" class="form-control" id="inputEmail3" placeholder="����" value="${userDetail.userGender}">
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="inputEmail3" class="col-sm-1 col-form-label text-center">�������</label>
	                                        <div class="col-sm-5">
	                                            <input type="email" class="form-control" id="inputEmail3" placeholder="�������" value="${userDetail.userSsn}">
	                                        </div>
	                                        <label for="inputEmail3" class="col-sm-1 col-form-label text-center">��ȭ��ȣ</label>
	                                        <div class="col-sm-5">
	                                            <input type="email" class="form-control" id="inputEmail3" placeholder="��ȭ��ȣ" value="${userDetail.userPhone}">
	                                        </div>
	                                    </div>
									 </div>
				    			</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<jsp:include page="../include/footer.jsp" />

</body>
</html>