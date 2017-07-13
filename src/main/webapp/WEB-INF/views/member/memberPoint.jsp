<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	height: 1400px;
	margin: 100px auto;
}

.memberMypage_wrap {
	width: 1050px;
	margin: 0 auto;
	float: right;
	margin-top:-100px;
}

.memberInfo {
	font-size: 3em;
	font-weight: bolder;
	color: #4d4d4d;
}  

.number_bolder {
	font-weight: bolder;
}

.coupon_img {
	width: 150px;
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
var message='${message}';
if(message != "") {
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
			<br> <br> <br>
		<!-- 	<div class="panel panel-default"> -->
				<br>
				<div class="panel-body">
					<span style="font-size: 1.5em; font-weight: bolder;">등급안내</span><br>
					<br>
					<table class="table table-condensed">
						<tr>
							<td style="width: 100px;"><br> <br> <br> <img
								alt="" src="../resources/img/membership/${member.grade}.JPG"></td>
							<td style="width: 400px; vertical-align: middle;">
							<span style="font-weight: bolder;">${member.name}</span>님의 멤버십 등급은
							<span style="color: #ffbf00; font-weight: bolder;">${member.grade}</span>입니다.<br><br>
							<span style="font-weight: bolder; color: #8c8c8c;">유지기간 | </span> 1개월 / 매월 1일 변경 <br> 
							<span style="font-weight: bolder; color: #8c8c8c;">산정기간 | </span> 최근 3개월 / 
							<span style="font-weight: bolder;">${startDate} ~ ${lastDate}</span>
							
							<br>
							</td>
							<td style="font-size: 0.9em; font-weight: bolder;"><br>
								<c:if test="${member.grade == 'NEW'}">
									<img src="../resources/img/membership/SILVER.JPG" width="80px"
										height="90px">
							다음 등급인 SILVER로 승급하시려면?  
							</c:if> <c:if test="${member.grade == 'SILVER'}">
									<img src="../resources/img/membership/GOLD.JPG" width="85px"
										height="96px">
							다음 등급인 GOLD로 승급하시려면? 
							</c:if> <c:if test="${member.grade == 'GOLD'}">
									<img src="../resources/img/membership/VIP.JPG" width="85px"
										height="96px">
							다음 등급인 VIP로 승급하시려면?
							</c:if> <c:if test="${member.grade == 'VIP'}">
									<img src="../resources/img/membership/VVIP.JPG" width="85px"
										height="96px">
							다음 등급인 VVIP로 승급하시려면?
							</c:if> <c:if test="${member.grade == 'VVIP'}">
									<img src="../resources/img/membership/FIRST.JPG" width="85px"
										height="96px">
							다음 등급인 FIRST로 승급하시려면?
							</c:if>
							
							<c:if test="${member.grade == 'FIRST'}">
									<img src="../resources/img/membership/FIRST.JPG" width="85px"
										height="96px">
							현재 등급인 FIRST로 유지하시려면?
							</c:if>
							

								<table
									style="outline: 1px solid #d9d9d9; margin-left: 90px; font-weight: normal;">
									<tr>
										<td
											style="width: 150px; height: 60px; text-align: center; background-color: #f7fafb;">현재
											누적 거래 건수 <br><span style="color: #ff3200; font-weight: bolder; line-height: 200%;"> ${tCount}</span>
											<span style="font-size: 0.9em;">건</span></td>
										<td
											style="width: 150px; height: 60px; text-align: center; background-color: #f7fafb;">현재
											누적 거래 금액 <br><span style="color: #ff3200; font-weight: bolder; line-height: 200%;"> ${tMoney}</span>
											<span style="font-size: 0.9em;">원</span></td>
									</tr>
									<tr>
										<td style="width: 150px; height: 60px; text-align: center;">당월
											필요 거래 건수<br><span style="color: #ff3200; font-weight: bolder; line-height: 200%;"> ${needCount}</span>
											<span style="font-size: 0.9em;">건</span>
										
											
											</td>
										<td style="width: 150px; height: 60px; text-align: center;">당월
											필요 거래 금액
								<br><span style="color: #ff3200; font-weight: bolder; line-height: 200%;"> ${needMoney}</span>
											<span style="font-size: 0.9em;">원</span>			
											</td>
									</tr>
								</table> <br> <br></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<br> <br> <span
						style="font-size: 1.5em; font-weight: bolder;">멤버십 등급별 혜택</span><br>
					<br>

					<table class="table table-bordered"
						style="text-align: center; border-top: 1.5px solid black;">

						<tr>
							<td
								style="font-weight: bolder; background-color: #fafafa; vertical-align: middle;">등급</td>
							<td ><img alt=""
								src="/fin/resources/img/membership/FIRST.JPG"></td>
							<td ><img alt=""
								src="/fin/resources/img/membership/VVIP.JPG"></td>
							<td ><img alt=""
								src="/fin/resources/img/membership/VIP.JPG"></td>
							<td ><img alt=""
								src="/fin/resources/img/membership/GOLD.JPG"></td>
							<td ><img alt=""
								src="/fin/resources/img/membership/SILVER.JPG"></td>
							<td ><img alt=""
								src="/fin/resources/img/membership/NEW.JPG"></td>
						</tr>

						<tr>
							<td
								style="font-weight: bolder; background-color: #fafafa; vertical-align: middle;">등급조건</td>

							<td style="vertical-align: middle;">상품 <span class="number_bolder"> 20건</span> 거래 & <br>
								<span class="number_bolder"> 135만원</span> 이상 거래
							</td>

							<td style="vertical-align: middle;">상품 <span class="number_bolder">15건</span> 거래 & <br>
								<span class="number_bolder"> 50만원</span> 이상 거래
							</td>

							<td style="vertical-align: middle;">상품 <span class="number_bolder">8건</span> 거래 & <br>
								<span class="number_bolder"> 27만원</span> 이상 거래
							</td>

							<td style="vertical-align: middle;">상품 <span class="number_bolder">5건</span> 거래 & <br>
								<span class="number_bolder">12만원</span> 이상 거래
							</td>

							<td style="vertical-align: middle;">상품<span class="number_bolder"> 2건</span> 거래 & <br>
								<span class="number_bolder">4만원</span> 이상 거래
							</td>

							<td style="vertical-align: middle;">SILVER 등급 기준 <br> 미충족
							</td>
						</tr>

						<tr>

							<td
								style="font-weight: bolder; background-color: #fafafa; vertical-align: middle;">할인
								쿠폰 <br>혜택
							</td>


							<td><br> <br> <c:if
									test="${member.grade == 'FIRST' && point_result == 1}">
									<a href="memberCoupon?name=5000원 할인쿠폰&contents=5000&kind=포인트">
										<img src="/fin/resources/img/coupon/5000원.png"
										class="coupon_img">
									</a>
									<br>
									<br>
								</c:if> <c:if test="${member.grade == 'FIRST' && point_result == 0}">
									<img src="/fin/resources/img/coupon/5000원채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span> 
								</c:if> <c:if test="${member.grade != 'FIRST'}">
									<img src="/fin/resources/img/coupon/5000원채도.png"
										class="coupon_img"> <br><br>
								</c:if> <br> <span style="color: #d9d9d9;">-----------------------------</span>
								<br> <br> <br> <c:if
									test="${member.grade == 'FIRST' && percent_result == 1}">
									<a href="memberCoupon?name=30퍼센트 할인쿠폰&contents=30&kind=퍼센트">
										<img src="/fin/resources/img/coupon/30퍼센트.png"
										class="coupon_img">
									</a>
									<br>
								</c:if> <c:if test="${member.grade == 'FIRST' && percent_result == 0}">
									<img src="/fin/resources/img/coupon/30퍼센트채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'FIRST'}">
									<img src="/fin/resources/img/coupon/30퍼센트채도.png"
										class="coupon_img">
								</c:if> <br> <br></td>



							<td><br> <br> <c:if
									test="${member.grade == 'VVIP' && point_result == 1}">
									<a href="memberCoupon?name=4000원 할인쿠폰&contents=4000&kind=포인트">
										<img src="/fin/resources/img/coupon/4000원.png"
										class="coupon_img">
									</a>
									<br>
									<br>
								</c:if> <c:if test="${member.grade == 'VVIP' && point_result == 0}">
									<img src="/fin/resources/img/coupon/4000원채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'VVIP'}">
									<img src="/fin/resources/img/coupon/4000원채도.png"
										class="coupon_img"><br><br>
								</c:if> <br> <span style="color: #d9d9d9;">-----------------------------</span>
								<br> <br> <br> <c:if
									test="${member.grade == 'VVIP' && percent_result == 1}">
									<a href="memberCoupon?name=25퍼센트 할인쿠폰&contents=25&kind=퍼센트">
										<img src="/fin/resources/img/coupon/25퍼센트.png"
										class="coupon_img">
									</a>
									<br>
								</c:if> <c:if test="${member.grade == 'VVIP' && percent_result == 0}">
									<img src="/fin/resources/img/coupon/25퍼센트채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'VVIP'}">
									<img src="/fin/resources/img/coupon/25퍼센트채도.png"
										class="coupon_img">
								</c:if> <br> <br></td>



							<td><br> <br> <c:if
									test="${member.grade == 'VIP' && point_result == 1}">
									<a href="memberCoupon?name=3000원 할인쿠폰&contents=3000&kind=포인트">
										<img src="/fin/resources/img/coupon/3000원.png"
										class="coupon_img">
									</a>
									<br>
									<br>
								</c:if> <c:if test="${member.grade == 'VIP' && point_result == 0}">
									<img src="/fin/resources/img/coupon/3000원채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'VIP'}">
									<img src="/fin/resources/img/coupon/3000원채도.png"
										class="coupon_img"><br><br>
								</c:if> <br> <span style="color: #d9d9d9;">-----------------------------</span>
								<br> <br> <br> <c:if
									test="${member.grade == 'VIP' && percent_result == 1}">
									<a href="memberCoupon?name=20퍼센트 할인쿠폰&contents=20&kind=퍼센트">
										<img src="/fin/resources/img/coupon/20퍼센트.png"
										class="coupon_img">
									</a>
									<br>
								</c:if> <c:if test="${member.grade == 'VIP' && percent_result == 0}">
									<img src="/fin/resources/img/coupon/20퍼센트채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'VIP'}">
									<img src="/fin/resources/img/coupon/20퍼센트채도.png"
										class="coupon_img">
								</c:if> <br> <br></td>



							<td><br> <br> <c:if
									test="${member.grade == 'GOLD' && point_result == 1}">
									<a href="memberCoupon?name=2000원 할인쿠폰&contents=2000&kind=포인트">
										<img src="/fin/resources/img/coupon/2000원.png"
										class="coupon_img">
									</a>
									<br>
									<br>
								</c:if> <c:if test="${member.grade == 'GOLD' && point_result == 0}">
									<img src="/fin/resources/img/coupon/2000원채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'GOLD'}">
									<img src="/fin/resources/img/coupon/2000원채도.png"
										class="coupon_img"><br><br>
								</c:if> <br> <span style="color: #d9d9d9;">-----------------------------</span>
								<br> <br> <br> <c:if
									test="${member.grade == 'GOLD' && percent_result == 1}">
									<a href="memberCoupon?name=15퍼센트 할인쿠폰&contents=15&kind=퍼센트">
										<img src="/fin/resources/img/coupon/15퍼센트.png"
										class="coupon_img">
									</a>
									<br>
								</c:if> <c:if test="${member.grade == 'GOLD' && percent_result == 0}">
									<img src="/fin/resources/img/coupon/15퍼센트채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'GOLD'}">
									<img src="/fin/resources/img/coupon/15퍼센트채도.png"
										class="coupon_img">
								</c:if> <br> <br></td>




							<td><br> <br> <c:if
									test="${member.grade == 'SILVER' && point_result == 1}">
									<a href="memberCoupon?name=1000원 할인쿠폰&contents=1000&kind=포인트">
										<img src="/fin/resources/img/coupon/1000원.png"
										class="coupon_img">
									</a>
									<br>
									<br>
								</c:if> <c:if test="${member.grade == 'SILVER' && point_result == 0}">
									<img src="/fin/resources/img/coupon/1000원채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'SILVER'}">
									<img src="/fin/resources/img/coupon/1000원채도.png"
										class="coupon_img"><br><br>
								</c:if> <br> <span style="color: #d9d9d9;">-----------------------------</span>
								<br> <br> <br> <c:if
									test="${member.grade == 'SILVER' && percent_result == 1}">
									<a href="memberCoupon?name=10퍼센트 할인쿠폰&contents=10&kind=퍼센트">
										<img src="/fin/resources/img/coupon/10퍼센트.png"
										class="coupon_img">
									</a>
									<br>
								</c:if> <c:if test="${member.grade == 'SILVER' && percent_result == 0}">
									<img src="/fin/resources/img/coupon/10퍼센트채도.png"
										class="coupon_img">
									<br>
									<span
										style="line-height: 330%; font-size: 0.9em; font-weight: bolder;">다운로드
										완료</span>
								</c:if> <c:if test="${member.grade != 'SILVER'}">
									<img src="/fin/resources/img/coupon/10퍼센트채도.png"
										class="coupon_img">
								</c:if> <br> <br></td>




							<td style="vertical-align: middle; font-size: 0.9em;"><span
								style="font-weight: bolder;">반갑습니다!</span> <br> <br>
								SILVER 등급 <br> 조건 충족 시 <br> 다양한 멤버십 혜택을 <br> 누릴 수
								있습니다.</td>
						</tr>
					</table>

					<br> <br> <span
						style="font-size: 1.5em; font-weight: bolder;"> 꼭 알아두세요!</span><br>
					<br>

					<div style="outline: 1px solid #d9d9d9;">

						<div style="padding: 30px; line-height: 200%; font-size: 0.9em;">
							· 최근 3개월간 1일 ~ 말일까지의 구매건수(딜 개수 기준)와 구매금액을 합산하여 매월 1일 등급을 부여합니다. <span
								style="font-size: 0.85em; color: #737373;"><br>
								<span>　</span>(딜 개수 기준이므로, 한
								딜에서 여러 개의 옵션을 구매했더라도 구매건수는 1개로 반영됩니다.)</span> <br> · 등급의 유효기간은 매월
							1일 ~ 당월 마지막 날까지입니다. <br> · 구매 건수 집계 시 <span
								style="color: #179f96;"> 0원 딜과 기프트샵, 실시간 항공권, 일부 상품권 구매
								건수는 포함되지 않습니다. </span><br> · 구매 금액 집계 시 <span
								style="color: #179f96;">쿠폰 사용 금액, 적립금 사용 금액, 배송비 금액은 구매
								내역에 포함되며 기프트샵, 실시간 항공권 및 일부 상품권 구매는 포함되지 않습니다.</span> <br> · 각 등급별
							산정 기준 및 혜택은 당사 사정에 따라 변경 될 수 있습니다. <br> · 당사는 멤버십 악용 사례를
							주기적으로 조사하고 있으며 발견시 등급 박탈 및 피해 보상 청구 등 법적 조치가 진행됩니다. <br>
						</div>

					</div>
					<br> <br> <br> <br>

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