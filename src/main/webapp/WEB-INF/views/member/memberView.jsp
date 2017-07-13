<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript"> 
	var message='${message}';
		if(message != "") {
		alert(message);
		}
</script>
<style type="text/css">
body{
	font-size: 16px;
	font-family: inherit;
}
.mypage_wrap { 
	width: 1300px;
	height: 800px;
	margin: 100px auto;
}

.memberMypage_wrap {
	width: 900px;
	margin-right: 100px;
	display: inline-block;
	float: right; 
}

.mermberMypage_td {
	font-weight: bolder;
	color: #595959;
	width: 200px;
	font-family: Georgia;
}

.img {
	width: 150px;
	height: 180px;
}

a {
	text-decoration: none;
}

.mypage_btnBox {
	width: 245px; 
	margin: 50px auto;
}
.mypage_menu{
	font-size: 1.2em;
	color: #333333;
	font-weight: bolder;  
	margin-left: 20px;
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
		
		
		<a href="/fin/member/memberFriends?curPage=1" style="font-weight: normal;">
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
					<a href="/fin/member/memberMessage" id="sendList" style="font-weight: normal; font-size: 0.9em;" > 보낸 쪽지함</a>
				</dd>
				<dd class="w3-bar-item w3-button tablink" onclick="openCity(event,'recvM')">
					<a href="#" id="reciveList" style="font-weight: normal; font-size: 0.9em;" > 받은 쪽지함 </a>
				</dd>
			</dl>
		</div>
		
<a href="/fin/member/memberAttend" style="font-weight: normal;">
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
					<a href="/fin/member/bidding?curPage=1" style="font-weight: normal; font-size: 0.9em;">입찰 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/buyIng?curPage=1" style="font-weight: normal; font-size: 0.9em;">구매 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/likesProduct?curPage=1" style="font-weight: normal; font-size: 0.9em;">관심 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/buyEnd?curPage=1" style="font-weight: normal; font-size: 0.9em;">구매 완료 상품</a>
				</dd>
			</dl>
		</div>

		<button class="accordion">
			<span class="glyphicon glyphicon-usd"></span> 판매 관련
		</button>
		<div class="panel2">
			<dl>
				<dd>
					<a href="/fin/member/sellIng?curPage=1" style="font-weight: normal; font-size: 0.9em;">판매 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/sellEnd?curPage=1" style="font-weight: normal; font-size: 0.9em;">판매 완료 상품</a>
				</dd>
			</dl>
		</div>
		
	</div>	
		<div class="memberMypage_wrap">
		
			<table class="table table-hover">
				<tr>
					<td class="mermberMypage_td">PROFILE PICTURE
					</td>
					<td><c:if test="${member.fname != null }">
							<img alt="" src="../resources/upload/${member.fname}" class="img">
						</c:if>
						<c:if test="${member.fname eq null }">
							프로필 사진을 등록해주세요.
						</c:if>
						
						</td>
				</tr>

				<tr>
					<td class="mermberMypage_td">ID</td>
					<td><input id="member_id" type="text" class="form-control"
						name="id" value="${member.id}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">NAME</td>
					<td><input id="member_name" type="text" class="form-control"
						name="name" value="${member.name}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">PHONE</td>
					<td><input id="member_phone" type="text" class="form-control"
						name="phone" value="${member.phone}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">ADDRESS</td>
					<td><input id="member_addr" type="text" class="form-control"
						name="addr" value="${member.addr}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">E-MAIL</td>
					<td><input id="member_email" type="text" class="form-control"
						name="email" value="${member.email}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">POINT</td>
					<td><input id="member_email" type="text" class="form-control"
						name="point" value="${member.point}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">MONEY</td>
					<td><input id="member_email" type="text" class="form-control"
						name="money" value="${member.money}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">SCORE</td>
					<td><input id="member_email" type="text" class="form-control"
						name="score" value="${member.score}" readonly="readonly"></td>
				</tr>

				<tr>
					<td class="mermberMypage_td">GRADE</td>
					<td><input id="member_email" type="text" class="form-control"
						name="grade" value="${member.grade}" readonly="readonly"></td>
				</tr>

			</table>

	<br><br><br>
	<span style="font-size: 0.8em; color: #a6a6a6;">
	회원 정보를 수정하고 싶으시다면
	<a href="/fin/member/memberUpdate"><span style="color: #ff8566;">회원 정보 수정하기 ▶</span></a>
	</span>
			
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