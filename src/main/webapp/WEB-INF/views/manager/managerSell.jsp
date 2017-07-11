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

<div style="width: 1050px; height: 700px;  display: inline-block; float: right; background-color: yellow;">
<h2 style="font-size: 2.5em; font-family: Georgia; font-weight: bolder; margin-top: 20px;">TRANSACTIONAL INFORMATION</h2><br><br>

 	<table id="Mtable" class="table table-hover" style="font-size: 0.9em;">
		<tr class="sellIng_tr" style="text-align: center; font-family: Georgia; font-weight: bolder;
		height: 50px; vertical-align: middle;
	line-height: 100%;">
		<td style="vertical-align: middle; font-family: Georgia; font-weight: bolder; width: 300px;">SELLER</td>
		<td style="vertical-align: middle; font-family: Georgia; font-weight: bolder; width: 200px;">TRADE COUNT</td>
		<td style="vertical-align: middle; font-family: Georgia; font-weight: bolder;">PRICE</td>
		<td style="vertical-align: middle; font-family: Georgia; font-weight: bolder; width: 250px;">CHECK</td>
		</tr>
	

	<c:forEach items="${list}" var="f">
			<tr style="text-align: center; ">
		<td style="vertical-align: middle;">${f.m_id}</td>
		<td style="vertical-align: middle;">${f.num}</td>
		<td style="vertical-align: middle;">${f.price}원</td>
		<td style="vertical-align: middle;"><input type="radio" value="${f.m_id }" name="m_id"></td>
			</tr>
		</c:forEach>
		
		<tr><td></td><td></td><td></td><td></td></tr>
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