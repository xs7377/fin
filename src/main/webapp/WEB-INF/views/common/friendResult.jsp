<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var message='${msg}';
if(message !=''){
	alert(message);
}
</script>
</head>
<body>

<form action="">

<div>
<ul>
	<li>1. 납품자명:<input type="text" placeholder="name"></li>

</ul>
<p>1. 납품자명:<input type="text" placeholder="name"></p>
<i>2. email:<input type="email" placeholder="answs@naver.com"></i>
<i>3. 홈페이지:<input type="url" placeholder="http://"></i>
</div>

<div>
<ul>
<li>상품명:<input type="text" placeholder="name"><li>
<li>  납품수량:<input type="number" placeholder="최소 10이상"></li>
<li> 납품등급:<input type="range" min="10"  ></li>
<li> 기타사항:<textarea rows="10" cols="30"></textarea></li>
</ul>
</div>

<button>send message</button>

</form>




</body>
</html>