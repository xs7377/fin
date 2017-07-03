<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	width:210px; 
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
	width: 175px;
	margin: 40px auto; 
}  
a{
	text-decoration: none;
	color: #595959;
	font-weight: bolder;
}
</style> 
<script type="text/javascript"> 
	var message='${message}';
		if(message != "") {
		alert(message);
		}
</script>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>

	<section class="mypage_wrap">
		<div class="memberMypage_wrap">
			<div class="join">FIND ID</div>
			<br>
			<br>
			<form action="idFind" method="post">
				<div class="memberlogin_wrap">
					<input type="text" class="memberlogin_form" name="name"
						placeholder="NAME" > <br>
					<br> <input type="text" class="memberlogin_form" name="email"
						placeholder="E-MAIL"> <br>
					<br>

					<button class="memberlogin_btn" id="idBtn">인증받기</button>
				
				<div class="memberlogin_bottom">
	<a href="memberAgree" style="font-size: 0.8em;">회원가입</a>
	<a href="memberFindPw" style="font-size: 0.8em;">비밀번호찾기</a>
	</div>
				
				</div>
			</form>

		</div>
	</section>

	<%@ include file="../sub/footer.jspf"%>
</body>
</html>