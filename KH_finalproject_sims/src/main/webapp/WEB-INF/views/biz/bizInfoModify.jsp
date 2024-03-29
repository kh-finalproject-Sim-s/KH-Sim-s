<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
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

<title>${bizinfo.bizName } | 내 정보 수정하기</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="stylesheet" href="${path}/resources/css/biz/bizModify.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
   
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>


<div class="container" style="display:flex; margin:-103px 0 -200px 0; padding:150px 0 380px 0;">


	<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
	
	<div class="content">
		<div class="container" style="margin-left: -107px; margin-bottom: 5%;">
			<h2 class="tit">통신사 정보 수정하기</h2>
			<hr class="line">
		</div>
	
		<form action="modifyInfo " method="post" enctype="multipart/form-data" id="modifyForm" class="needs-validation" novalidate
				style="width: 122%;">
				
				<p class="inpt-text">(*)표시는 필수 입력사항입니다.</p>
				<div class="d-flex">
					<div class="division-box">
						<span>기본정보</span>
					</div>
					<hr>
				</div>
			
				<table class="table">
					<tbody>
						<tr>
							<th scope="row" class="required">
							    <span>법인명</span>
							</th>
							<td><input type="text" class="form-control" name="bizName" value="${bizinfo.bizName }" required>
							<div class="invalid-feedback">
						        필수 입력값입니다.
					        </div>
							</td>
							<th scope="row" class="required">
								<span>대표자명</span>
							</th>
							<td><input type="text" class="form-control" name="bizOwnerName"  value="${bizinfo.bizOwnerName } "required>
							<div class="invalid-feedback">
						        필수 입력값입니다.
					        </div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="required">
								<span>사업자등록번호</span>
							</th>
							<td><input type="text" class="form-control" name="bizCrn" value="${bizinfo.bizCrn }" 
								placeholder="'-'을 제외한 10자리 숫자만 입력해주세요."
								maxlength="11" onkeyup="autoHyphenCrn(this)" required >
							<div class="invalid-feedback">
						        필수 입력값입니다.
					        </div>
							</td>
							<th scope="row" class="required">
								<span>법인등록번호</span>
							</th>
							<td><input type="text" class="form-control" name="bizSsn" value="${bizinfo.bizSsn }"
								 placeholder="'-'을 제외한 13자리 숫자만 입력해주세요."
								 maxlength="14" onkeyup="autoHyphenSsn(this)" required>
							<div class="invalid-feedback">
						        필수 입력값입니다.
					        </div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="required">
								<span>회사주소</span>
							</th>
							<td colspan="3"> 
							<div class="d-flex" style="margin-bottom: 1%;">
								<input type="text" class="form-control" style="width: 20%;margin-right: 14%;" id="postcode" name="bizZipCode" 
								placeholder="우편번호" value="${bizinfo.bizZipCode }" pattern="[0-9]*" oninput="checkInputNum(event)" required >
								<input type="button"  onclick="execDaumPostcode()" value="우편번호 찾기" class="btn"><br>
							</div>
							<div class="invalid-feedback">
						        필수 입력값입니다.
					        </div>
							<span id="error-message-num" style="display:none;">숫자만 입력 가능합니다.</span>
							
							<input type="text" class="form-control" id="roadAddress" name="bizLocation" placeholder="도로명주소"  value="${bizinfo.bizLocation }" required>
							<div class="invalid-feedback">
						        필수 입력값입니다.
					        </div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<span>연락처</span>
							</th>
							<td><input type="text" class="form-control" name="bizPhone" value="${bizinfo.bizPhone }" pattern="[0-9\-]*" oninput="checkInput(event)">
								<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
								</td>
							<th scope="row">
								<span>팩스</span>
							</th>
							<td><input type="text" class="form-control" name="bizFax" value="${bizinfo.bizFax }" pattern="[0-9\-]*" oninput="checkInput(event)">
								<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<span>이메일</span>
							</th>
							<td><input type="email" class="form-control"  name="bizEmail" value="${bizinfo.bizEmail }"></td>
							<th scope="row">
								<span>홈페이지</span>
							</th>
							<td ><input type="text" class="form-control" name="bizHp" value="${bizinfo.bizHp }"></td>
						</tr>
					</tbody>
				</table>
			
				
				
				<div class="d-flex" style="margin-top:4%;">
					<div class="division-box" >
						<span>상세정보</span>
					</div>
					<hr>
				</div>
				
				<table class="table" style="margin-top:2%;">
					<tr>
						<th scope="row" class="col-md-2">
							<span>개통 소요시간</span>
						</th>
						<td class="col-md-4"> 
						평균 <select name="phoneOpTime" class="form-select">
						  <c:forEach var="i" begin="0" end="150" step="1">
						  	<c:choose>
						  		<c:when test="${bizinfo.phoneOpTime eq (i/10.0)}">
							    <option value="${i/10.0}" selected>${i/10.0}</option>
						  		</c:when>
						  		<c:otherwise>
							    <option value="${i/10.0}">${i/10.0}</option>
						  		</c:otherwise>
						  	</c:choose>
						  </c:forEach>
						</select>일
						</td>
						<th scope="row" class="col-md-2">
							<span>개통 소요시간 <br>(유심보유시)</span>
						</th>
						<td class="col-md-4">
						평균 <select name="phoneOpTimeUsim" class="form-select">
							  <c:forEach var="i" begin="0" end="150" step="1">
							  	<c:choose>
							  		<c:when test="${bizinfo.phoneOpTimeUsim eq (i/10.0)}">
								    <option value="${i/10.0}" selected>${i/10.0}</option>
							  		</c:when>
							  		<c:otherwise>
								    <option value="${i/10.0}">${i/10.0}</option>
							  		</c:otherwise>
							  	</c:choose>
							  </c:forEach>
							</select>일
						</td>
					</tr>
					
					<tr>
						<th scope="row">
							<span>카드 결제일</span>
						</th>
						<td>
						<select name="bizCardPayDate" class="form-select">
							<c:forEach var="date" begin="1" end="31" step="1">
								<option value="${date }" ${bizinfo.bizCardPayDate eq date ? "selected" : "" }>${date}</option>
							</c:forEach>
						</select>일
						</td>
						<th scope="row">
							<span>계좌이체 결제일</span>
						</th>
						<td>
						<select name="bizAccPayDate" class="form-select">
							<c:forEach var="date" begin="1" end="31" step="1">
								<option value="${date }" ${bizinfo.bizAccPayDate eq date ? "selected" : "" }>${date}</option>
							</c:forEach>
						</select>일
						</td>
					</tr>
			
					
					<tr >
						<th scope="row">
							<span>영업시간</span>
						</th>
						<td >
							<select name="bizBeginTime" class="form-select">
								<c:forEach var="hour" begin="0" end="23">
								  <c:forEach var="minute" begin="0" end="30" step="30">
								    <c:set var="time" value="${hour}:${minute == 0 ? '00' : '30'}" />
								    <c:set var="beginTime" value="${bizinfo.bizBeginTime }" />
								    <c:choose>
								    <c:when test="${beginTime eq time}">
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
							
							<select name="bizEndTime" class="form-select">
								<c:forEach var="hour" begin="0" end="23">
								  <c:forEach var="minute" begin="0" end="30" step="30">
								    <c:set var="time" value="${hour}:${minute == 0 ? '00' : '30'}" />
								    <c:set var="endTime" value="${bizinfo.bizEndTime }" />
								    <c:choose>
								    <c:when test="${endTime eq time}">
								    <option value="${time}" selected>${time}</option>
								    </c:when>
								    <c:otherwise>
								    <option value="${time}">${time}</option>
								    </c:otherwise>
								    </c:choose>
								  </c:forEach>
								</c:forEach>
							</select>  
						</td>
						<th scope="row">
							<span>휴무일</span>
						</th>
						<td colspan="4" style="display: flex; height: 61px;">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="월">월
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="화">화
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="수">수
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="목">목
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="금">금
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="토">토
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="일">일
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="weekday" value="공휴일">공휴일
							</div>
						</td>
					</tr>
			
					<tr class="col-md-8">
						<th scope="row">
							<span>지원통신망</span>
						</th>
						<td colspan="4" style="display: flex; height: 47px; width: 258%;">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="net" value="KT망" >KT망
						</div>
				        <div class="form-check">
				        	<input class="form-check-input" type="checkbox" name="net" value="LG망" >LGU+망
				        </div>	
						<div class="form-check">
				        	<input class="form-check-input" type="checkbox" name="net" value="SKT망" >SKT망
				        </div>
						</td>
					</tr>
			
			
					<c:forEach var="service" items="${serviceList}">
						<tr class="col-md-8">
							<th scope="row">
								<span>고객센터번호</span>
							</th>
							<td colspan="4">
								<c:choose>
									<c:when test="${empty serviceList[0]}">
										<span>KT</span>
										<input class="form-control" type="text" name="KtService" pattern="[0-9\-]*" oninput="checkInput(event)" >
										<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										<span>SKT</span>
										<input class="form-control" type="text" name="SktService" pattern="[0-9\-]*" oninput="checkInput(event)">
										<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										<span>LGU+</span>
										<input class="form-control" type="text" name="LguService" pattern="[0-9\-]*" oninput="checkInput(event)">
										<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
									</c:when>
									<c:when test="${service.netNo == 1}">
										<span style="display: none">KT</span>
										<c:if test="${not empty service.bizNetService}">
											<input class="form-control" style="display: none" type="text" name="KtService" value="${service.bizNetService}" pattern="[0-9\-]*" oninput="checkInput(event)">
											<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										</c:if>
										<c:if test="${empty service.bizNetService}">
											<input class="form-control" style="display: none" type="text" name="KtService"  pattern="[0-9\-]*" oninput="checkInput(event)" >
											<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										</c:if>
									</c:when>
									<c:when test="${service.netNo == 2}">
										<span style="display: none">SKT</span>
										<c:if test="${not empty service.bizNetService}">
											<input class="form-control" style="display: none" type="text" name="SktService" value="${service.bizNetService}" pattern="[0-9\-]*" oninput="checkInput(event)">
											<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										</c:if>
										<c:if test="${empty service.bizNetService}">
											<input class="form-control" style="display: none" type="text" name="SktService" pattern="[0-9\-]*" oninput="checkInput(event)">
											<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										</c:if>
									</c:when>
									<c:when test="${service.netNo == 3}">
										<span style="display: none">LGU+</span>
										<c:if test="${not empty service.bizNetService}">
											<input class="form-control" style="display: none" type="text" name="LguService" value="${service.bizNetService}" pattern="[0-9\-]*" oninput="checkInput(event)">
											<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										</c:if>
										<c:if test="${empty service.bizNetService}">
											<input class="form-control" style="display: none" type="text" name="LguService" pattern="[0-9\-]*" oninput="checkInput(event)">
											<span class="error-message" style="display:none;">숫자와 하이픈(-)만 입력 가능합니다.</span>
										</c:if>
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				
				</table>
					
			
				
				<div>
					<label class="file-label">로고이미지 첨부</label>
					
					<input type="file" name="logo" placeholder="첨부파일" multiple="multiple" onchange="readURL(this);" >
					<input type="hidden" name="originalFilename" value="${bizinfo.originalFilename }">
					<input type="hidden" name="logoRenameFilename" value="${bizinfo.logoRenameFilename }">
					<!-- 미리보기 -->
					<img id="preview" />
					
				</div>
		       
		       <div class="btnGroup">
		        <button type="button" onclick="goBack()" class="btn">뒤로 가기</button>
		        <button type="submit" class="btn">등록</button>
		       </div>
		    </form>
	    
	 </div>
	    
