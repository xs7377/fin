<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/fin/resources/css/reset.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body{
	font-size: 16px;
	font-family: inherit;
}
.mypage_wrap {
	width: 1300px;  
	height: auto;  
	margin: 100px auto; 
} 

button.accordion {
	background-color: #eee; 
	color: #444; 
	cursor: pointer;
	padding: 18px;
	width: 200px;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
	background-color: #ddd;
}

button.accordion:after {
	content: '\002B';
	color: #777;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

button.accordion.active:after {
	content: "\2212";
}

div.panel2 {
	padding: 0 18px;
	background-color: none;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	margin-bottom: 0px;
	border: none;
	width: 200px;
}

a{
	text-decoration: none;
	color: #595959;
	line-height: 250%;
	font-weight: normal;
}
.myPageHome{
	font-weight: bolder;
	color: #007acc;
	font-size: 20px;
}
.myPageMiddle{
	color: #8c8c8c;
	font-size: 12px;
}
</style>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>

	<section class="mypage_wrap">

<div style="display: inline-block;">
<c:if test="${member.kind == 'member' }">

	
	<!--@hyo3  -->
		<a href="/fin/member/memberMypage" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-th-list" ></span> MENU
		</button> 
		</a>
	
		<div class="panel2"></div>
	 
	<!--@hyo3  -->	
		
		<a href="/fin/member/memberView" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-user"></span> 나의 정보
		</button> 
		</a> 
		
		<div class="panel2"></div>
		
		
		<a href="/fin/member/memberFriends?curPage=1&id=${member.id }" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-music"></span> 나의 친구
		</button> 
		</a> 
		
		<div class="panel2"></div>
 
		

		<button class="accordion">
			<span class="glyphicon glyphicon-envelope"></span> 나의 쪽지
		</button>
	
		
		
		<div class="panel2">
			<dl>
				<dd class="w3-bar-item w3-button tablink" onclick="openCity(event,'sendM')">
					<a href="/fin/member/memberMessage?id=${member.id }" id="sendList" style="font-weight: normal; font-size: 0.9em;" > 보낸 쪽지함</a>
				</dd>
				<dd class="w3-bar-item w3-button tablink" onclick="openCity(event,'recvM')">
					<a href="#" id="reciveList" style="font-weight: normal; font-size: 0.9em;" > 받은 쪽지함 </a>
				</dd>
			</dl>
		</div>
		
	<a href="/fin/member/memberAttend?m_id=${member.id }" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-ok-circle"></span> 나의 출석
		</button>
		</a>
		<div class="panel2"></div>
		

	<a href="/fin/member/memberPoint" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-heart"></span> 포인트 몰
		</button>
		</a>
		
		 
		<div class="panel2"></div>

		<button class="accordion">
			<span class="glyphicon glyphicon-shopping-cart"></span> 구매 관련
		</button>
		<div class="panel2">
			<dl>
				<dd>
					<a href="/fin/member/bidding?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">입찰 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/buyIng?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">구매 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/likesProduct?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">관심 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/buyEnd?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">구매 완료 상품</a>
				</dd>
			</dl>
		</div>

		<button class="accordion">
			<span class="glyphicon glyphicon-usd"></span> 판매 관련
		</button>
		<div class="panel2">
			<dl>
				<dd>
					<a href="/fin/member/sellIng?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">판매 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/sellEnd?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">판매 완료 상품</a>
				</dd>
			</dl>
		</div>
		
</c:if>
		
</div>
		
		<div style="display: inline-block;">
		<c:if test="${member.kind == 'manager' }">
		<!--매니져  -->
		<button class="accordion">
			<span class="glyphicon glyphicon-user"></span> 매니져
		</button>
		<div class="panel2">
			<dl>
				
				<dd>
					<a href="/fin/manager/managerReport?curPage=1" style="font-weight: normal; font-size: 0.9em;">신고 접수</a>
				</dd>
				
				<dd>
					<a href="/fin/manager/managerSell?curPage=1" style="font-weight: normal; font-size: 0.9em;">판매 결산 페이지</a>
				</dd>
				
			</dl>
		</div>
		</c:if>
		</div>
		
		
		
<c:if test="${member.kind == 'member' }">

<div style="width: 1050px; height: auto;  display: inline-block; float: right;">
<table class="table table-hover" style="width:500px; display: inline-block;">
<tr>
<td>
<h4><span class="myPageHome">나의 정보</span>에서 내 정보를 최신 정보로 관리하세요.</h4>
<span class="myPageMiddle">아이디/비밀번호 분실 및 보호조치 해제를 위해 최신 정보로 내 정보를 관리하세요.</span>
</td>
</tr>

<tr>
<td>
<h4><span class="myPageHome">나의 쪽지</span>에서 안읽은 쪽지를 확인하세요.</h4>
<span class="myPageMiddle">보낸 쪽지함과 받은 쪽지함을 확인할 수 있습니다.</span>
</td>
</tr>

<tr> 
<td>
<h4><span class="myPageHome">나의 출석</span>에서 출석 체크를 해주세요.</h4>
<span class="myPageMiddle">매일 출석을 하신 회원님께 상품을 드립니다.</span> 
</td>
</tr>

<tr>
<td>
<h4><span class="myPageHome">포인트 몰</span>에서 멤버십 등급을 확인해주세요.</h4>
<span class="myPageMiddle">승급을 위한 당월 필요 거래 건수와 당월 필요 거래 금액을 확인할 수 있습니다.</span> 
</td>
</tr>

<tr>
<td>
<h4><span class="myPageHome">구매 관련 페이지</span>에서 구매 내역을 확인하세요.</h4>
<span class="myPageMiddle">입찰 중 상품, 구매 중 상품, 관심 상품, 구매 완료 상품을 확인할 수 있습니다.</span> 
</td>
</tr>

<tr> 
<td>
<h4><span class="myPageHome">판매 관련 페이지</span>에서 판매 내역을 확인하세요.</h4>
<span class="myPageMiddle">판매 중 상품과 판매 완료 상품을 확인할 수 있습니다.</span> 
</td>
</tr>

<tr> 
<td>
</td>
</tr>
</table> 

<div style="width: 520px; display: inline-block; height: 365px; float: right; border: 0.2px solid #d9d9d9;">
<div style="padding: 20px;"> 

<h3><span class="glyphicon glyphicon-search"></span>
<span style="font-size: 0.8em; font-weight: bolder;">문의사항</span>
</h3><br> 
<span style="font-size: 0.8em; color: #a6a6a6;">
TRADEMARK 홈페이지 이용 시 문의사항은 
<span style="color: #ff8566">NOTICE 게시판</span>에 게재되어 있습니다. 
추가 문의사항은 관리자에게 쪽지를 보내주시거나 전화로 문의해주세요. 
전화번호는 <span style="color: #ff8566">010-1234-5678</span>입니다.</span> 
<br><br><br>

<h3><span class="glyphicon glyphicon-share"></span>
<span style="font-size: 0.8em; font-weight: bolder;">탈퇴하기</span>
</h3><br> 
<span style="font-size: 0.8em; color: #a6a6a6;">
TRADEMARK 홈페이지를 더 이상 이용하지 않는다면 
<a href="/fin/member/memberDelete?id=${member.id}" id="memberDelete" 
onclick="return confirm('탈퇴하시겠습니까?');">
<span style="color: #ff8566">회원 탈퇴하기 ▶</span></a>
</span>

</div>
</div>

</div>
</c:if>



		<script>
			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
				acc[i].onclick = function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.maxHeight) {
						panel.style.maxHeight = null;
					} else {
						panel.style.maxHeight = panel.scrollHeight + "px";
					}
				}
			}
		</script>
		
		
	</section>
	<%@ include file="../sub/footer.jspf"%>

</body>
</html>