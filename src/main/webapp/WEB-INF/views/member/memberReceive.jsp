<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
}

.memberMypage_wrap {
	width: 800px;
	margin: 0 auto;
}

.memberMypage_btn {
	width: 100px;
	height: 30px;
	background-color: #ff4d4d;
	font-weight: bold;
	text-align: center;
	line-height: 100%;
	color: white;
	font-size: 0.95em;
	border: none;
	cursor: pointer;
	display: inline-block;
	margin-right: 20px;
}

.mermberMypage_td {
	font-weight: bolder;
	color: #595959;
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

.memberInfo{
	font-size: 3em;
	font-weight: bolder;
	color: #4d4d4d;
}
</style>

<script type="text/javascript">
$(function() {
	
	$(".messageRead").click(function() {
		var num=$(this).attr("id");
		alert(num);
		window.open("../message/messageView?num="+num,"MessageRead","width=500 , height=500");
		
		
	})
	
	
	
	
});

</script>



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
    <a href="/fin/member/memberReceive?to_id=${member.id}" class="w3-bar-item w3-button">받은쪽지함</a>
    <a href="/fin/member/memberSend?from_id=${member.id}" class="w3-bar-item w3-button">보낸쪽지함</a>
   
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
<!--여기서부터 List를 합시다.  -->


<div id="bodyWrap">


<h2>받은 메시지</h2>
<!--내용이 들어올거예요  -->
	<div id="contentsWrap">

		<table class="table table-striped">
		<tr>
		<td>번호</td> <td>FROM</td><td>TITLE</td><td>보낸날</td><td>읽음</td>
		</tr>

		<c:forEach items="${list}" var="msg">
		
		<tr>
		
		<td >${msg.num}</td>
		<td>${msg.from_id}</td>
		<td>
		
		<a href="#" id="${msg.num}" class="messageRead">${msg.title}</a>
		</td>
		<td>${msg.reg_date }</td>
		<td>
		<c:choose>
			<c:when test="${msg.read eq 1 }">
					읽음
			</c:when>
			<c:otherwise>
					안읽음
			</c:otherwise>
		</c:choose>
		</td>
		
		
		</tr>		
		
		
		
		</c:forEach>
		</table>




	</div>





</div>







<%@ include file="../sub/footer.jspf"%>
</body>
</html>