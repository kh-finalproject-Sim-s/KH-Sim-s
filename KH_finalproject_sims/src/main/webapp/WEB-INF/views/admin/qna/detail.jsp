<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<link rel="stylesheet" href="${path}/resources/css/admin/qnaDetail.css"/>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
												<h5 class="m-b-10">문의내역 상세</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 상세</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>			
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<%-- <input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qna/delete?aqNo=${qnaDetail.aqNo}'" value="삭제"> --%>
										<input class="btn btn-primary right m-l-10" type="button" onclick="deleteQna()" value="삭제">
										<input type="hidden" name="aqNo" value="${qnaDetail.aqNo}">
										<input class="btn btn-primary right " type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qna/list'" value="목록">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="ntcTitle" value="${qnaDetail.aqTitle }" readonly style="background-color: white;">
	                                   			</div>
											</div>
												<div class="col-sm-12">
					                                    <div class="form-group row">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="userId" value="${qnaDetail.userId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">작성일</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${qnaDetail.aqDate}" pattern="yyyy.MM.dd"/>">
					                                        </div>
				                                       		<label for="adminId" class="col-sm-2 col-form-label left">조회수</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" id="aqViews" value="${qnaDetail.aqViews }">
					                                        </div>
					                                    </div>
				                                </div>
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" readonly style="background-color: white; resize: none;">${qnaDetail.aqContent }</textarea>
			                                    </div>
											</div>
										</div>
									</div>
								</div>
								<div class="card table-card review-card">
				                    <div class="card-header borderless">
				                        <div>
				                        	<i class="fa-regular fa-comment-dots"></i>
					                        <span id="answersCount">${qnaDetail.aqAnswers }</span>
					                        <span>개의 답변</span>				                        
						                    <div class="text-right">
										          <textarea class="form-control m-t-15 m-b-15" id="aaContent" rows="3" placeholder="댓글을 입력해보세요." required style="resize: none;"></textarea>
										          <div class="invalid-tooltip">
				                                       	 답변을 작성해주세요.
				                                  </div>
										          <button type="button" class="btn btn-sm btn-primary" id="ans-btn">등록</button>			                                					                    
						                    </div>
					                    </div>
										<div class="card-body pb-0">
					                        <div class="review-block">
						                            <div class="row"   style="padding-bottom: 0px;">
						                                <div class="col">	
							                                <div id="qnaAnsList"></div>
						                                </div>
						                           </div>
					                        </div>
					                    </div>
				                    </div> 
				               </div>
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

$(document).ready(function(){
	getAnsList();
}); 

// 답변 리스트 ajax
 function getAnsList(){
 	var aqNo = "${aqNo}"
     $.ajax({
         type:'POST',
         url : '<%=request.getContextPath()%>/admin/qna/ansList',
         data: {aqNo: aqNo},
 		success : function(result) {
 				if (result != null) {
 					console.log(result);
 					displayAns(result);
 				}
 			},
 		error : function() {
 			alert("서버 요청 실패!")
 		}
         
     });
 }
 function displayAns(result){
 	var html = ''; 
 	for ( var i in result) {
 		
 		html += '<div class="qnaAns" id="no'+result[i].aaNo+'">';
 		html += '	<div class="border-bottom m-b-20 p-b-10">';
 		html += '		<h6 class="m-b-15">';
 		if(result[i].adminId) {
 			html += result[i].adminId;
	 		html += '  		<a class="m-l-5 text-info" onclick="qnaAnsUpdate(' +result[i].aaNo+ ',\''  +result[i].adminId+ '\',\'' +result[i].aaDate+ '\')">수정</a>'; // 답변 수정 폼 추가
	 		html += '  		<a class="m-l-5 text-info" onclick="qnaAnsDelete('+result[i].aaNo+')">삭제</a>';
 		} else if(result[i].userId) {
 			html += result[i].userId;
 		}
 		html += '		<span class="float-right f-13 text-muted">'+result[i].aaDate+'</span>';
 		html += '		</h6>';	                                    				                                
 		html += '		<p class="m-t-15 m-b-15 text-muted" style="white-space:pre;">'+result[i].aaContent+'</p> ';
 		
 		
 		html += '		<label data-target="#rplsBy'+result[i].aaNo+'"class="badge badge-light-primary" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" onclick="qnaReplyList('+result[i].aaNo+')">답글</label>';
 		html += '	</div>';
 		html += '	<div class="collapse qnaReplyList" id="rplsBy'+result[i].aaNo+'"></div>'; 
 		html += '</div>';
 	}
 	$("#qnaAnsList").html(html);
 }

