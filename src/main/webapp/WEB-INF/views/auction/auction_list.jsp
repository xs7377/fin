<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		$.makeArray($(".aucNum").map(function(){
			/* alert($(this).text()); */
			var aucNum=$(this).text();
			$.ajax({
				url:"./selectThum",
				type:"post",
				data:{
					num:aucNum
				},
				success:function(data){
					$("#thum"+aucNum).html(data);
				}
			});
			var buyInfo=$("#buyInfo"+aucNum).val();
			buyInfo=buyInfo.split(",");
			if(buyInfo[0]==''||buyInfo[0]==null){
				buyInfo[0]='없음';
			}	
			if(buyInfo[1]==''||buyInfo[1]==null){
				buyInfo[1]='없음';
			}
			$("#buyer_id"+aucNum).html(
				buyInfo[0]		
			);
			$("#buyer_price"+aucNum).html(
				buyInfo[1]		
			);
		}));
	});
});
</script>
<title>Insert title here</title>
<style type="text/css">
table{
	border-collapse: collapse;
}
td{
	border: 1px solid black;
	width: 150px;
	height: 30px;
}
</style>
</head>
<body>
<h1>Auction List</h1>
	<div id="searching">
		<form action="./auctionList" method="post">
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
	</div>
	<div id="paging">
		<c:if test="${pageResult.curBlock>1}">
			<span class="go" id="${pageResult.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
			<span class="go" id="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
			<span class="go" id="${pageResult.lastNum+1}">[다음]</span>
		</c:if>
	</div>
	<table>
		<tr>
			<td>글번호</td>
			<td>사진</td>
			<td>판매자</td>
			<td>제목</td>
			<td>최소가</td>
			<td>낙찰가</td>
			<td>현재 입찰자</td>
			<td>현재 입찰가</td>
			<td>기간</td>
		</tr>
		<c:forEach items="${aucList}" var="li">
			<tr>
				<td class="aucNum">${li.num }</td>
				<td id="thum${li.num}"></td>
				<td>${li.m_id }</td>
				<td>${li.title}</td>
				<td>${li.min_price}</td>
				<td>${li.max_price }</td>
				<td id="buyer_id${li.num}"></td>
				<td id="buyer_price${li.num}">
					<input type="hidden" value="${li.buyer}" id="buyInfo${li.num}">
				</td>
				<td>${li.period}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="al_wrap" style="width:200px;height:300px;background-color: orange">
		<div class="al_m_id"></div>
		<div class="al_img"></div>
		<div class="al_title"></div>
		<div class="al_price"></div>
		<div class="al_buyer"></div>
		<div class="al_period"></div>
	</div>
</body>
</html>