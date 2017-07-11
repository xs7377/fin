<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	height: 750px;  
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
#reportRead{
	width: 100px;
	height: 35px;
	background-color: #cccccc;
	font-weight: bold;
	text-align: center;
	line-height: 100%;
	color: white;
	font-size: 0.95em;
	border: none;
	cursor: pointer;
}
	.paging{
		margin : 30px auto;
		margin-left: 500px;
	}
	.go{ 
		cursor: pointer;
		font-weight: bold;
	}
	 
</style>
<script type="text/javascript">
$(function() {
	
	$(".go").click(function(){
		var curPage=$(this).attr("id");
		location.href="managerReport?curPage="+curPage;
	}); 
	
	$("#rTable").on("click","#reportRead",function(){
		var num=$(this).attr("class");
		alert(num);
		window.open("../report/reportView?num="+num,"REPORT","width=500 , height=550");
		
	});
});
</script>
</head>
<body>
<%@ include file="../sub/header.jspf"%>
<section class="mypage_wrap">

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

<div style="width: 1050px; height: 700px;  display: inline-block; float: right;">
<div id="report" class="w3-container w3-border city" >
    <h2 style="font-size: 2.5em; font-family: Georgia; font-weight: bolder; margin-top: 20px;">REPORT BOARD</h2><br><br>
    
    <table class="table" id="rTable" style="text-align: center; vertical-align: middle;">
    <tr style="font-weight: bolder;">
    <td>NO</td><td>FROM</td><td>TO</td><td>CONTENTS</td><td>READ</td>
    </tr>
    <c:forEach items="${list}" var="list">
    <tr>
    <td>${list.num}</td>
  	<td>${list.from_id}</td>
    <td>${list.to_id} </td>
    <td>${list.contents}</td>
    <c:if test="${list.check_num==0}">
    	<td><button id="reportRead" class="${list.num}">신고 대기</button></td>
    </c:if>
    <c:if test="${list.check_num==1}">
    	<td><button id="reportRead" class="${list.num}">신고 접수</button></td>
    </c:if>
    </tr>
    </c:forEach>
    </table>
 </div>
 
 
 <div class="paging">
		<c:if test="${pageResult.curBlock>1}">
			<span class="go" id="${pageResult.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
			<span class="go" id="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
			<span class="go" id="${pageResult.lastNum+1}">[다음]</span>
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