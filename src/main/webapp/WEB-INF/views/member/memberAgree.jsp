<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.agree_wrap{
	width: 1100px;
	height: 1200px;
	margin: 100px auto;
}
.agree{ 
	width: 680px; 
	height: 65px;
	font-size: 3em;
	font-weight: bolder;
	color: #333333; 
	margin: 0 auto;
}
.agree_1{
	font-size: 1.5em;
	font-weight: bolder;
	color: #4d4d4d;
}
.agree_2{
	font-size: 1.5em;
	font-weight: bolder;
	color: #b3b3b3;
}
.agree_contents_wrap{
	width: 950px;
	height: 350px;
	margin: 0 auto;
	overflow: scroll;
	font-size: 0.8em;
}
.agree_check {
	float: right;
	font-size: 0.8em;
	display: inline-block;
	margin-right: 70px; 
} 

.all_agree {
	float: left;
	display: inline-block;
	margin-left: 70px;
	font-size: 0.8em;
}
.agree_btn{
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
</style> 

<script type="text/javascript">
	window.onload = function() {
		var check_all = document.getElementById("check_all");
		var check = document.getElementsByName("agree");
		var not_check = document.getElementsByName("not_agree");
		var button = document.getElementById("agree_btn");
		for(var i=0; i<check.length; i++) {
			check[i].addEventListener("click", stop);
		}
 		check_all.addEventListener("click", go);
 		for(var i=0; i<not_check.length; i++) {
 			not_check[i].addEventListener("click", stop_1);
 		}
		button.addEventListener("click", next); 
	
	function stop() {
		var count = 0;
		for (var i = 0; i < check.length; i++) {
			if (!check[i].checked) {
				check_all.checked = false;
			} else {
				not_check[i].checked = false;
				count++;
			}
		}
		if (count == 2) {
			check_all.checked = true;
		}
	}

	function go() {
		for (var i = 0; i < check.length; i++) {
			if (check_all.checked) {
				check[i].checked = true;
				not_check[i].checked = false;
			} else {
				check[i].checked = false;
			}
		}
	}

	function stop_1() {
		for (var i = 0; i < check.length; i++) {
			if (not_check[i].checked) {
				check[i].checked = false;
				check_all.checked = false;
			}
		}
	}

	function next() {
		if (check_all.checked) {
			location.href = "memberConfirm";
		} else {
			alert("약관에 동의해주세요.");
		}
	}
	}
</script>
</head> 
<body>
	<%@ include file="../sub/header.jspf"%>
	<section class="agree_wrap">
	<div class="agree" style="font-family:Georgia;">TERMS AND CONDITIONS</div><br><br>
	 
	
	<span class="agree_1">회원 가입</span> <span class="agree_2">약관</span> <br> 
	……………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………<br><br><br>
	
	<div class="agree_contents_wrap">
	<p>트레이드마크 이용약관/서비스약관</p>
				<p></p> 
				<p>트레이드마크의 회원약관은 다음과 같은 내용을 담고 있습니다.</p>
				<p></p>
				<p>제1조 목적 본 약관은 트레이드마크(이하, 회사)에서 운영하는 www.trademark.com 이용과
					관련하여 트레이드마크와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
				<p></p>
				<p>제2조 약관의 효력과 변경</p>
				<p>(1) 본 약관은 서비스를 통하여 이를 공지하거나, 전자우편, 기타의 방법으로 회원에게 통지함으로써 효력을
					발생합니다.</p>
				<p>(2) 회사는 사정상 중요한 사유가 발생될 경우 사전 통지 없이 이 약관의 내용을 변경할 수 있으며, 변경된
					약관은 본 조 제 1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.</p>
				<p>(3) 회사는 약관을 개정할 경우 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미
					체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다.</p>
				<p>(4) 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력
					발생일로부터 7일 이후에도 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주 됩니다.</p>
				<p></p>

				<p>제3조 약관외 준칙</p>
				<p>(1) 본 약관은 회사가 제공하는 개별서비스에 관한 별도의 약관, 정책 및 운영규칙과 함께 적용됩니다.</p>
				<p>(2) 본 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법, 정보통신윤리위원회 심의규정,
					정보통신 윤리 강령, 프로그램 보호법 및 관계규정에 의합니다</p>
				<p></p>
				<p></p>
				<p></p>
	
	</div> <br>

			<div class="agree_check">
				<input type="checkbox" name="agree">동의함 
				<input type="checkbox" name="not_agree">동의안함
			</div>

			<br> <br>


	<span class="agree_1">개인 정보</span> <span class="agree_2">취급 방침</span> <br>
	……………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………<br><br><br>
	<div class="agree_contents_wrap">
	<p>트레이드마크 공식 홈페이지 이용약관/서비스약관</p>
				<p></p>
				<p>제4조 용어의 정의</p> 
				<p>(1) 회원 : 서비스를 제공받기 위하여 회사와 이용계약을체결하고 아이디(ID)를 부여받은 자를 말합니다.</p>
				<p>(2) 아이디(ID) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자나
					숫자의 조합</p>
				<p>(3) 비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여
					회원이 정한 문자와 숫자의 조합</p>
				<p>(4) 이용해지 : 회사 또는 회원이 서비스 사용 후 이용계약을 종료시키는 의사표시</p>
				<p>(5) 정지 : 회사가 정한 일정한 요건에 따라 일정기간동안 서비스이용을 보류/중지하는 것</p>
				<p>(6) 중복가입 : 1인의 이용자가 서로다른 2개이상의 아이디(ID)로 회원등록을 하는 행위</p>
				<p></p>
				<p>제5조 이용 계약의 성립</p>
				<p>(1) 서비스 가입 신청시 본 약관을 읽고 '동의함'의 체크박스에 체크를 한 후 가입 버튼을 클릭하면 본
					약관에 동의하는 것으로 간주됩니다.</p>
				<p>(2) 이용 계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 회사가 승낙함으로써 성립합니다.
				</p>
				<p></p>
				<p>제6조 이용신청</p>
				<p>(1) 서비스를 이용하고자 하는 귀하는 회사에서 요청하는 소정의 가입신청 양식에 개인 신상정보를 기록하여
					신청하도록 합니다.</p>
				<p>(2) 가입신청 양식에 기재하는 모든 정보는 실제 데이터인 것으로 간주됩니다. 내용이 허위(차명, 비실명,
					중복가입 등)인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 귀하는 법적인 보호를 받을 수
					없고, 회사는 귀하의 본 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 모든 불이익에 대해 책임을
					지지 않습니다.</p>
				<p></p>
				<p></p>
				<p></p>
	
	</div> <br>
	
			<div class="agree_check">
				<input type="checkbox" name="agree">동의함 
				<input type="checkbox" name="not_agree">동의안함
			</div>
	
			<br> <br>
			
			<div class="all_agree">
				<input type="checkbox" id="check_all">전체 동의<br>
			</div> <br><br><br>
			<button class="agree_btn" id="agree_btn">다음단계 》</button>
	</section>
	<%@ include file="../sub/footer.jspf"%>


</body>
</html>