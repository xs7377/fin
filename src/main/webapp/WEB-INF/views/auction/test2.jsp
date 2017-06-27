<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.al-container{
	width:1600px;
	margin: 20px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
.al-sideNav{
	height:650px;
	width: 200px;
	padding: 20px;
	margin-bottom:20px;
	float: left;
	border: 1px solid #bcbcbc;
}
.al-pri{
	 height: 350px;
	 width: 1285px;
     padding: 20px;
     margin-bottom: 20px;
     float: right;
     border: 1px solid #bcbcbc;
}
.al-nor1, .al-nor2, .al-nor3, .al-nor4{
	height: 350px;
	width:275px;	
	padding: 20px;
    margin-bottom: 20px;
    margin-left:20px;
    float:right;
	border: 1px solid #bcbcbc; 
}
.al-footer{
	clear: both;
	padding: 20px;
    border: 1px solid #bcbcbc;
}
@media(max-width:1600px){
.al-container{
	width:auto;
}
.al-sideNav{
	float:none;
	width:auto;
	height: 170px;
}
.al-pri{
	float:none;
	width:auto;
}
.al-nor1, .al-nor3{
	float:left;
	margin-left:0;
	width:275px;
}
.al-nor2, .al-nor4{
	float:right;
	width:275px;
}
}
@media(max-width:750px){
.al-nor1, .al-nor2, .al-nor3, .al-nor4{
	margin:15px auto;
	float:none;
	width:275px;
}
}
@media(max-width:450px){
.al-nor1, .al-nor2, .al-nor3, .al-nor4{
	margin:15px auto;
	float:none;
	width:auto;
}
}
</style>
</head>
<body>
<div class="al-container">
	<div class="al-sideNav">sideNav</div>
	<div class="al-pri">pri</div>
	<div class="al-nor1">nor1</div>
	<div class="al-nor2">nor2</div>
	<div class="al-nor3">nor3</div>
	<div class="al-nor4">nor4</div>
	<div class="al-footer">footer</div>
</div>
</body>
</html>