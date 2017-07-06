<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var height =  $(".notice").height();
	var num = $(".rolling li").length;
	var max = height * num;
	var move = 0;
	function noticeRolling(){
		move += height;
		$(".rolling").animate({"top":-move},600,function(){
			if( move >= max ){
				$(this).css("top",0);
				move = 0;
			};
		});
	};
	noticeRollingOff = setInterval(noticeRolling,1000);
	$(".rolling").append($(".rolling li").first().clone());

	$(".rolling_stop").click(function(){
		clearInterval(noticeRollingOff);
	});
	$(".rolling_start").click(function(){
		noticeRollingOff = setInterval(noticeRolling,1000);
	});
});		
</script>
<title>Insert title here</title>
<style>
		
		/* 또군css */
		.notice{width:100%; height:50px; overflow:hidden; background-color:#fff;}
		.rolling{position:relative; width:100%; height:auto;}
		.rolling li{width:100%; height:50px; line-height:50px;}
		.rolling_stop{display:block; width:100px; height:20px; background-color:#000; color:#fff; text-align:center;}
		.rolling_start{display:block; width:100px; height:20px; background-color:#000; color:#0f0; text-align:center;}
	</style>
</head>
<body>
<div class="notice">
	<ul class="rolling">
		<li>
			<a href="#">공지사항 내용 1입니다.</a>
		</li>
		<li>
			<a href="#">공지사항 내용 2입니다.</a>
		</li>
		<li>
			<a href="#">공지사항 내용 3입니다.</a>
		</li>
		<li>
			<a href="#">공지사항 내용 4입니다.</a>
		</li>
		<li>
			<a href="#">공지사항 내용 5입니다.</a>
		</li>
	</ul>
</div>
</body>
</html>