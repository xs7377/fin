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
.paging{
	margin-top: 20px; 
	margin-left: 500px;
}
</style>
<script type="text/javascript">
$(function(){

	var id = '${member.id}'
	$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="likesProduct?curPage="+curPage+"&id="+id;
		}); 
});
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
	
	
<div style="width: 1050px; height: 700px; float: right;">
 <table id="Mtable" class="table table-hover" style="font-size: 0.9em;">
		<tr class="sellIng_tr" style="text-align: center; font-family: Georgia; font-weight: bolder;
		height: 50px; vertical-align: middle;
	line-height: 100%;">
		<td style="vertical-align: middle;">CATEGORY</td>
		<td style="vertical-align: middle;">SELLER</td>
		<td style="vertical-align: middle;">TITLE</td>
		<td style="vertical-align: middle;">MIN_PRICE</td>
		<td style="vertical-align: middle;">MAX_PRICE</td>
		<td style="vertical-align: middle;">BUYER</td>
		<td style="vertical-align: middle;">PRICE</td>
		<td style="vertical-align: middle;">DATE</td>
		</tr>
	

	<c:forEach items="${list}" var="f">
			<tr style="text-align: center; ">
		<td style="width: 150px; vertical-align: middle;">${f.category}</td>
		<td style="width: 100px; vertical-align: middle;">${f.m_id}</td>
		<td style="vertical-align: middle;"><a href="/fin/auction/auctionView/${f.num}">${f.title}</a></td>
		<td style="width: 100px; vertical-align: middle;">${f.min_price}원</td>
		<td style="width: 100px; vertical-align: middle;">${f.max_price}원</td>
		
		<c:if test="${f.buyer != null}">
		<td style="width: 100px; vertical-align: middle;">${f.buyer}</td>
		</c:if>
		
		<c:if test="${f.buyer == null}">
		<td style="width: 100px; vertical-align: middle;">입찰자 없음</td>
		</c:if>
		
		<td style="width: 100px; vertical-align: middle;">${f.price}원</td>
		<td style="width: 100px; vertical-align: middle;">${f.reg_date}</td>
			</tr>
		</c:forEach>

	<c:if test="${list == '[]'}">
		<tr>
		<td colspan="8" style="text-align: center;">관심 상품이 없습니다.</td>
		</tr>
	
	</c:if>
		
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
	</table> 
<div class="paging">
		<c:if test="${pageResult.curBlock>1}">
			<span class="go" id="${pageResult.startNum-1}" style="cursor: pointer; font-weight: bolder;">[이전]</span>
		</c:if>
		<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
			<span class="go" id="${i}" style="cursor: pointer; font-weight: bolder;">${i}</span>
		</c:forEach>
		<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
			<span class="go" id="${pageResult.lastNum+1}" style="cursor: pointer; font-weight: bolder;">[다음]</span>
		</c:if>
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