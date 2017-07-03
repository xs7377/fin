<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.confirm_wrap {
	width: 1100px;
	height: 500px;
	margin: 100px auto; 
} 

.confirm {
	width: 670px;  
	height: 65px;
	font-size: 3em;
	font-weight: bolder;
	font-weight: bolder;  
	color: #333333;
	margin: 0 auto;
}
.confirm_1 {
	width: 470px;
	font-size: 1em;
	font-weight: bolder;
	color:  #808080;   
	margin: 0 auto;  
} 
.confirm_table{
	width: 800px;
	height: 260px; 
	margin: 0 auto;  
	outline: 3px dotted #bfbfbf;   
}
.confirm_table_td{
	width: 150px;
	height: 185px;  
	margin: 0 auto;
	text-align: center; 
}  
.confirm_font{ 
	font-weight: bolder;
	color: #4d4d4d; 
}
</style> 
</head> 
<body>
	<%@ include file="../sub/header.jspf"%>  
	<section class="confirm_wrap">
		<div class="confirm" style="font-family:Georgia;">IDENTITY VERIFICATION</div>
		<br> <div class="confirm_1">다음의 방법 중 가능한 방법을 선택하여, 본인 인증을 해주세요.</div>
		<br><br><br>
		<table class="confirm_table">
			<tr>
				<td>
				<div class="confirm_table_td"><a href="emailConfirm"><img id="memberConfirm_email" alt="" src="../resources/img/email2.png" width="150px" height="150px"></a><br><br>
				<span class="confirm_font">E-MAIL</span></div>				
				</td>

				<td>
				<div class="confirm_table_td"><a href="phoneConfirm"><img id="memberConfirm_phone" alt="" src="../resources/img/phone.png" width="150px" height="150px"></a><br><br>
				<span class="confirm_font">PHONE</span></div>
				</td>
			</tr> 
		</table> 
	</section>
	<%@ include file="../sub/footer.jspf"%>
</body>
</html>