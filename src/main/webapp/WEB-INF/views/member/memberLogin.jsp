<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String id="";
	Cookie [] cookies= request.getCookies();
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("id")){
			id=cookies[i].getValue();
			break;
		}
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.login_wrap{
	width: 1100px;
	height: 400px;
	margin: 100px auto; 
}
.login{ 
	width: 427px;
	height: 65px;
	font-size: 3em;
	font-weight: bolder;  
	color: #333333;  
	margin: 0 auto;
}
.memberlogin_form{
	width: 400px;
	height: 50px;
}
.memberlogin_wrap{
	width: 400px;
	margin: 0 auto;
}
.memberlogin_btn{
	width: 400px;
	height: 50px;
	display: block;
	background-color: #ff4d4d;
	font-weight: bold;
	margin: 10px auto;
	text-align: center;
	line-height: 100%;
	color: white;
	font-size: 0.95em;
	border: none;
	cursor: pointer;
}
a{
	text-decoration: none;
	color: #595959;
	font-weight: bolder; 
}
.memberlogin_bottom{
	width: 265px;
	margin: 0 auto;
}  
</style> 
<script type="text/javascript">


</script>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>
	
	<section class="login_wrap">
	<div class="login" style="font-family:Georgia;">MEMBER LOGIN</div><br><br>
	<input type="hidden" id="id_check" value="0">
	<form action="memberLogin" method="post" name="frm">
	<div class="memberlogin_wrap">
	<input type="text" class="memberlogin_form" name="id" placeholder="ID" value="<%=id%>"> <br><br>
	
	<input type="password" class="memberlogin_form" name="pw" placeholder="PASSWORD"> <br><br>
	
	<button class="memberlogin_btn">로그인</button>
	<input type="checkbox" id="idcheck" name="idcheck" value="idcheck" > <span style="font-size: 0.8em;">아이디 저장</span> <br><br><br>
	<div class="memberlogin_bottom">
	<a href="memberAgree" style="font-size: 0.8em; font-style: normal;">회원가입</a>
	<a href="memberFindId" style="font-size: 0.8em; font-style: normal;">아이디찾기</a>
	<a href="memberFindPw" style="font-size: 0.8em; font-style: normal;">비밀번호찾기</a>
	<br><br><br>
	</div>
	</div>
	</form> 
	</section>
	<%@ include file="../sub/footer.jspf"%>
</body>
</html>