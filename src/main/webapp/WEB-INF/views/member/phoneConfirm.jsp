<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.mypage_wrap {
	width: 1400px;
	height: auto;
	margin: 100px auto;
}

.memberMypage_wrap {
	width: 800px;
	margin: 0 auto;
}

.join {
	width: 470px;
	height: 65px;
	font-size: 3em;  
	font-weight: bolder; 
	color: #333333;  
	font-family:Georgia;
	margin: 0 auto;
}
 
.memberlogin_btn {
	width: 400px;
	height: 50px;
	display: block;
	background-color: #ff4d4d;
	font-weight: bold;
	margin: 10px auto;
	text-align: center;
	line-height: 100%;
	color: white;
	font-size: 0.95em;
	border: none;
	cursor: pointer;
}

.memberlogin_form {
	width: 400px;
	height: 50px;
}

.memberlogin_wrap {
	width: 400px;
	margin: 0 auto;
}
.memberlogin_bottom{
	width: 150px;
	margin: 40px auto; 
} 
a{
	text-decoration: none;
	color: #595959;
	font-weight: bolder;
}

.s {
	font-size: 0.7em;
}
</style>
<script type="text/javascript">
var message='${message}';
if(message != '') {
	alert(message);
}
		
	$(function() {
		var s1 = document.getElementById("s1");
		var s2 = document.getElementById("s2");
		var phone = document.getElementById("phone");
		var re_phone = document.getElementById("re_phone");
		var phoneBtn = document.getElementById("phoneBtn");
		phoneBtn.addEventListener("click", next);
		
		$("#phone").focus(function() {
			document.getElementById("s1").innerHTML = "휴대폰 번호를 입력해 주세요.";
		});

		$("#phone").keyup(function() {
		 if (!/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/.test(phone.value)) {
				document.getElementById("s1").innerHTML = "휴대폰 번호 형식이 틀립니다. 다시 입력해주세요.";
				document.getElementById("s1").style.color = 'red';
		 } else {
				document.getElementById("s1").innerHTML = "휴대폰 번호가 입력되었습니다.";
				document.getElementById("s1").style.color = '#404040';
			}
	     });
		
		$("#re_phone").keyup(function() {
			if (phone.value == re_phone.value && phone.value != "" && re_phone.value != "") {
				document.getElementById("s2").innerHTML = "입력하신 휴대폰 번호와 일치합니다.";
				document.getElementById("s2").style.color = '#404040';
			} else {
				document.getElementById("s2").innerHTML = "입력하신 휴대폰 번호와 일치하지 않습니다.";
				document.getElementById("s2").style.color = 'red';
			}
		});


		function next() {
			if (phone.value != "" && phone.value == re_phone.value) {
				document.frm.submit();
			} else {
				alert("핸드폰 번호를 확인하세요.");
			}
		}

	});
</script>
</head>
<body>
	
		<%@ include file="../sub/header.jspf"%>

	<section class="mypage_wrap">
		<div class="memberMypage_wrap">
			<div class="join">PHONE CONFIRM</div>
			<br> 
			<br>
			<c:if test="${phone  == null}">
			<form action="phoneConfirm" method="post" name="frm">
				<div class="memberlogin_wrap">
					<input type="text" class="memberlogin_form" name="phone" id="phone"
						placeholder="PHONE NUMBER" > <span
					id="s1" class="s"></span><br> 
					<br> <input type="text" class="memberlogin_form" name="re_phone" id="re_phone"
						placeholder="REPEAT PHONE NUMBER" ><span
					id="s2" class="s"></span> <br>
					<br>
					<input type="button" class="memberlogin_btn" id="phoneBtn" value="인증받기">	 
				<div class="memberlogin_bottom">
	<a href="emailConfirm" style="font-size: 0.8em; margin-left: 20px;">이메일 인증하기</a>
	</div>
				
				</div> 
			</form>
			</c:if>
			
			
			<c:if test="${phone != null}">
			<form action="phoneConfirm_number" method="post">
				<div class="memberlogin_wrap">
					<input type="text" class="memberlogin_form" name="phone" id="phone"
						placeholder="PHONE NUMBER" value="${phone}" readonly="readonly" onkeypress='return event.charCode >= 48 && event.charCode <= 57'> <br> 
					<br> 
					<input type="text" class="memberlogin_form" name="number2" id="number"
					placeholder="VERIFICATION CODE"> <br><br>
						<input type="hidden" name="number1" value="${text}">
					<button class="memberlogin_btn" id="phoneBtn">인증번호 보내기</button>
				<div class="memberlogin_bottom">
	<a href="emailConfirm" style="font-size: 0.8em; margin-left: 20px;">이메일 인증하기</a>
	</div>
				
				</div> 
			</form>
			
			
			</c:if>

		</div>
	</section>

	<%@ include file="../sub/footer.jspf"%>
</body>
</html>