</div>

<script>
	function goBack() {
	  window.history.back();
	}
</script>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
  

<!-- 우편번호 찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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

                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                }   else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<!-- 지원통신망 체크에 따라 고객센터번호 칸 출력 -->
<script>
$(document).ready(function() {
   // 첫 번째 체크박스 초기화
    if ($('input[type="checkbox"][name="net"][value="KT망"]').is(':checked')) {
        $('span:contains("KT"):first').show();
        $('input[type="text"][name="KtService"]').show();
    }

    // 두 번째 체크박스 초기화
    if ($('input[type="checkbox"][name="net"][value="SKT망"]').is(':checked')) {
        $('span:contains("SKT")').show();
        $('input[type="text"][name="SktService"]').show();
    }

    // 세 번째 체크박스 초기화
    if ($('input[type="checkbox"][name="net"][value="LG망"]').is(':checked')) {
        $('span:contains("LGU+")').show();
        $('input[type="text"][name="LguService"]').show();
    }

    // 체크박스 클릭 이벤트 처리
    $('input[type="checkbox"][name="net"][value="KT망"]').click(function() {
        if($(this).is(':checked')) {
            $('span:contains("KT"):first').show();
            $('input[type="text"][name="KtService"]').show();
        } else {
            $('span:contains("KT"):first').hide();
            $('input[type="text"][name="KtService"]').val(''); // 입력값을 빈 문자열로 초기화
            $('input[type="text"][name="KtService"]').hide();

        }
    });

    $('input[type="checkbox"][name="net"][value="SKT망"]').click(function() {
        if($(this).is(':checked')) {
            $('span:contains("SKT")').show();
            $('input[type="text"][name="SktService"]').show();
        } else {
            $('span:contains("SKT")').hide();
            $('input[type="text"][name="SktService"]').val(''); // 입력값을 빈 문자열로 초기화
            $('input[type="text"][name="SktService"]').hide();

        }
    });

    $('input[type="checkbox"][name="net"][value="LG망"]').click(function() {
        if($(this).is(':checked')) {
            $('span:contains("LGU+")').show();
            $('input[type="text"][name="LguService"]').show();
        } else {
            $('span:contains("LGU+")').hide();
            $('input[type="text"][name="LguService"]').val(''); // 입력값을 빈 문자열로 초기화
            $('input[type="text"][name="LguService"]').hide();

        }
    });
});


