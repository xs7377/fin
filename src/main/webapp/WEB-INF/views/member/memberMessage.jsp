<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<style type="text/css">

body{
	font-size: 16px;
	font-family: inherit;
}
.mypage_wrap {
	width: 1300px;  
	height: 600px;  
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

div.panel {
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
$(function() {
	

	$("#sTable").on("click",".sMessage",function(){
		var num=$(this).attr("id");
		alert(num);
		window.open("../message/messageView?send_check=0&num="+num,"Send","width=500 , height=550");
		
	})
	
	$("#rTable").on("click",".rMessage",function(){
		var num=$(this).attr("id");
		alert(num);
		window.open("../message/messageView?send_check=1&num="+num,"Send","width=500 , height=550");
		
	})
	
	
function getResult(result, num, m_id, title, read, reg_date) {
	result = result + "<tr>";
	result = result + "<td>";
	result = result + num;
	result = result + "</td>";

	result = result + "<td>";
	result = result +  m_id;
	result = result + "</td>";

	result = result + "<td>";
	result = result + title;
	result = result + "</td>";

	result = result + "<td>";
	result = result + read;
	result = result + "</td>";

	result = result + "<td>";
	result = result + reg_date;
	result = result + "</td>";

	result = result + "</tr>";

	return result;
}
	
	
	
	
	
});

function openCity(evt, menuList) {
	  var i, x, tablinks;
	  x = document.getElementsByClassName("menuList");
	  for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < x.length; i++) {
	      tablinks[i].className = tablinks[i].className.replace(" change", "");
	  }
	  document.getElementById(menuList).style.display = "block";
	  evt.currentTarget.className += " change";
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
	
		<div class="panel"></div>
	 
	<!--@hyo3  -->	
		
		<a href="/fin/member/memberView" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-user"></span> 나의 정보
		</button> 
		</a> 
		
		<div class="panel"></div>


		<button class="accordion">
			<span class="glyphicon glyphicon-envelope"></span> 나의 쪽지
		</button>
	
		
		<div class="panel">
			<dl>
				<dd class="w3-bar-item w3-button tablink" onclick="openCity(event,'sendM')">
					<a href="/fin/member/memberMessage?id=${member.id }" id="sendList" style="font-weight: normal; font-size: 0.9em;" > 보낸 쪽지함</a>
				</dd>
				<dd class="w3-bar-item w3-button tablink" onclick="openCity(event,'recvM')">
					<a href="#" id="reciveList" style="font-weight: normal; font-size: 0.9em;" > 받은 쪽지함 </a>
				</dd>
			</dl>
		</div>
		

		<button class="accordion">
			<span class="glyphicon glyphicon-ok-circle"></span> 나의 출석
		</button>
		<div class="panel"></div>

	<a href="/fin/member/memberPoint">
		<button class="accordion">
			<span class="glyphicon glyphicon-heart"></span> 포인트 몰
		</button>
		</a>
		
		 
		<div class="panel"></div>

		<button class="accordion">
			<span class="glyphicon glyphicon-shopping-cart"></span> 구매 관련
		</button>
		<div class="panel">
			<dl>
				<dd>
					<a href="#" style="font-weight: normal; font-size: 0.9em;">입찰 중 상품</a>
				</dd>
				<dd>
					<a href="#" style="font-weight: normal; font-size: 0.9em;">구매 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/likesProduct?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">관심 상품</a>
				</dd>
				<dd>
					<a href="#" style="font-weight: normal; font-size: 0.9em;">구매 완료 상품</a>
				</dd>
			</dl>
		</div>

		<button class="accordion">
			<span class="glyphicon glyphicon-usd"></span> 판매 관련
		</button>
		<div class="panel">
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




<!--쪽지@hyo2 일단 만짐  -->
<div id="sendM" class="w3-container w3-border menuList" style="width: 1050px; float: right;">
   <h2 style="font-family: Georgia; font-weight: bolder;">SEND MESSAGE</h2>
   	  
  <table class="table" id="sTable" style="text-align: center; font-size: 0.9em;">
    <tr id="add" style="font-weight: bolder;"><td>NO</td><td colspan="2">TO</td><td>제목</td><td>READ</td><td>보낸날짜</td> </tr>
    
    <c:forEach items="${sendList}" var="list">
    <tr>
    <td>${list.num} </td>
  	<td>${list.to_id}</td>
    <td colspan="2"><a href="#" id="${list.num}" class="sMessage"> ${list.title} </a></td>
    <c:if test="${list.read==0}">
    	<td>안 읽음</td>
    </c:if>
    <c:if test="${list.read==1}">
    	<td>읽음</td>
    </c:if>
    <td>${list.reg_date }</td>
    
    </tr>
    </c:forEach>
    
  </table>
   	 

</div>
<!-- 쪽지끝 -->


<!-- 받은 쪽지 -->
<div id="recvM" class="w3-container w3-border menuList" style="width: 1050px; float: right; display: none;">
   	 <h2 style="font-family: Georgia; font-weight: bolder;">RECEIVE MESSAGE</h2>
   	 <table class="table" id="rTable" style="text-align: center; font-size: 0.9em;">
    <tr id="add" style="font-weight: bolder;"><td>NO</td><td colspan="2">FROM</td><td>제목</td><td>READ</td><td>보낸날짜</td> </tr>
    
    <c:forEach items="${recvList}" var="list">
    <tr>
    <td>${list.num} </td>
  	<td>${list.from_id}</td>
    <td colspan="2"><a href="#" id="${list.num}" class="rMessage"> ${list.title}</a> </td>
    <c:if test="${list.read==0}">
    	<td>안 읽음</td>
    </c:if>
    <c:if test="${list.read==1}">
    	<td>읽음</td>
    </c:if>
    <td>${list.reg_date }</td>
    
    </tr>
    </c:forEach>
    
  </table>
   	 
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