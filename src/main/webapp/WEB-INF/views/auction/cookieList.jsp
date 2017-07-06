<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js?ver=1"></script>
<script type="text/javascript">
	$(function(){
		$(document).ready(function(){
			$(".list_price").map(function(){
				var buyer = $(this).text();
				var kind = $(this).parent(".list_container").attr("id");
				kind = kind.split("_");
				kind = kind[1];
				if(buyer!=""){
					buyer = buyer.split(",");
					if(kind=='buy'){
						$(this).html("낙찰가 : "+buyer[1]);
					}else{
						$(this).html("현재가 : "+buyer[1]);
					}
				}else{
					var id = $(this).attr("id");
					id = id.split("_");
					$(this).html("현재가 : "+price);
				}
			});
			
		});
	});
</script>
<style type="text/css">
.list_select_btn {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 100px;
  margin-left: 15px;
  border-radius: 10px;
  float: left;
  background-color: #03a9f4;
  border: none;
  outline: 0;
  display: inline-block;
  padding: 5px;
  text-align: center;
  cursor: pointer;
}
.list_select_btn:hover, a:hover {
  opacity: 0.7;
}
.list_text{
	font-size: 0.7em;
	width: 90%;
	font-weight:lighter;
	color: white;
	margin: 8px auto;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
#list_wrap{
	width: 540px;
	height: auto;
	overflow: hidden;
	border-radius: 20px;
	background-color: white;
	margin: 0 auto;
	
}
.list_img{
	border-radius: 5px;
	width: 100px;
	height: 75px;
	text-align: center;
}
.card_wrap{
	width: 500px;
	overflow: hidden;
	height: auto;
	padding: 15px 12px;
}
.card_prev{
	font-size: 1.7em;
	padding: 0 7px;
	padding-bottom: 3px;
	cursor: pointer;
	margin-right: 35%;
	border-radius: 5px;
	vertical-align: middle;
}
.card_next{
	font-size: 1.7em;
	padding: 0 7px;
	padding-bottom: 3px;
	margin-left: 35%;
	cursor: pointer;
	border-radius: 5px;
	vertical-align: middle;
}

#listBtn_wrap{
	width: 100%;
	text-align: center;
	height: 40px;
}
.list_name{
	font-size: 0.7em;
	color: black;
	font-weight: bold;
}
.card_prev:hover, .card_next:hover{
	background-color: black;
	color: white;
}

#list_wrap #cookie_box {
    position: absolute;
    transition: 0.3s;
    left:-600px;
    width: 600px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    border-radius: 0 5px 5px 0;
    height: auto;
    overflow: hidden;
    background-color: gray;
   	padding: 20px 0;
   	padding-right: 50px;
}

#list_wrap #cookie_box:hover {
    left: 0;
}

#list_wrap {
    top: 20px;
    background-color: #4CAF50;
    float:right;
}

</style>
</head>
<body>
<div id="list_wrap">
<div id="cookie_box">
<c:if test="${count>0}">
<div class="card_wrap">
<c:forEach var="j" begin="0" end="${list.size()-1 }" step="1">
		<div id="pNum_${list[(count-1)-j].num }" class="list_select_btn">
		  <img class="list_img" src="${pageContext.servletContext.contextPath }/resources/upload/${images[(count-1)-j].fName}">
		  <div id="kind_${list[(count-1)-j].kind }" class="list_container">
		    <h1 class="list_text list_title">${list[(count-1)-j].title }</h1>
		    <c:if test="${list[(count-1)-j].buyer ne null }">
				<h1 class="list_text list_price">${list[(count-1)-j].buyer }</h1>
		    </c:if>
		    <c:if test="${list[(count-1)-j].buyer eq null }">
			    <h1 class="list_text">현재가 : ${list[(count-1)-j].min_price }</h1>
		    </c:if>
		  </div>
		</div>
</c:forEach>
</div>
<div id="listBtn_wrap">
<a id="list_prev" class="card_prev">&#10094;</a>
<span class="list_name">최근 본 물품</span>
<a id="list_next" class="card_next">&#10095;</a>
</div>
<script type="text/javascript">
	var count = "${count}"*1;
	var curPage = "${curPage}"*1;
	var page = 0;
	if(count%4!=0){
		page = parseInt(count/4)+1;
	}else{
		page = count/4;
	}
	alert(page);
	$(function(){
		$(".list_select_btn").click(function(){
			var num = $(this).attr("id");
			num = num.split("_");
			location.href = "${pageContext.servletContext.contextPath }/auction/auctionView/"+num[1];
		});
		
		$("#list_prev").click(function(){
			if(curPage>1){
				curPage = curPage-1;
			}else{
				curPage=page;
			}
			alert(curPage);
			list_list(curPage);
		});
		$("#list_next").click(function(){
			if(curPage<page){
				curPage = curPage+1;
			}else{
				curPage=1;
			}
			list_list(category,curPage,number);
		});
		function list_list(p){
			$.ajax({
				url:"./listList",
				type:"post",
				data:{
					curPage:p,
				},success:function(data){
					
				}
			});
		}
	});	
</script>
</c:if>
<c:if test="${count==0 || count eq null }">
	<div><img alt="" src="${pageContext.servletContext.contextPath }/resources/imgs/nolist.png" style="padding-left:9%; width:90%; height: 100%; border-radius: 10px;"> </div>
</c:if>
</div>
</div>
</body>
</html>