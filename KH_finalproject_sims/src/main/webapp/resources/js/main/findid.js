$(document).ready(function() {
    $("input[name='role']").click(function() {
        if($("input[name='role']:checked").val() === 'ROLE_USER') {
        	$(".bizForm").css("display","none");
        	$(".userForm").css("display","block");
        } else {
        	$(".bizForm").css("display","block");
        	$(".userForm").css("display","none");
        }
    });
    
    $('.user input[name=userEmail]').change(function(){
		if($('.user input[name=userEmail]').val() != null) {
			$("button[name=emailBtn]").removeAttr("disabled");
		} else {
			$("button[name=emailBtn]").attr("disabled", "disabled");
		}
	});
    
    $('.biz input[name=bizEmail]').change(function(){
		if($('.biz input[name=bizEmail]').val() != null) {
			$(".biz button[name=emailBtn]").removeAttr("disabled");
		} else {
			$(".biz button[name=emailBtn]").attr("disabled", "disabled");
		}
	});
	
});

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

var contextPath = getContextPath();
  
window.addEventListener('load', () => {
  const forms = document.getElementsByClassName('validation-form');

  Array.prototype.filter.call(forms, (form) => {
    form.addEventListener('submit', function (event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }

      form.classList.add('was-validated');
    }, false);
  });
}, false);

// 사용자 이메일 인증
$('.user button[name=emailBtn]').on("click", function() {
	const email = $('.user input[name=userEmail').val() // 이메일 주소값 얻어오기
	const checkInput = $('.user input[name=emailCheck]') // 인증번호 입력하는곳 
	
	$.ajax({
		type : "get"
		, url : contextPath + "/emailCheck?email=" + email
		, success : function (data) {
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	});
});

// 사용자 인증번호 비교
$('.user input[name=emailCheck]').on("blur", function () {
	const inputCode = $(this).val();
	const $resultMsg = $('.user .emailCheckDiv');
	
	if(inputCode === code){
		$resultMsg.html("<p style='color: green;'>인증번호가 일치합니다.</p>");
		$resultMsg.css("display", "block");
		$('.user button[name=emailBtn]').attr('disabled',true);
		$('.user input[name=userEmail').attr('readonly',true);
		$('.user input[name=emailCheck]').attr('readonly',true);
		$('.user .subBtn').removeAttr("disabled");
	}else{
		$resultMsg.html("<p style='color: green;'>인증번호가 불일치합니다. 다시 확인해주세요</p>");
		$resultMsg.css("display", "block");
	}
});

// 통신사 이메일 인증
$('.biz button[name=emailBtn]').on("click", function() {
	const email = $('.biz input[name=bizEmail').val() // 이메일 주소값 얻어오기
	const checkInput = $('.biz input[name=emailCheck]') // 인증번호 입력하는곳 
	
	$.ajax({
		type : "get"
		, url : contextPath + "/emailCheck?email=" + email
		, success : function (data) {
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	});
});

// 통신사 인증번호 비교
$('.biz input[name=emailCheck]').on("blur", function () {
	const inputCode = $(this).val();
	const $resultMsg = $('.biz .emailCheckDiv');
	
	if(inputCode === code){
		$resultMsg.html("<p style='color: green;'>인증번호가 일치합니다.</p>");
		$resultMsg.css("display", "block");
		$('.biz button[name=emailBtn]').attr('disabled',true);
		$('.biz input[name=userEmail').attr('readonly',true);
		$('.biz input[name=emailCheck]').attr('readonly',true);
		$('.biz .subBtn').removeAttr("disabled");
	}else{
		$resultMsg.html("<p style='color: green;'>인증번호가 불일치합니다. 다시 확인해주세요</p>");
		$resultMsg.css("display", "block");
	}
});

$('.login-btn').on("click", function() {
	location.href = contextPath + "/login";
});

$('.findpw-btn').on("click", function() {
	location.href = contextPath + "/findpw";
});

// 탈퇴 계정 복구
$('.rel-btn').on("click", function() {
	$.ajax({
		url : contextPath + "/enable",
		type : "post",
		async : false,
		data : {
			id : $(".resultId").val()
		},
		dataType : "json",
		success : function(data){
			if(data.rel == 1) {
				alert("계정이 복구되었습니다.");
				location.href = contextPath + "/login";
			} else {
				alert("계정 복구 실패하였습니다.")
			}
		}
	 });
});