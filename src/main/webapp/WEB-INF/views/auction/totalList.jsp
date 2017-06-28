<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	box-sizing: border-box;
	word-wrap:break-word;
	word-break:break-all;
	border-collapse: collapse;
	font-family: NanumGothic;
}
.t-container{
	width: 1500px;
	margin: 10px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
	background-color: white;
}
.t-board-con{
	width: 1300px;
	height:400px;
	margin: 10px auto;
	border: 1px solid #bcbcbc;
}
.t-con-title{
	width: 1300px;
	height:70px;
	margin: 10px auto;
	border: 1px solid #bcbcbc;
}
.t-paging{
	width: 1300px;
	height:40px;
	margin: 10px auto;
	border: 1px solid #bcbcbc;
}
.t-auc-con{
	width: 1300px;
	height: 600px;
	margin: 10px auto;
	border: 1px solid #bcbcbc;
}
.t-footer{
	clear: both;
	padding: 20px;
    border: 1px solid #bcbcbc;
}
</style>
</head>
<body>
	<div class="t-container">
		<div class="t-con-title"></div>
		<div class="t-board-con"></div>
		<div class="t-paging"></div>
		<div class="t-con-title"></div>
		<div class="t-auc-con"></div>
		<div class="t-paging"></div>
		<div class="t-footer"></div>
	</div>
</body>
</html>