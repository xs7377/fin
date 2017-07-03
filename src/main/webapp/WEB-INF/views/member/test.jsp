<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
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

div.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    margin-bottom: 0px;
    border: none;
}
a{
	color: #595959;
	line-height: 250%;
}
</style>
</head>

<button class="accordion"><span class="glyphicon glyphicon-user"></span> 나의 정보</button> 
<div class="panel">
</div>

<button class="accordion"><span class="glyphicon glyphicon-envelope"></span> 나의 쪽지</button>
<div class="panel">
<dl>
<dd><a href="#">보낸 쪽지함</a></dd>
<dd><a href="#"> 받은 쪽지함 </a></dd>
</dl>
</div>

<button class="accordion"><span class="glyphicon glyphicon-ok-circle"></span> 나의 출석</button>
<div class="panel">
</div>

<button class="accordion"><span class="glyphicon glyphicon-heart"></span> 포인트 몰</button>
<div class="panel">
</div>

<button class="accordion"><span class="glyphicon glyphicon-shopping-cart"></span> 구매 관련</button>
<div class="panel">
<dl>
<dd><a href="#">입찰 중 상품</a></dd>
<dd><a href="#">구매 중 상품</a></dd>
<dd><a href="#">관심 상품</a></dd>
<dd><a href="#">구매 완료 상품</a></dd>
</dl>
</div>

<button class="accordion"><span class="glyphicon glyphicon-usd"></span> 판매 관련</button>
<div class="panel">
<dl>
<dd><a href="#">판매 중 상품</a></dd>
<dd><a href="#">판매 완료 상품</a></dd>
</dl>
</div>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].onclick = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  }
}
</script>

</body>
</html>