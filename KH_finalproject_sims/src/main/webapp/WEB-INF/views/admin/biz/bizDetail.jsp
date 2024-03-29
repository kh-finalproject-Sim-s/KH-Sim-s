<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    	
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.bd-example-row{background-color:#fff !important;}
	.dbtitle{background-color:#1abc9c !important; color:#fff;}
	.dbbody{background-color:#fff !important; border:1px solid #ccc !important;}
</style>
</head>
<body>
<!-- 우편번호 찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
	/* 요금제 정보 호출 ajax */
	function fn_selectPlanAjax(planNo){
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/selectPlanAjax",
			type: "post",
			data: {planNo : planNo},
			dataType: "json",
			success: function(json){
				$("#planName").text(json.planName);
				$("#netName").text(json.netName);
				$("#genName").text(json.genName);
				$("#planPrice").text(json.planPrice);
				$("#planVoice").text(json.planVoice);
				$("#planMessage").text(json.planMessage);
				$("#planData").text(json.planData);
				$("#planVoiceOver").text(json.planVoiceOver);
				$("#planMessageOver").text(json.planMessageOver);
				$("#planDataOver").text(json.planDataOver);
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR);  //응답 메시지
				console.log(textStatus); //"error"로 고정인듯함
				console.log(errorThrown);
			}
		});
	}
	
	/* 홈페이지 인풋박스 클릭 시, 해당 홈페이지로 이동 (수정 페이지에서는 동작 X)  */
	function fn_goToHompage(){
		var bizHp = $("input[name=bizHp]").val();
		window.open(bizHp, '_blank');
	}
	
	/* 우편번호 찾기 */
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;

            }
        }).open();
    }
	


	$(document).ready(function(){
		var msg = '<c:out value="${param.msg}"/>';
		if(msg == "SUCCESS"){
			alert("수정 되었습니다.");
		}
		
		/*지원통신망 입력 값 쪼개기*/
		var network = "${applyDetail.network}";
		var networkArr = network.split(",");
		console.log("networkArr : "+networkArr);
		for(var i = 0; i < networkArr.length; i++){
			var net = networkArr[i];
			switch(net){
			case "SK망" :
				net = "SKT망";
				$("[name=network][value="+net+"]").prop("checked", true);
			case "KT망" :
				$("[name=network][value="+net+"]").prop("checked", true);
			case "SKT망" :
				$("[name=network][value="+net+"]").prop("checked", true);
			case "LG망" :
				$("[name=network][value="+net+"]").prop("checked", true);
				 break;
			 }
		}
		
		/*휴무일 입력 값 쪼개기*/
		var bizClosedDay = "${applyDetail.bizClosedDay}";
		console.log("bizClosedDay : " + bizClosedDay);
		var bizClosedDayArr = bizClosedDay.split(",");
		bizClosedDayArr = bizClosedDayArr.filter(function(item){
			return item !== null && item !== undefined && item !=='';
		})
		var day;
		for(var i = 0; i < bizClosedDayArr.length; i++){
			day = bizClosedDayArr[i];
			$("[name=bizClosedDay][value=" + day + "]").prop("checked", true);
		}
		
		fn_checkNework();
		
		/*전화번호 유효성 검사*/
		$('.phone').on('keyup', function(){
			var phone = $(this).val();
			if(phone.length >12 ){
				phone = phone.substr(0,12);
			}
			phone =
				phone.replace(/[^0-9]/g, '') //숫자 제외 모든 문자 제거
				.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
			$(this).val(phone);
	    });
		
		/*팩스번호 유효성 검사*/
		$('.fax').on('keyup', function(){
			var fax = $(this).val();
			if(fax.length >12 ){
				fax = fax.substr(0,12);
			}
			fax =
				fax.replace(/[^0-9]/g, '') //숫자 제외 모든 문자 제거
				.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
			$(this).val(fax);
	    });
	

		//번호 유효성 검사
		$('.Text' ).on('keyup', function() {
	        var text = $(this).val();
	        if(text.length > 9){
	        	text = text.substr(0,9);
	        }
	        text = 
	        	text.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
	        	  .replace(/^(\d{3,4})(\d{4})$/, `$1-$2`);
	        $(this).val(text);
	      });
	})
	
	
	/*통신망 체크*/
	function fn_checkNework(){
		var checkBoxList = [];
		var checkDeleteBoxList = [];
		var checkBoxKt = $('#checkBoxKt').is(':checked');
		var checkBoxSkt = $('#checkBoxSkt').is(':checked');
		var checkBoxLg = $('#checkBoxLg').is(':checked');
		
		
		if(checkBoxKt) {
			checkBoxList.push("1");
		} else {
			checkDeleteBoxList.push("1");
		}
		if(checkBoxSkt){
			checkBoxList.push("2");
		} else {
			checkDeleteBoxList.push("2");
		}
		if(checkBoxLg) {
			checkBoxList.push("3");
		} else {
			checkDeleteBoxList.push("3");
		}
		
		checkBoxList = checkBoxList.filter(function(item){
			return item !== null && item !== undefined && item !=='';
		})
		checkDeleteBoxList = checkDeleteBoxList.filter(function(item){
			return item !== null && item !== undefined && item !=='';
		})
		if(checkBoxList.length > 0){
			$("#netNoCheck").val(checkBoxList);
		}
		if(checkDeleteBoxList.length > 0){
			$("#netNoDeleteCheck").val(checkDeleteBoxList);
		}
	}
	
	
	
