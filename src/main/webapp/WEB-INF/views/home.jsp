<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>The time on the server is ${serverTime}. </P>
<form action="./auction/auctionWriteFrm" method="post">
	<button>글쓰기</button>
</form><br>
<form action="./auction/auctionMod" method="post">
	<input type="number" name="num" placeholder="num">
	<button>수정하기</button>
</form><br>
<form action="./auction/auctionList" method="post">
	curPage<input type="text" name="curPage" value="1"><br>
	perPage<input type="text" name="perPage" value="10"><br>
	category<input type="text" name="category"><br>
	search<input type="text" name="search" ><br>
	<select name="kind">
		<option value="titleContents" label="제목+내용">제목+내용</option>
		<option value="id" label="아이디로찾기">아이디</option>
	</select><br><br>
	<button>옥션리스트보기</button>
</form>

<a href="./auction/category">카테고리</a>
<a href="./auction/totalList">통합페이지</a>
<a href="./auction/test1">테스트11</a>
<a href="./auction/test2">테스트22</a>
<a href="./auction/test3">테스트33</a>
<a href="./auction/test4">테스트44</a>
</body>
</html>
