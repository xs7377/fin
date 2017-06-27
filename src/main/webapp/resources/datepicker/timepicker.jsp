<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
	$(document).ready(function(){
		$('.timepicker').timepicker({
		    timeFormat: 'HH:mm',
		    interval: 60,
		    minTime: '00:00',
		    maxTime: '23:00',
		    defaultTime: p,
		    startTime: '00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: false
		});
	});
});
</script>
</head>
<body>
<input type="text"  class="timepicker" readonly="readonly" name="period">

</body>
</html>