// 답변 작성 ajax
$('#ans-btn').on("click", function() {
	var adminId = "${username}";
	var aqNo = "${aqNo}";
	var aaContent = $("#aaContent").val();
	if (aaContent) {
		$.ajax({
			url: '<%=request.getContextPath()%>/admin/qna/insertAns',
			data : {adminId: adminId, aqNo: aqNo, aaContent: aaContent},
			type : "post",
			success : function(result) {
				if (result == "success") {
				$('#aaContent').val('') 
				getAnsList(); 
				answerCount(aqNo);
				}
			},
			error : function() {
				alert("등록 실패")
			}
		})	
	}
	else {
		alert("댓글 내용을 입력하지 않았습니다.");
	}
})
		
// 답변 삭제 ajax
function qnaAnsDelete(aaNo) {
	var aqNo = "${aqNo}";
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			url: '<%=request.getContextPath()%>/admin/qna/deleteAns',
			data : {aaNo: aaNo},
			type : "post",
			success : function(result) {
				if (result == "success") {
					getAnsList();
					answerCount(aqNo);
				}
			},
			error : function() {
				alert("삭제 실패")
			}
		})
	}
}

// 답변 수정 폼 ajax
function qnaAnsUpdate(aaNo, adminId, aaDate) {
	var aaNo = aaNo;
	var adminId = adminId;
	var aaContent = $("#no" + aaNo + " p").text();
	console.log(aaContent);
	var aaDate = aaDate;
	var html='';
	
	html += '<div class="qnaAns m-t-15 m-b-30" id="no'+aaNo+'">';
	html +='	<h6 class="m-b-15">'+adminId;
	html +='		<a class="m-l-5 text-info" onclick="qnaUpdateAns('+aaNo+')">저장</a>';
	html +='		<a class="m-l-5 text-info" onclick="getAnsList()">취소</a>';
	html +='		<span class="float-right f-13 text-muted">'+aaDate+'</span>';
	html +='	</h6>';					                                						                                    				                                
	html +='<textarea class="form-control m-b-20" id="exampleFormControlTextarea1" rows="3" name="aaContent">'+aaContent+'</textarea>';
	
	$('#no' + aaNo).children().first().replaceWith(html);
}

// 답변 수정 내용 저장 ajax
function qnaUpdateAns(aaNo) {
	var aaContent = $('textarea[name=aaContent]').val();
	var aaNo = aaNo;
	if(aaContent){
		$.ajax({
			url: '<%=request.getContextPath()%>/admin/qna/updateAns',
			data : {aaNo: aaNo, aaContent: aaContent},
			type : "post",
			success : function(result) {
				if (result == "success") {
					getAnsList();
				}
			},
			error : function() {
				alert("수정 실패")
			}
		})	
	} else {
		alert("댓글 내용을 입력하지 않았습니다.");
	}
}

// 답글 리스트 ajax
function qnaReplyList(aaNo){
 	var aqNo = "${aqNo}"
 	var aaNo = aaNo;
     $.ajax({
         type:'POST',
         url : '<%=request.getContextPath()%>/admin/qna/qnaReplyList',
         data: {aqNo: aqNo, aaNo: aaNo},
 		success : function(result) {
 				if (result != null) {
 					console.log(result);
 					displayReply(result, aaNo);
 				}
 			},
 		error : function() {
 			alert("서버 요청 실패!")
 		}
         
     });
 }	
function displayReply(result, aaNo){
 	var html = ''; 
 	var aaNo = aaNo;
 	console.log(aaNo);
 	
 	for ( var i in result) {
 		
	html +='   		<div class="border-bottom m-t-15 m-b-20 p-l-20" id="rplNo'+result[i].rplNo+'">';
	html +='			<h6 class="m-b-15">';
	if(result[i].adminId) {
			html += result[i].adminId;
			html += '   			<a class="m-l-5 text-info" onclick="qnaReplyUpdateForm('+ aaNo + ',' + result[i].rplNo+ ',\''  +result[i].adminId+ '\',\'' +result[i].rplContent+'\',\'' +result[i].rplDate+ '\')">수정</a>';
			html += '   			<a class="m-l-5 text-info" class="m-t-5 m-b-20" onclick="qnaReplyDelete('+ aaNo + ',' + result[i].rplNo+')">삭제</a>';
		} else if(result[i].userId) {
			html += result[i].userId;
		}
	html +='				<span class="float-right f-13 text-muted">'+result[i].rplDate+'</span>';
	html +='			</h6>';				    
	html +=' 			<p class="m-t-15 m-b-15 text-muted">'+result[i].rplContent+'</p>';	
	html +='   		</div>';
 	}
	html +='   		<div class="text-right m-b-20">';
	html +='            <textarea class="form-control m-b-20" name="rplContent" rows="3" placeholder="댓글을 입력해보세요."></textarea>';
	html +='            <button type="button" class="btn btn-sm btn-primary" onclick="insertReply('+aaNo+')" >등록</button>';
	html +='        </div>';	
 	$('#no' + aaNo).children().last().html(html);
}

