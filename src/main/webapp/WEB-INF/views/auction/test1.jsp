<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		$("#rollText1").mouseenter(function(){
			$(this).hide();		
			$("#test").show();
		});
		$("#test").mouseleave(function(){
			$("#rollText1").show();
			$("#test").hide();
		});
		
	});
		function rolling(options) {
			var self = this;
			this.object = document.getElementById(options.rollId);
			//this.object.onmouseover = function() { self.stop(); };
			//this.object.onmouseout = function() { self.play(); };
			this.delay = options.delay || 1000;
			this.speed = options.speed || 50;
			this.step = options.step || 1;
			this.mover = options.mover || false;
			this.elChildHeight = options.childHeight;
			this.elHeight = this.object.offsetHeight;
			this.elPosition = 0;
			this.object.appendChild(this.object.cloneNode(true));
			this.control = setTimeout(function() {self.play()}, this.delay);
		}
		rolling.prototype = {
			play:function() {
				var self = this, time;
				this.elPosition = this.elPosition>(this.mover?this.elHeight:0) ? this.elPosition-this.elHeight : this.elPosition+1;
				this.object.style.top = (this.mover ? -this.elPosition : this.elPosition) + "px";
				this.control = setTimeout(function() {self.play()}, this.elPosition%(this.elChildHeight*this.step)==0?this.delay:this.speed);
			},
			stop:function() {
				clearTimeout(this.control);
			}
		}
		var roll1 = null, roll2 = null;
		window.onload = function() {
			roll1 =  new rolling({rollId: "rollText1", delay: 2000, speed: 10, step: 1, mover: true, childHeight: 27});
		}	
</script>
<title>Insert title here</title>
<style type="text/css">
div{
	font-size: 20px;
}
</style>
</head>
<body>
	<c:forEach items="${search}" var="s">
		${s}
	</c:forEach>
	<div style="overflow:hidden; width: 200px; height: 35px; border:1px solid #ccc;">
		<div id="rollText1" style="position:relative; top:0;">
			<div>test1</div>
			<div>test2</div>
			<div>test3</div>
			<div>test4</div>
			<div>test5</div>
			<div>test6</div>
		</div>
		<div id="test" hidden="" style="border: 1px solid black;width:200px;height: 200px;position: absolute;background-color: white;">
		sadfasdfasdfasdf
		</div>
	</div>
	
</body>
</html>