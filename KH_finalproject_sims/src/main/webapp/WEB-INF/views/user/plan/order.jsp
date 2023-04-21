<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
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
	
	<title>신청페이지 | ${plan.planName} | 심즈</title>
	
	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/plan.css">
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-m">
			<div class="row">
				${plan }
				${user }
				가입유형: <span id="joinCategory"></span>
				유심보유: <span id="simYn"></span>
				유심유형: <span id="simType"></span>
				
				<h4>가입 고객 정보</h4>
				<form name="userInfo" action="#">
					<table class="table w-100">
						<tr>
							<td class="w-25">이름</td>
							<td>
								<input name="userName" type="text" value="${user.userName }">
							</td>
						</tr>
						<tr>
							<td class="w-25">주민등록번호</td>
							<td>
								<input name="ssnFirst" id="ssnFirst" type="text"> -
								<input name="ssnLast" id="ssnLast" type="password">
							</td>
						</tr>
						<tr>
							<td class="w-25">휴대폰 번호</td>
							<td>
								<input id="phoneFirst" type="text"> -
								<input id="phoneMiddle" type="text"> -
								<input id="phoneLast" type="text">
							</td>
						</tr>
						<tr>
							<td class="w-25">이메일</td>
							<td>
								<input id="emailId" type="text"> @
								<input id="emailDomain" type="text">
								<select id="emailSelect">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="yahoo.com">yahoo.com</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>배송지 주소</td>
							<td>
								<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목">
							</td>
						</tr>
						<tr>
							<td>기타 요청사항</td>
							<td><textarea class="w-100" rows="3"></textarea></td>
						</tr>
					</table>
				</form>
				
				<h4>납부 정보</h4>
				<form name="payInfo" action="#">
					<table class="table w-100">
						<tr>
							<td class="w-25">명세서 수령방법</td>
							<td>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="howtopay" id="card" value="1">
									<label class="form-check-label" for="card">카드납부</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="howtopay" id="bank" value="2">
									<label class="form-check-label" for="bank">은행납부</label>
								</div>
							</td>
						</tr>
					</table>
					<table class="table w-100 payInfoTable">
						<tr>
							<td>예금주</td>
							<td>
								<input type="text" id="accountHolder" placeholder="예금주를 입력해주세요">
								<input class="form-check-input" type="checkbox" id="userEqAccount">
								<label class="form-check-label" for="userEqAccount">고객정보와 동일</label>
							</td>
						</tr>
					</table>
				</form>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		const joinCategory = sessionStorage.getItem('joinCategory');
		const simYn = sessionStorage.getItem('simYn');
		const simType = sessionStorage.getItem('simType');
	
		$('#joinCategory').text(joinCategory);
		$('#simYn').text(simYn);
		$('#simType').text(simType);
		
		// 주민등록번호
		var ssn = '${user.userSsn}';
		let [ssn1,ssn2] = ssn.split('-');
		$('#ssnFirst').val(ssn1);
		$('#ssnLast').val(ssn2);
		
		// 휴대폰 번호
		const phone = '${user.userPhone}';
		let [phone1, phone2, phone3] = phone.split('-');
		$('#phoneFirst').val(phone1);
		$('#phoneMiddle').val(phone2);
		$('#phoneLast').val(phone3);
		
		// 이메일
		$('#emailSelect').change(function(){
            $('#emailDomain').val($('#emailSelect').val());
        });
		
		const email = '${user.userEmail}';
		let [a,b] = email.split('@');
		$('#emailId').val(a);
		
		
		// 우편번호
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
					
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					    addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
					    addr = data.jibunAddress;
					}
					
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if(data.userSelectedType === 'R'){
					    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					        extraAddr += data.bname;
					    }
					    // 건물명이 있고, 공동주택일 경우 추가한다.
					    if(data.buildingName !== '' && data.apartment === 'Y'){
					        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					    }
					    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					    if(extraAddr !== ''){
					        extraAddr = ' (' + extraAddr + ')';
					    }
					    // 조합된 참고항목을 해당 필드에 넣는다.
					    document.getElementById("sample6_extraAddress").value = extraAddr;
					
					} else {
					    document.getElementById("sample6_extraAddress").value = '';
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
		}
		
		// 예금정보
		const userEqAccount = document.getElementById('userEqAccount');
		const accountHolder = document.getElementById('accountHolder');
		
		userEqAccount.addEventListener('change', () => {
			if (userEqAccount.checked) {
				accountHolder.value = '${user.userName}';
			} else {
				accountHolder.value = '';
			}
		});

	</script>
</body>
</html>