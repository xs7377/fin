<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	margin: 0 auto;
	color: #333333;  
	font-family:Georgia;
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
		var email = document.getElementById("email");
		var re_email = document.getElementById("re_email");
		var emailBtn = document.getElementById("emailBtn");
		emailBtn.addEventListener("click", next);
		
		$("#email").focus(function() {
			document.getElementById("s1").innerHTML = "이메일을 입력해 주세요.";
		});

		$("#email").keyup(function() {
		 if (!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/.test(email.value)) {
				document.getElementById("s1").innerHTML = "이메일주소 형식이 틀립니다. 다시 입력해주세요.";
				document.getElementById("s1").style.color = 'red';
		 } else {
				document.getElementById("s1").innerHTML = "이메일주소가 입력되었습니다.";
				document.getElementById("s1").style.color = '#404040';
			}
	     });
		
		$("#re_email").keyup(function() {
			if (email.value == re_email.value && email.value != "" && re_email.value != "") {
				document.getElementById("s2").innerHTML = "입력하신 이메일과 일치합니다.";
				document.getElementById("s2").style.color = '#404040';
			} else {
				document.getElementById("s2").innerHTML = "입력하신 이메일과 일치하지 않습니다.";
				document.getElementById("s2").style.color = 'red';
			}
		});


		function next() {
			if (email.value != "" && email.value == re_email.value) {
				document.frm.submit();
			} else {
				alert("이메일을 확인하세요.");
			}
		}

	});
</script>
</head>
<body>
	
		<%@ include file="../sub/header.jspf"%>
	
	<section class="mypage_wrap">
		<div class="memberMypage_wrap">
			<div class="join">E-MAIL CONFIRM</div>
			<br> 
			<br>
			
			<c:if test="${email == null}">
			<form action="emailConfirm" method="post" name="frm">
				<div class="memberlogin_wrap">
					<input type="text" class="memberlogin_form" name="email" id="email"
						placeholder="E-MAIL"> <span
					id="s1" class="s"></span><br> 
					<br> <input type="text" class="memberlogin_form" name="re_email" id="re_email"
						placeholder="REPEAT E-MAIL"><span
					id="s2" class="s"></span> <br>
					<br>	
					<input type="button" class="memberlogin_btn" id="emailBtn" value="인증받기">	 
				<div class="memberlogin_bottom">
		<a href="phoneConfirm" style="font-size: 0.8em; margin-left: 15px;">휴대전화 인증하기</a>
		</div>
	</div>
			</form>
			</c:if>
			
			 <c:if test="${email != null}">
			 <form action="emailConfirm_number" method="post" name="frm">
				<div class="memberlogin_wrap">
					<input type="text" class="memberlogin_form" name="email" id="email"
						placeholder="E-MAIL" value="${email}" readonly="readonly"><br> 
					<br> 
					<input type="text" class="memberlogin_form" name="number2" id="number"
						placeholder="VERIFICATION CODE"><br>
					<br>	
					<input type="hidden" name="number1" value="${number}">
					<button class="memberlogin_btn">인증번호 보내기</button>
				<div class="memberlogin_bottom">
	<a href="phoneConfirm" style="font-size: 0.8em; margin-left: 15px;">휴대전화 인증하기</a>
	</div>
</div>
			</form>
			 </c:if>

		</div>
	</section>

	<%@ include file="../sub/footer.jspf"%>

</body>
</html>