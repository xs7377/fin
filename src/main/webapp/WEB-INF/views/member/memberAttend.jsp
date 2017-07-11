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
	width: 1300px;
	height: 1000px;
	margin: 100px auto;
}
.memberMypage_wrap {
	width: 1050px;
	margin: 0 auto;
}
.memberInfo{
	font-size: 3em;
	font-weight: bolder;
	color: #4d4d4d;
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

</style>
<script type="text/javascript">
	var message = '${msg}';
	if (message != '') {
		alert(message);

	}
</script>
</head>
<body>

	<%@ include file="../sub/header.jspf"%>

	<section class="mypage_wrap">
	
	
<div style="display: inline-block;">
	
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
		

		

</div>
	
	

		<div class="memberMypage_wrap" style="float: right; ">
		<span style="font-size: 3em; font-weight: bolder;">출석 체크 하GO 포인트 모으GO </span><br> <br> 
		<span style="color: #990000;">[출석체크] 버튼을 눌러 스마일 도장을 모아보세요.</span> <br> <br> 
		· 출석체크는 하루에 한 번 하실 수 있습니다. <br>
		· 출석체크 시 매일 10 포인트가 지급되며 7일, 14일, 21일에는 50 포인트가 지급됩니다. <br>
		· 21개의 도장을 모두 모으면 다음날부터 새로 도장을 모을 수 있습니다. <br><br><br>
		
		<c:if test="${total == 0}">
			<img src="/fin/resources/img/attend/${total}일차.jpg" width="1050px;">
		</c:if>
		
		<c:if test="${total != 0}">
			<img src="/fin/resources/img/attend/${total}일차.JPG" width="1050px;">
		</c:if>
		
		<div style="width: 130px; margin: 20px auto;">
		<a  style="font-weight: bold; font-size: 2em;" class="btn" href="/fin/member/attendCheck?id=${member.id}">CHECK</a>
		</div>
			</div>
  




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