</script>



<!-- (지원통신망) 선택한 값들 한 문자열로 쪼개기  -->
<script>
	var network = "${bizinfo.network}";
	console.log("network : "+network);
	var networkArr = network.split(",");
	console.log("networkArr : "+networkArr);
	for(var i = 0; i < networkArr.length; i++){
		var net = networkArr[i];
		switch(net){
		case "KT망" :
		case "SKT망" :
		case "LG망" :
			$("[name=net][value="+net+"]").prop("checked", true);
			break;
		}
	}
</script>

<!-- (휴무일) 선택한 값들 한 문자열로 쪼개기 -->
<script>
	var bizClosedDay = "${bizinfo.bizClosedDay}"; //bizClosedDay=토,일,공휴일,
	console.log("bizClosedDay : " + bizClosedDay);
	var bizClosedDayArr = bizClosedDay.split(",");
	console.log("bizClosedDayArr : "+bizClosedDayArr);
	for(var i=0; i<bizClosedDayArr.length; i++){
		var day = bizClosedDayArr[i];
		switch(day){
	    case "월":
	    case "화":
	    case "수":
	    case "목":
	    case "토":
	    case "일":
	    case "공휴일":
	      $("[name=weekday][value=" + day + "]").prop("checked", true);
	      break;
		  }
		}

