<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
.mypage_wrap {
	width: 1400px;
	height: auto;
	margin: 100px auto;
	background-color: yellow;
}
.memberMypage_wrap {
	width: 800px;
	margin: 0 auto;
}
.memberInfo{
	font-size: 3em;
	font-weight: bolder;
	color: #4d4d4d;
}
</style>
</head>
<body>

	<%@ include file="../sub/header.jspf"%>

<div class="w3-bar w3-black">
  <a href="/fin/member/memberMypage" class="w3-bar-item w3-button">M Y P A G E</a>
  <div class="w3-dropdown-hover">
  <a href="/fin/member/memberView" class="w3-button">나 의 정 보<span class="caret"></span></a>
</div>
  <div class="w3-dropdown-hover">
  <button class="w3-button">나 의 쪽 지<span class="caret"></span></button>
  <div class="w3-dropdown-content w3-bar-block w3-border">
    <a href="#" class="w3-bar-item w3-button">받은쪽지함</a>
    <a href="#" class="w3-bar-item w3-button">보낸쪽지함</a>
    <a href="#" class="w3-bar-item w3-button">휴지통</a>
  </div>
</div>
  <div class="w3-dropdown-hover">
     <a href="/fin/member/memberAttend" class="w3-button">나 의 출 석<span class="caret"></span></a>

</div>
  <div class="w3-dropdown-hover">
   <a href="/fin/member/memberPoint" class="w3-button">포 인 트 몰<span class="caret"></span></a>

</div>
  <div class="w3-dropdown-hover">
 <button class="w3-button">구 매 관 련<span class="caret"></span></button>
  <div class="w3-dropdown-content w3-bar-block w3-border">
    <a href="#" class="w3-bar-item w3-button">입찰 중 상품</a>
    <a href="#" class="w3-bar-item w3-button">구매 중 상품</a>
    <a href="#" class="w3-bar-item w3-button">관심 상품</a>
    <a href="#" class="w3-bar-item w3-button">구매 완료 상품</a>
  </div>
</div>
  <div class="w3-dropdown-hover">
 <button class="w3-button">판 매 관 련<span class="caret"></span></button>
  <div class="w3-dropdown-content w3-bar-block w3-border">
    <a href="#" class="w3-bar-item w3-button">판매 중 상품</a>
    <a href="#" class="w3-bar-item w3-button">판매 완료 상품</a>
  </div>
</div>
</div>



	<section class="mypage_wrap">
		<div class="memberMypage_wrap">
		
		<div class="memberInfo">M Y A T T E N D</div> <br><br><br>

			</div>

	</section>
	<%@ include file="../sub/footer.jspf"%>

</body>
</html>