// 답글 등록 ajax
function insertReply(aaNo) {
	var adminId = "${username}"
	var rplContent = $("#no" + aaNo + " [name='rplContent']").val();
	var aaNo = aaNo;
	
	if(rplContent) {
		$.ajax({
	        url : '<%=request.getContextPath()%>/admin/qna/insertReply',
	        data: {adminId: adminId, rplContent: rplContent, aaNo: aaNo},
			type : "post",
			success : function(result) {
					if (result != null) {
						console.log(result);
						qnaReplyList(aaNo);
					}
				},
			error : function() {
				alert("서버 요청 실패!")
			}
		});		
	} else {
		alert("댓글 내용을 입력하지 않았습니다.");
	}
}

// 답글 수정 폼 ajax
function qnaReplyUpdateForm(aaNo, rplNo, adminId, rplContent, rplDate) {
	var html = '';
	var aaNo = aaNo;
	var rplNo = rplNo;
	var adminId = adminId;
	var rplContent = rplContent;
	var rplDate = rplDate;

	html +='   		<div class="m-t-15 m-b-20 p-l-20" id="rplNo'+rplNo+'">';
	html +='			<h6>'+adminId;
	html +='				<a class="m-l-5 text-info" onclick="qnaUpdateReply('+rplNo+')">저장</a>';
	html +='				<a class="m-l-5 text-info" onclick="qnaReplyList('+aaNo+')">취소</a>';
	html +='				<span class="float-right f-13 text-muted">'+rplDate+'</span>';
	html +='			</h6>';				    
	html +='			<textarea class="form-control m-b-20" name="rplContent" rows="3" placeholder="댓글을 입력해보세요.">'+rplContent+'</textarea>';
	html += '           <input type="hidden" name="aaNo" value="'+aaNo+'">';
	html +='   		</div>';
	$('#rplNo' + rplNo).replaceWith(html);
 	}
	
 	
// 답글 수정 내용 저장 ajax
function qnaUpdateReply(rplNo) {
	var rplNo = rplNo;
	var rplContent = $("#rplNo" + rplNo + " [name='rplContent']").val(); 
	var aaNo = $("#rplNo" + rplNo + " [name='aaNo']").val();
	
	if(rplContent) {
		$.ajax({
	        url : '<%=request.getContextPath()%>/admin/qna/updateReply',
	        data: {rplNo: rplNo, rplContent: rplContent, aaNo: aaNo},
			type : "post",
			success : function(result) {
					if (result != null) {
						console.log(result);			
						qnaReplyList(aaNo);
					}
				},
			error : function() {
				alert("서버 요청 실패!")
			}
		});		
	} else {
		alert("댓글 내용을 입력하지 않았습니다.");
	}
}

// 답글 삭제 ajax
function qnaReplyDelete(aaNo, rplNo) {
	var aaNo = aaNo;
	var rplNo = rplNo;
	if(confirm("삭제하시겠습니까?")) {
	$.ajax({
        url : '<%=request.getContextPath()%>/admin/qna/deleteReply',
        data: {rplNo: rplNo, aaNo: aaNo},
		type : "post",
		success : function(result) {
				if (result != null) {
					console.log(result);			
					qnaReplyList(aaNo);
				}
			},
		error : function() {
			alert("서버 요청 실패!")
		}
	});			
	}
}

// 답변수 조회 ajax
function answerCount(aqNo) {
    var aqNo = aqNo;
    var html = '';

    $.ajax({
        url: '<%=request.getContextPath()%>/admin/qna/selectAnswerCount',
        data: {aqNo: aqNo},
        type: "POST",
        success: function(result) {
            html += result;
            $('#answersCount').text(html);
        },
        error: function() {
            alert("답변수 요청 실패!");
        }
    });	
}

// 문의글 삭제 ajax
function deleteQna() {
	
	var aqNo = $('input[name=aqNo]').val();
	console.log(aqNo);
	
	if(confirm("삭제하시겠습니까?")) {
 	 	$.ajax({
	        url : '<%=request.getContextPath()%>/admin/qna/delete',
	        data: {aqNo: aqNo},
			type : "get",
			success : function(result) {
					if (result != null) {
						let url = '<%=request.getContextPath()%>/admin/qna/list';
						alert("삭제되었습니다.")
						location.replace(url);
					}
				},
			error : function() {
				alert("삭제 실패!")
			}
		});		
	}
}
</script>
</html>