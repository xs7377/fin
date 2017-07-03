<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	
 	function use() {
		var member_id = opener.document.getElementById("member_id");
		var member_id_check = opener.document.getElementById("member_id_check");
		var id2 = document.getElementById("id2");

		if (id2.value == "" || id2.value == null) {
			alert("아이디를 입력해주세요.");
		}  else {
			member_id_check.value = 0;
			member_id.value = id2.value;
			window.close();
		}
	}
 	
 	var result = '${result}';
 	var id = '${param.id}';
	$(function() {
		$("#btn").click(function() {
			document.frm.submit();
		});
		
		var id2 = document.getElementById("id2");
		if(id2.value == "") {
			document.getElementById("id_check").innerHTML = "아이디를 입력해주세요."; 
		} else if (!/^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/.test(id2.value)) {
			document.getElementById("id_check").innerHTML = "아이디 형식이 틀립니다. 다시 입력해주세요."; 
		} else if(result == 'true'){
			document.getElementById("id_check").innerHTML = "사용 가능한 아이디입니다."+ '<input type="button" value="사용" id="use" onclick="use()">'; 
		} else if(result == 'false') {
			document.getElementById("id_check").innerHTML = "이미 사용 중인 아이디입니다."; 
		} else {
			document.getElementById("id_check").innerHTML = "중복 확인 버튼을 클릭해주세요."; 
		}
		
		
		$("#id2").keyup(function(){
			if(!/^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/.test(id2.value)){
				document.getElementById("id_check").innerHTML = "아이디 형식이 틀립니다. 다시 입력해주세요.";
				document.getElementById("id_check").style.color = 'red';
			} else {
				document.getElementById("id_check").innerHTML = "";
			}
		}); 
		
	}); 
</script>
<style type="text/css">
#btn {
	height: 20px;
	background-color: #b3b3b3;
	line-height: 100%;
	color: white;
	border: none;
	margin-left: 20px;
}

#use {
	display: block;
	height: 20px;
	background-color: #b3b3b3;
	line-height: 100%;
	color: white;
	border: none;
	margin: 15px auto 0px auto;
}

#id_check {
	font-size: 0.7em; 
	margin-left: 20px;
}

</style>
</head>
<body>
	<form action="idCheck" name="frm" method="post">
		ID <input type="text" name="id" id="id2" value="${param.id}">
		<input type="button" id="btn" value="중복확인">
	</form> 
	<div id="id_check"></div>
	
	<%-- <c:if test="${result == true && param.id != ''}"> 
		<div class="id_check">사용 가능한 아이디입니다.</div>
		<input type="button" value="사용" id="use" onclick="use()">
		<br>
	</c:if>
	
	<c:if test="${result == false}">
		<div class="id_check">이미 사용 중인 아이디입니다.</div>
	</c:if>
	
	<c:if test="${param.id == ''}">
		<div class="id_check">아이디를 입력해주세요.</div>
	</c:if> --%>
	
</body>
</html>