</script>

<!-- 파일첨부 미리보기 -->
<script>
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}
</script>


<!-- 사업자등록번호 포맷 xxx-xx-xxxxx 10자리-->
<script>
function autoHyphenCrn(obj) {
  var str = obj.value;
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';
  if (str.length < 4) {
    obj.value = str;
    return;
  } else if (str.length < 10) {
    tmp += str.substr(0, 3) + '-';
    tmp += str.substr(3);
  } else {
    tmp += str.substr(0, 3) + '-';
    tmp += str.substr(3, 2) + '-';
    tmp += str.substr(5);
  }
  obj.value = tmp;
}
</script>

<!-- 법인등록번호 포맷 xxxxxx-xxxxxxx 13자리 -->
<script>
function autoHyphenSsn(obj){
  	var str = obj.value;
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if (str.length < 7) {
        obj.value = str;
        return;
    } else if (str.length < 13) {
        tmp += str.substr(0, 6) + '-';
        tmp += str.substr(6);
    } else {
        tmp += str.substr(0, 6) + '-';
        tmp += str.substr(6, 7);
        tmp += str.substr(13);
    }
    obj.value = tmp;
}
</script>

<!-- 숫자와 하이픈만 입력가능 -->
<script>
function checkInput(event) {
  const input = event.target;
  const error = input.parentElement.querySelector('.error-message');
  if (!input.validity.valid) {
    error.style.display = 'block';
    input.value = input.value.replace(/[^0-9\-]/g, '');
  } else {
    error.style.display = 'none';
  }
}
</script>

<!-- 숫자만 입력가능 -->
<script>
function checkInputNum(event) {
  const input = event.target;
  const error = document.getElementById('error-message-num');
  if (!input.validity.valid) {
    error.style.display = 'block';
    input.value = input.value.replace(/[^0-9]/g, '');
  } else {
    error.style.display = 'none';
  }
}
</script>
<script>
(() => {
  'use strict'
  const forms = document.querySelectorAll('.needs-validation')
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
</script>
</body>
</html>