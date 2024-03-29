$(document).ready(function() {
    
    // 유저 비밀번호 체크
    $('input[name=pwCheck]').change(function(){
		if($('input[name=pw]').val() === $('input[name=pwCheck]').val()) {
			$(".pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".pwCheckDiv").css("display", "block");
			$(".subBtn").removeAttr("disabled");
		} else {
			$(".pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".pwCheckDiv").css("display", "block");
			$(".subBtn").attr("disabled", "disabled");
		}
	});
	
	$('input[name=pw]').change(function(){
		if($('input[name=pw]').val() === $('input[name=pwCheck]').val()) {
			$(".pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".pwCheckDiv").css("display", "block");
			$(".subBtn").removeAttr("disabled");
		} else {
			$(".pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".pwCheckDiv").css("display", "block");
			$(".subBtn").attr("disabled", "disabled");
		}
	});
	
	$('input[name=userEmail]').change(function(){
		$(".subBtn").attr("disabled", "disabled");
		if($('input[name=userEmail]').val() != null) {
			$("button[name=emailBtn]").removeAttr("disabled");
		} else {
			$("button[name=emailBtn]").attr("disabled", "disabled");
		}
	});
	
	$('input[name=userEmail]').blur(function(){
		if($('input[name=userEmail]').val() != null) {
			$("button[name=emailBtn]").removeAttr("disabled");
		} else {
			$("button[name=emailBtn]").attr("disabled", "disabled");
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

$('button[name=emailBtn]').on("click", function() {
	const email = $('input[name=userEmail').val() // 이메일 주소값 얻어오기
	const checkInput = $('input[name=emailCheck]') // 인증번호 입력하는곳 
	
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

// 인증번호 비교
$('input[name=emailCheck]').on("blur", function () {
	const inputCode = $(this).val();
	const $resultMsg = $('.emailCheckDiv');
	
	if(inputCode === code){
		$resultMsg.html("<p style='color: green;'>인증번호가 일치합니다.</p>");
		$resultMsg.css("display", "block");
		$('button[name=emailBtn]').attr('disabled',true);
		$('input[name=userEmail').attr('readonly',true);
		$('input[name=emailCheck]').attr('readonly',true);
		if($('input[name=pw]').val() === $('input[name=pwCheck]').val()){
			$(".subBtn").removeAttr("disabled");
		}
	}else{
		$resultMsg.html("<p style='color: green;'>인증번호가 불일치합니다. 다시 확인해주세요</p>");
		$resultMsg.css("display", "block");
	}
});

// 모달창 띄우기
$('.modalInBtn').on("click", function () {
	$('.modal').fadeIn();
});

// 모달창 닫기
$('.modalOutBtn').on("click", function () {
	$('.modal').fadeOut();
});

// 계정 탈퇴
$('.relBtn').on("click", function() {
	$.ajax({
		url : contextPath + "/mypage/disable",
		type : "post",
		async : false,
		data : {
			id : $("input[name=id]").val()
		},
		dataType : "json",
		success : function(data){
			if(data.rel == 1) {
				alert("계정이 탈퇴되었습니다.");
				location.href = contextPath + "/logout";
			} else {
				alert("계정 탈퇴에 실패하였습니다.")
			}
		}
	 });
});

$('.inputPw').on('keyup', function (e) {
	var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
	var str = $(e.target).val();
	
	console.log(passwdCheck.test(str));
	if(passwdCheck.test(str) == false){
		$(".passwdCheck").css("display", "block");
	} else {
		$(".passwdCheck").css("display", "none");
	}
});

$('.info-pw-btn').on('click', function(e) {
	$.ajax({
		url : contextPath + "/mypage/infopw",
		type : "post",
		async : false,
		data : {
			password : $(".info-pw").val()
		},
		dataType : "json",
		success : function(data){
			if(data == 1) {
				$('.info-pw-div').css('display', 'none');
				$('.myinfo-div').css('display', '');
			} else {
				$('.info-pw-alert').css('display', '');
			}
		}
	 });
})

// 전화번호 포맷 xxx-xxxx-xxxx 11자리
function autoHyphenPhone(obj) {
  var str = obj.value;
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';
  if (str.length < 4) {
    obj.value = str;
    return;
  } else if (str.length < 11) {
    tmp += str.substr(0, 3) + '-';
    tmp += str.substr(3);
  } else {
    tmp += str.substr(0, 3) + '-';
    tmp += str.substr(3, 4) + '-';
    tmp += str.substr(7);
  }
  obj.value = tmp;
}

//숫자만 입력가능
function checkInput(event) {
  const input = event.target;
  const error = input.parentElement.querySelector('.error-message');
  if (!input.validity.valid) {
    error.style.display = 'block';
    input.value = input.value.replace(/[^0-9]/g, '');
  } else {
    error.style.display = 'none';
  }
}

// 비밀번호 입력 엔터시 버튼 클릭
$('.info-pw').on('keyup', function(e) {
	if(e.keyCode == 13) {
		$('.info-pw-btn').click();
	}
});