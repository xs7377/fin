<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>Home</title>
<style type="text/css">
*{
	 box-sizing: border-box;
}
.home_wrap{
	height:1150px;
}
.wrap_info {
	width: 1300px;
	height: 180px;
	margin: 100px auto;
	text-align: center;
}

.box {
	width: 240px;
	height: 210px;
	margin-right: 20px;
	background-color: #e6e6e6;
	float: left;
}
 
.bottom_font {
	font-weight: bolder;
	font-size: 1.2em;
	color: #4d4d4d;
}

.bottom_font2 {
	font-size: 0.8em;
	color: #4d4d4d;
	line-height: 50%;
}
 
.next {
	width: 108px; 
	height: 25px;  
	background-color: #f2f2f2;
	text-align: center;  
	line-height: 25px;
	font-size: 0.8em;
	font-weight: bolder;
	display: inline-block;
	margin-top: 10px;
}

a {
	text-decoration: none;
	color: black
}

.images {
	float: right;
	margin-right: 15px;
}

.inner {
	width: 230px;
	height: 75px;
	margin-top: 25px;
}
</style>
<script type="text/javascript">
	var message = '${msg}';
	if (message != '') {
		alert(message);

	}
</script>
</head>
<body>
<%@ include file="./sub/header.jspf"%>
	<section class="home_wrap"> 
	
<div style="width: 100%; height: 545px;">
<div style=" position: absolute; width: 50%;height: 545px;">
<img src="/fin/resources/img/sub/homeimg.JPG" width="100%;" height="100%;"></div>
<div style=" background-color:rgba(213, 234, 236, 1); width: 50%; height: 545px; float: right;">
<div style=" padding-top: 60px; padding-left: 150px; position: absolute;">
<img src="/fin/resources/img/sub/home2.JPG">
</div>
</div> 
</div>  

<div style="font-weight: bolder;
	font-size: 2.8em; 
	color: #333333;
	text-align: center; margin-top: 100px; font-family: Georgia;">HAVE A NICE SHOPPING</div>

<p id="font22" style="font-size: 2em;
	color: #737373; 
	text-align: center; font-family: Georgia;">WITH TRADEMARK</p>

	<div class="wrap_info">
		<div class="box">
			<p></p>
			<p class="bottom_font">문의사항</p>
			<p></p>
			<p class="bottom_font2">경매 방법 및 입금 관련 등</p>
			<p class="bottom_font2">홈페이지 이용사항 문의를</p>
			<p class="bottom_font2">편리하게 하실 수 있습니다.</p>
			<div class="inner">
				<div class="next">
					<a href="#">　자세히보기 》</a>
				</div>
				<img src="/fin/resources/img/sub/note.png" class="images"
					width="50px" height="50px">
			</div>
		</div>


		<div class="box">
			<p></p>
			<p class="bottom_font">안전 거래</p>
			<p></p>
			<p class="bottom_font2">TRADEMARK는 관리자 계좌를</p>
			<p class="bottom_font2">이용한 안전 거래를</p>
			<p class="bottom_font2">기본 원칙으로 하고 있습니다.</p>
			<div class="inner">
				<div class="next">
					<a href="#">　자세히보기 》</a>
				</div>
				<img src="/fin/resources/img/sub/악수.png" class="images"
					width="60px" height="50px">
			</div>
		</div>


		<div class="box">
			<p></p>
			<p class="bottom_font">다양한 중고 물품</p>
			<p></p>
			<p class="bottom_font2">의류, 가전제품, 도서 등</p>
			<p class="bottom_font2">다양한 제품이 가득한</p>
			<p class="bottom_font2">중고 거래 사이트입니다.</p>
			<div class="inner">
				<div class="next">
					<a href="#">　자세히보기 》</a>
				</div>
				<img src="/fin/resources/img/sub/카트.png" class="images"
					width="50px" height="50px">
			</div>
		</div>


 
		<div class="box">
			<p></p>
			<p class="bottom_font">카카오톡 문의</p>
			<p></p>
			<p class="bottom_font2">빠른답변을 원하시면</p>
			<p class="bottom_font2">카카오톡으로 문의주세요.</p>
			<p class="bottom_font2">아이디: TRADEMARK</p>
			<div class="inner">
				<div class="next">
					<a href="#">　자세히보기 》</a>
				</div>
				<img src="/fin/resources/img/sub/talk2.png" class="images"
					width="50px" height="50px">
			</div>
		</div> 


		<div class="box">
			<p></p>
			<p class="bottom_font">전화문의</p>
			<p></p>
			<p class="bottom_font2">인터넷 010-1234-5678</p>
			<p class="bottom_font2">………………………………………</p>
			<p></p> 
			<p class="bottom_font">관리자계좌</p>
			<p></p>
			<p class="bottom_font2">국민은행 518402-01-473898</p>
			<p class="bottom_font2">예금주 TRADEMARK</p>
		</div>
	</div>
 
 
</section>
<%@ include file="./sub/footer.jspf"%>
</body>
</html>