</script>
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
												<h5 class="m-b-10">통신사 관리
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/applyList"><i class="breadcrumb-item"></i>통신사 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>통신사 
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 관리 상세</c:when>
														<c:otherwise> 정보 수정</c:otherwise>
													</c:choose>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/admin/saveBizModify" method="post" onsubmit="return confirm('저장 하시겠습니까?');" enctype="multipart/form-data">
							    <input type="hidden" name="netNoCheck" id="netNoCheck" value=""/>
							    <input type="hidden" name="netNoDeleteCheck" id="netNoDeleteCheck" value=""/>
							    <input type="hidden" name="originalFilename" value="${applyDetail.originalFilename }">
								<input type="hidden" name="logoRenameFilename" value="${applyDetail.logoRenameFilename }">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<c:choose>
											<c:when test="${cmd eq 'read'}">
												<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/applyList'" value="목록">
											</c:when>
											<c:otherwise>
												<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/applyDetail/${applyDetail.bizId}?divCheck=detail'" value="취소">
											</c:otherwise>
										</c:choose>
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/withdrawalDetail/${applyDetail.bizId}'" value="탈퇴">
											<c:choose>
												<c:when test="${cmd eq 'read' }">
													<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/selectBizModify/${applyDetail.bizId}'" value="수정">
												</c:when>
												<c:otherwise>
													<input class="btn btn-primary right" type="submit" value="저장">
												</c:otherwise>
											</c:choose>
										<%-- <input type="hidden" value="${applyDetail.bizId }" name="bizId"> --%>
									</div>
								</div>
							    <div class="col-sm-12">
	                				<div class="card">
	                    				<div class="card-header">
	                        				<h5>통신사 정보</h5>
	                    				</div>
	                    				<div class="card-body">
	                    					<!-- 로고있어야하넹 로고자리입니다-->
	                    					<%-- <img src="${path}${imagePath}" style="width:200px;height:60px;" alt="이미지" onerror="this.style.display='none'"/> --%>
		                                    <div class="form-group row">
			                                    <c:choose>
			                                    	<c:when test="${cmd eq 'read'}">
			                                    		<img src="${path}${imagePath}" style="width:200px;height:60px;margin-left:30px;" alt="이미지" onerror="this.style.display='none'"/>
			                                    		<%-- <img src="${path}${imagePath}" style="width:200px;height:60px;" alt="이미지" onerror="this.style.display='none'"/> --%>
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		<label for="Logo_Rename_FileName" class="col-sm-2 col-form-label text-center">통신사 로고</label>
			                                    		<div class="input-group cust-file-button col-sm-4">
			                                    			<div class="custom-file">
			                                    				<input type="file" class="custom-file-input" id="inputGroupFile04" name="logo" multiple="multiple"<%-- value="${applyDetail.logoRenameFilename } --%>>
			                                    				<label class="custom-file-label" for="inputGroupFile04">
			                                    					파일을 선택해주세요
			                                    				</label>
			                                    			</div>
			                                    		</div>
			                                   		</c:otherwise>
			                                    </c:choose>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizName" class="col-sm-2 col-form-label text-center">법인명</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control"  name="bizName" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizName}">
		                                        </div>
		                                        <label for="bizOwnerName" class="col-sm-2 col-form-label text-center">대표자명</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control"  name="bizOwnerName" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizOwnerName}">
		                                        </div>
		                                    </div>
		                           			 <div class="form-group row">
		                           			 	<label for="bizSsn" class="col-sm-2 col-form-label text-center">법인 등록번호</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control"  name="bizSsn" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizSsn}">
		                                        </div>
		                                        <label for="bizCrn" class="col-sm-2 col-form-label text-center">사업자 등록번호</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control"  name="bizCrn" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizCrn}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizPhone" class="col-sm-2 col-form-label text-center">전화</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control phone"  name="bizPhone" id="bizPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizPhone}">
		                                        </div>
		                                        <label for="bizFax" class="col-sm-2 col-form-label text-center">팩스 </label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control fax"  name="bizFax"  <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizFax}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                    	 <label for="bizEmail" class="col-sm-2 col-form-label text-center">이메일</label>
		                                        <div class="col-sm-4">
		                                            <input type="email" class="form-control"  name="bizEmail" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizEmail}">
		                                        </div>
		                                        <label for="bizHp" class="col-sm-2 col-form-label text-center">홈페이지</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control"  name="bizHp" <c:if test="${cmd eq 'read' }">readonly onclick="javascript:fn_goToHompage();"</c:if> value="${applyDetail.bizHp}">
		                                            <%-- <a href="${applyDetail.bizHp }">${applyDetail.bizHp }</a> --%>
		                                        </div>
		                                    </div>
		                           			 <div class="form-group row">
		                                        <label for="phoneOpTime" class="col-sm-2 col-form-label text-center">개통 소요시간</label>
		                                        <c:choose>
		                                        	<c:when test="${cmd eq 'read'}">
		                                        		<div class="col-sm-4">
		                                        			<input type="text" class="form-control" name="phoneOpTime"<c:if test="${cmd eq 'read'}">readonly</c:if> value="평균${applyDetail.phoneOpTime}일">
		                                        		</div>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<div class="col-sm-4">
			                                        		<select class="custom-select col-sm-5" id="inputGroupSelectPot" name="phoneOpTime">
			                                        			<c:forEach var="Pot" begin="0" end="150" step="1">
			                                        				<c:choose>
							  											<c:when test="${applyDetail.phoneOpTime eq (Pot/10.0)}">
								    										<option value="${Pot/10.0}" selected>${Pot/10.0}</option>
							  											</c:when>
							  											<c:otherwise>
								    										<option value="${Pot/10.0}">${Pot/10.0}</option>
							  											</c:otherwise>
						  											</c:choose>
			                                        			</c:forEach>
			                                        		</select>
		                                        		</div>
		                                        	</c:otherwise>
		                                        </c:choose>
		                                         <label for="phoneOpTimeUsim" class="col-sm-2 col-form-label text-center">유심보유시</label>
		                                         <c:choose>
		                                        	<c:when test="${cmd eq 'read'}">
		                                        		<div class="col-sm-4">
		                                        			<input type="text" class="form-control" name="phoneOpTimeUsim"<c:if test="${cmd eq 'read'}">readonly</c:if> value="평균${applyDetail.phoneOpTimeUsim}일">
		                                        		</div>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<div class="col-sm-4">
		                                        			<select class="custom-select col-sm-5" id="inputGroupSelectPotUsim" name="phoneOpTimeUsim">
			                                        			<c:forEach var="PotUsim" begin="0" end="150" step="1">
			                                        				<c:choose>
							  											<c:when test="${applyDetail.phoneOpTimeUsim eq (PotUsim/10.0)}">
								    										<option value="${PotUsim/10.0}" selected>${PotUsim/10.0}</option>
							  											</c:when>
							  											<c:otherwise>
								    										<option value="${PotUsim/10.0}">${PotUsim/10.0}</option>
							  											</c:otherwise>
						  											</c:choose>
			                                        			</c:forEach>
		                                        			</select>
		                                        		</div>
		                                        	</c:otherwise>
		                                        </c:choose>
		                                    </div>
		                           			 <div class="form-group row">
		                                        <label for="bizCardPayDate" class="col-sm-2 col-form-label text-center">카드 결제일</label>
			                                        <div class="col-sm-4">
				                                        <c:choose>
				                                        	<c:when test="${cmd eq 'read'}">
				                                        		<input type="text" class="form-control" name="bizCardPayDate" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizCardPayDate}일">
				                                        	</c:when>
				                                        	<c:otherwise>
				                                        		<select class="custom-select col-sm-5" id="inputGroupSelectCardDate" name="bizCardPayDate">
				                                        			<c:forEach var="date" begin="1" end="31" step="1">
				                                        				<option value="${date }" ${applyDetail.bizCardPayDate eq date ? "selected" : "" }>${date}</option>
				                                        			</c:forEach>
				                                        		</select>	
				                                        	</c:otherwise>
				                                        </c:choose>
			                                        </div>
		                                         <label for="bizAccPayDate" class="col-sm-2 col-form-label text-center">계좌이체 결제일</label>
		                                         <div class="col-sm-4" >
		                                         <c:choose>
		                                         	<c:when test="${cmd eq 'read'}">
		                                         		<input type="text" class="form-control" name="bizAccPayDate" <c:if test="${cmd eq 'read'}">readonly</c:if> value="${applyDetail.bizAccPayDate}일">
		                                         	</c:when>
		                                         	<c:otherwise>
		                                         		<select class="custom-select col-sm-5" id="inputGroupSelectCardDate" name="bizAccPayDate">
		                                         			<c:forEach var="date" begin="1" end="31" step="1">
				                                        		<option value="${date }" ${applyDetail.bizCardPayDate eq date ? "selected" : "" }>${date}</option>
				                                        	</c:forEach>
		                                         		</select>
		                                         	</c:otherwise>
		                                         </c:choose>
		                                         </div>
		                                    </div>
		                           			 <div class="form-group row">
		                                         <label for="bizTime" class="col-sm-2 col-form-label text-center">영업 시간</label>
		                                         <c:choose>
		                                         	<c:when test="${cmd eq 'read'}">
		                                         		<div class="col-sm-4">
		                                         			<input type="text" class="form-control" name="bizTime" <c:if test="${cmd eq 'read'}">readonly</c:if> value="${applyDetail.bizBeginTime} ~ ${applyDetail.bizEndTime}">
		                                         		</div>
		                                         	</c:when>
		                                         	<c:otherwise>
		                                         		<div class="col-sm-4">
		                                         			<select class="custom-select col-sm-3" id="inputGroupSelect04" name="bizBeginTime">
		                                         				<c:forEach var="hour" begin="0" end="23">
		                                         					<c:forEach var="minute" begin="0" end="30" step="30">
		                                         						<c:set var="time" value="${hour}:${minute == 0? '00' :'30'}"/>
		                                         						<c:set var="beginTime" value="${applyDetail.bizBeginTime}"/>
		                                         						<c:choose>
		                                         							<c:when test="${time eq beginTime}">
		                                         								<option value="${time}" selected>${time}</option>
		                                         							</c:when>
		                                         							<c:otherwise>
		                                         								<option value="${time}">${time}</option>
		                                         							</c:otherwise>	
		                                         						</c:choose>
		                                         					</c:forEach>	
		                                         				</c:forEach>
		                                         			</select>
		                                         			~
		                                         			<select class="custom-select col-sm-3" id="inputGroupSelect05" name="bizEndTime">
		                                         				<c:forEach var="hour" begin="0" end="23">
		                                         					<c:forEach var="minute" begin="0" end="30" step="30">
		                                         						<c:set var="time" value="${hour}:${minute == 0? '00' :'30'}"/>
		                                         						<c:set var="endTime" value="${applyDetail.bizEndTime}"/>
		                                         						<c:choose>
		                                         							<c:when test="${time eq endTime}">
		                                         								<option value="${time}" selected>${time}</option>
		                                         							</c:when>
		                                         							<c:otherwise>
		                                         								<option value="${time}">${time}</option>
		                                         							</c:otherwise>	
		                                         						</c:choose>
		                                         					</c:forEach>	
		                                         				</c:forEach>
		                                         			</select>
		                                         		</div>
		                                         	</c:otherwise>
		                                         </c:choose>
		                                         <label for="bizClosedDay" class="col-sm-2 col-form-label text-center">휴무일</label>
		                                        	<c:choose>
		                                        	<c:when test="${cmd eq 'read'}">
		                                        		<div class="col-sm-4">
		                                            	<input type="text" class="form-control"  name="bizClosedDay" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizClosedDay}">
		                                        		</div>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation11" name="bizClosedDay" value="월">
                                							<label class="custom-control-label" for="customControlValidation11" style="margin-right:10px; margin-top:10px;">월</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation12" name="bizClosedDay" value="화">
		                                         			<label class="custom-control-label" for="customControlValidation12" style="margin-right:10px; margin-top:10px;">화</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation13" name="bizClosedDay" value="수">
		                                         			<label class="custom-control-label" for="customControlValidation13" style="margin-right:10px; margin-top:10px;">수</label>
		                                        		</div>
		                                        		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation14" name="bizClosedDay" value="목">
                                							<label class="custom-control-label" for="customControlValidation14" style="margin-right:10px; margin-top:10px;">목</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation15" name="bizClosedDay" value="금">
		                                         			<label class="custom-control-label" for="customControlValidation15" style="margin-right:10px; margin-top:10px;">금</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation16" name="bizClosedDay" value="토">
		                                         			<label class="custom-control-label" for="customControlValidation16" style="margin-right:10px; margin-top:10px;">토</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation17" name="bizClosedDay" value="일">
		                                         			<label class="custom-control-label" for="customControlValidation17" style="margin-right:10px; margin-top:10px;">일</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-2">
		                                         			<input type="checkbox" class="custom-control-input" id="customControlValidation18" name="bizClosedDay" value="공휴일">
		                                         			<label class="custom-control-label" for="customControlValidation18" style="margin-right:10px; margin-top:10px;">공휴일</label>
		                                        		</div>
		                                        	</c:otherwise>
		                                        </c:choose>
		                                     </div>
		                                     <div class="form-group row">
		                                        <label for="netService" class="col-sm-2 col-form-label text-center">고객센터 번호</label>
		                                        <c:choose>
		                                        	<c:when test="${cmd eq 'read' }">
		                                        		<c:set var="netService" value=""/>
		                                        		<c:if test="${not empty applyDetail.ktNetService }">
		                                        			<c:set var="netService" value="KT : ${applyDetail.ktNetService} / "/>
		                                        		</c:if>
		                                        		<c:if test="${not empty applyDetail.sktNetService }">
		                                        			<c:set var="netService" value="${netService} SKT : ${applyDetail.sktNetService} / "/>
		                                        		</c:if>
		                                        		<c:if test="${not empty applyDetail.lgNetService }">
		                                        			<c:set var="netService" value="${netService} LG : ${applyDetail.lgNetService}"/>
		                                        		</c:if>
		                                        		<div class="col-sm-4">
		                                            		<input type="text" class="form-control"  name="netService"  style="margin-bottom:10px;"  <c:if test="${cmd eq 'read' }">readonly</c:if> value="${netService}">
		                                        		</div>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<div class="col-sm-4">
						                                    <div class="form-group">
						                                        <label class="floating-label" for="Text">KT</label>
						                                        <input type="text" class="form-control Text" name="ktNetService"  style="margin-bottom:10px;"  <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.ktNetService}">
						                                        <label class="floating-label" for="Text">SKT</label>
						                                        <input type="text" class="form-control Text" name="sktNetService"  style="margin-bottom:10px;"  <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.sktNetService}">
						                                        <label class="floating-label" for="Text">LG</label>
						                                        <input type="text" class="form-control Text" name="lgNetService"   style="margin-bottom:10px;" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.lgNetService}">
						                                    </div>
						                                </div>
		                                        	</c:otherwise>
		                                        </c:choose>
		                                     </div>   
		                                    <div class="form-group row">
		                                        <label for="bizId" class="col-sm-2 col-form-label text-center">아이디</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control"  name="bizId" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizId}">
		                                        </div>
		                                        <label for="network" class="col-sm-2 col-form-label text-center">지원통신망</label>
		                                        <c:choose>
		                                         	<c:when test="${cmd eq 'read'}">
		                                         		<div class="col-sm-4">
		                                            	<input type="text" class="form-control"  name="network" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.network}">
		                                        		</div>
		                                         	</c:when>
		                                         	<c:otherwise>
		                                         		<div class="custom-control custom-checkbox mb-3">
		                                         			<input type="checkbox" class="custom-control-input" id="checkBoxKt" name="network" value="KT망" onchange="fn_checkNework();">
                                							<label class="custom-control-label" for="checkBoxKt" style="margin-right:10px; margin-top:10px;">KT망</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-3">
		                                         			<input type="checkbox" class="custom-control-input" id="checkBoxSkt" name="network" value="SKT망" onchange="fn_checkNework();">
		                                         			<label class="custom-control-label" for="checkBoxSkt" style="margin-right:10px; margin-top:10px;">SKT망</label>
		                                        		</div>
		                                         		<div class="custom-control custom-checkbox mb-3">
		                                         			<input type="checkbox" class="custom-control-input" id="checkBoxLg" name="network" value="LG망" onchange="fn_checkNework();">
		                                         			<label class="custom-control-label" for="checkBoxLg" style="margin-right:10px; margin-top:10px;">LGU+망</label>
		                                        		</div>
		                                         	</c:otherwise>
		                                         </c:choose>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizZipCode" class="col-sm-2 col-form-label text-center">우편번호</label>
		                                        <c:choose>
		                                        	<c:when test="${cmd eq 'read' }">
		                                        		<div class="col-sm-4">
		                                        		    <c:choose>
		                                        		        <c:when test="${empty applyDetail.bizZipCode }">
		                                        			        <input type="text" class="form-control"  name="bizZipCode" readonly value="">
		                                        				</c:when>
		                                        				<c:otherwise>
		                                        				    <input type="text" class="form-control"  name="bizZipCode" readonly value="${applyDetail.bizZipCode}">
		                                        				</c:otherwise>
		                                        		    </c:choose>
				                                        </div>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<div class="col-sm-2">
		                                            		<input type="text" class="form-control"  id="postcode" name="bizZipCode" readonly value="${applyDetail.bizZipCode}">
		                                        		</div>
		                                        		<div class="col-sm-2">
		                                            		<input class="btn btn-primary right" type="button" onclick="execDaumPostcode()" value="우편번호찾기">
		                                        		</div>
		                                        	</c:otherwise>
		                                        </c:choose>
		                                        <label for="bizLocation" class="col-sm-2 col-form-label text-center">주소</label>
		                                        <div class="col-sm-4">
		                                            <input type="text" class="form-control" id="roadAddress"  name="bizLocation" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizLocation}">
		                                        </div>
		                                    </div>
		                                    <div class="card">
											<div class="card-body table-border-style">
												<div class="table-responsive">
													<table class="table table-hover">
														<thead>
															<tr>
																<th>번호</th>
																<th>요금제명</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${empty requestScope.paging.page}">
			            										<tr>
			            											<td colspan="10" class="text-center">등록된 요금제가 없습니다.</td>
			            										</tr>
			            									</c:if>
			            									<c:if test="${not empty requestScope.paging.page}">
																<c:forEach var="list" items="${requestScope.paging.page}" varStatus="status">
																	<tr>
																		<td>${paging.totalRowCount - (paging.currentPage-1) * paging.pageLimit - status.index}</td>
																		<td><a href="#" onclick="fn_selectPlanAjax('${list.planNo}');" data-toggle="modal" data-target="#gridSystemModal">${list.planName}</a></td>
																	</tr>
																</c:forEach>
															</c:if>	
															</tbody>
														</table>
													</div>
													<nav aria-label="Page navigation example">
													<c:if test="${not empty requestScope.paging.page}">	
														<ul class="pagination justify-content-center">
															<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
															<c:choose>
																<c:when test="${requestScope.paging.prevPage eq -1 }">
																	<li class="page-item disabled"><a class="page-link">prev</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																	 href="${path}/admin/applyDetail/${applyDetail.bizId}?divCheck=${divCheck}&p=${requestScope.paging.prevPage }&searchOption=${searchOption }&searchBox=${searchBox}&searchRadioVal=${searchRadioVal}">prev</a></li>
																</c:otherwise>
															</c:choose>
															<c:forEach var="pNum" items="${requestScope.paging.pageList }">
																<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" 
																href="${path}/admin/applyDetail/${applyDetail.bizId}?divCheck=${divCheck}&p=${pNum }&searchOption=${searchOption }&searchBox=${searchBox}&searchRadioVal=${searchRadioVal}">${pNum }</a></li>
															</c:forEach>
															<c:choose>
																<c:when test="${requestScope.paging.nextPage eq -1 }">
																	<li class="page-item disabled"><a class="page-link">next</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																	 href="${path}/admin/applyDetail/${applyDetail.bizId}?divCheck=${divCheck}p=${requestScope.paging.nextPage }&searchOption=${searchOption }&searchBox=${searchBox}&searchRadioVal=${searchRadioVal}">next</a></li>
																</c:otherwise>
															</c:choose>
														</ul>
													</c:if>
												</nav>
											</div>
										</div>
	                            		</div>	
									</div>
								</div>
							</form>
				    	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="col-xl-4 col-md-6">
	<!-- <div class="card">
		<div class="card-header">
			<h5>Using the Grid</h5>
		</div> -->
		<div class="card-body">
			<div id="gridSystemModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="gridModalLabel"><span id="planName"></span></h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<div class="container-fluid bd-example-row">
								<div class="row">
									<div class="col-md-5 dbtitle">통신망</div>
									<div class="col-md-7 dbbody"><span id="netName"></span></div>
									<!-- <div class="col-md-4">.col-md-4</div>
									<div class="col-md-4 ml-auto">.col-md-4 .ml-auto</div> -->
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">통신세대</div>
									<div class="col-md-7 dbbody"><span id="genName"></span></div>
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">기본료(원)</div>
									<div class="col-md-7 dbbody"><span id="planPrice"></span></div>
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">기본음성(분)</div>
									<div class="col-md-7 dbbody"><span id="planVoice"></span></div>
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">기본문자(건)</div>
									<div class="col-md-7 dbbody"><span id="planMessage"></span></div>
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">기본데이터(mb)</div>
									<div class="col-md-7 dbbody"><span id="planData"></span></div>
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">초과음성단가(초)</div>
									<div class="col-md-7 dbbody"><span id="planVoiceOver"></span></div>
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">초과문자단가(건)</div>
									<div class="col-md-7 dbbody"><span id="planMessageOver"></span></div>
								</div>
								<div class="row">
									<div class="col-md-5 dbtitle">초과데이터단가(mb)</div>
									<div class="col-md-7 dbbody"><span id="planDataOver"></span></div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn  btn-secondary" data-dismiss="modal">닫기</button>
							<!-- <button type="button" class="btn  btn-primary">Save changes</button> -->
						</div>
					</div>
				</div>
			</div>
			<!-- <button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#gridSystemModal">Launch demo modal</button>
		</div> -->
	</div>
</div>
		
<jsp:include page="../include/footer.jsp" />

</body>
</html>