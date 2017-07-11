<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>Home</title>
<style type="text/css">
.home_wrap{
	height:2100px;
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
	text-align: center;
	background-color: #e6e6e6;
	float: left;
	padding-top: 30px;
}
 
.bottom_font {
	font-weight: bolder;
	font-size: 1.2em;
	color: #4d4d4d;
}

.bottom_font2 {
	font-size: 0.8em;
	color: #4d4d4d;
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
	margin-left: 20px;
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


#intro-wrap{
	width:650px;
	margin:0 auto;
}
#head{
	font-size: 3em;
	line-height : 1.5em;
	font-weight: bolder;
}

#intro{
	font-size: 2em;
	color: #b3b3ff;
	margin-top: 60px;
}

.intro2{
	font-size: 14px;
    line-height: 25px;
	
}
.number{
	float: left;
    width: 50px;
    font-size: 40px;
    font-weight: 100;
    color: #b3b3ff;
}  
.title{
	font-size: 20px;
    margin: 0 0 15px 0;
}
.info{
    line-height: 23px;
    font-size: 14px;
}
.content::after{
	display:table;
}
.content-wraper{
	height: 1200px;
}
</style>
<script type="text/javascript">
	var message = '${msg}';
	if (message != '') {
		alert(message);
	}
</script>
</head>
<body style="background-color: white;">
<%@ include file="./sub/header.jspf"%>
	<section class="home_wrap"> 
	
<div style="width: 100%; height: 545px;">
<div style="width: 50%;height: 545px;float: left;">
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


 
<div class="wrap_info" style="width: 100%; height: 900px; border: 1px dotted gray;">
<div id="intro-wrap">
		
			<p id="intro">"TRADEMARK에서는 누구나 판매자가 될 수 있고<br> 누구나 구매자가 될 수 있습니다."</p>
			<br><br><br>
			<div class="intro2">
			<p>TRADEMARK는 저희 사이트만이 가지는 특별한 특징, 다양한 혜택을 뜻합니다.</p>
			<p>사용하지 않는 물품을 최대의 가격으로 판매하고자 하는 사람,
			원하는 가격으로 원하는 물건을 <br>구입하고자 하는 사람이라면
			누구나 TRADEMARK의 회원이 될 수 있습니다.</p>
			</div> 
			<br>
			<br><br>

			<br><br><br>
			
			<div class="content" >
			<div class="number">
			1.
			</div>
			<div class="title">
			<p>안전거래 보장</p>
			</div>
			<div class="info">
			<p>물품 구매 후, 구매자가 입금하는 금액은 관리자 가상 계좌로 전달되며 </p>
			<p>구매자가 물품 수령을 완료한 이후에 판매자 계좌로 이동합니다.</p>
			<p>즉, 관리자 가상 계좌를 이용하여 안전 거래를 보장합니다.</p>
			</div>
			<br><br><br><br>
			</div>
			
			<br><br>
			
		
			<div class="content" >
			<div class="number">
			2.
			</div>
			<div class="title">
			<p>불편함 해소</p>
			</div>
			<div class="info">
			<p>원하는 물건을 즉시 발견하지 못한다면 구입이 성사되기 어렵다는 시간적 제약,</p>
			<p>가격 책정 과정에서 발생하는 의견 충돌 등</p> 
			<p>기존 중고 거래 사이트에서 존재하는 불편함을 해소합니다.</p>
			</div>
			<br><br><br><br>
			</div> 
		
			
			<br><br>
			
			<div class="content">
			<div class="number">
			3.
			</div>
			<div class="title">
			<p>TRADEMARK만의 혜택</p>
			</div>
			<div class="info">
			<p>이 달의 판매왕,  멤버십 쿠폰 등</p>
			<p>TRADEMARK 회원이라면 누구에게나 제공되는 혜택을 누리세요!</p>
			</div>
			<br><br><br><br>
			</div>
			
			<br><br>
	
		</div>
</div>
 

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
			<p class="bottom_font2">인터넷 010-1234-5678</p><br>
			<p class="bottom_font2">………………………………………</p><br>
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