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
			$(".relate_price").map(function(){
				var buyer = $(this).text();
				if(buyer!=""){
					buyer = buyer.split(",");
					$(this).html("현재가 : "+buyer[1]);
				}else{
					var id = $(this).attr("id");
					id = id.split("_");
					alert(price);
					$(this).html("현재가 : "+price);
				}
			});
			
		});
	});
</script>
<style type="text/css">
.relate_card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 200px;
  text-align: center;
  font-family: arial;
  margin-left: 15px;
  border-radius: 10px;
  float: left;
  background-color: #333333;
}

.relate_container {
  padding: 0 16px;
  height: 100px;
  text-align: center;
}

.relate_container::after {
  content: "";
  clear: both;
  display: table;
}


.relate_select_btn {
  border: none;
  border-radius: 5px;
  outline: 0;
  display: inline-block;
  padding: 5px;
  color: white;
  background-color:  #e91e63;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 15px;
}
.relate_select_btn:hover, a:hover {
  opacity: 0.7;
}
.relate_text{
	font-size: 0.9em;
	font-weight:lighter;
	color: white;
	width: 90%;
	margin: 8px auto;
	white-space: nowrap;
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
}
#relate_wrap{
	width: 90%;
	height: 90%;
	border-radius: 20px;
	background-color: white;
	margin: 0 auto;
	
}
.relate_img{
	border-radius: 8px 8px 0 0;
	width: 200px;
	height: 150px;
}
.card_wrap{
	width: 100%;
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

#relateBtn_wrap{
	width: 100%;
	text-align: center;
}
.relate_name{
	font-size: 1em;
	color: silver;
}
.card_prev:hover, .card_next:hover{
	background-color: black;
	color: white;
}
</style>
</head>
<body>
<div id="relate_wrap">
<c:if test="${count>0}">
<div>
<div class="card_wrap">
<c:forEach var="j" begin="0" end="${relate.size()-1 }" step="1">
		<div id="pNum_${relate[j].num }" class="relate_card">
		  <img class="relate_img" src="${pageContext.servletContext.contextPath }/resources/upload/${images[j].fName}">
		  <div class="relate_container">
		    <h1 class="relate_text relate_title">${relate[j].title }</h1>
		    <c:if test="${relate[j].buyer ne null }">
			    <h1 class="relate_text relate_price">${relate[j].buyer }</h1>
		    </c:if>
		    <c:if test="${relate[j].buyer eq null }">
			    <h1 class="relate_text">현재가 : ${relate[j].min_price }</h1>
		    </c:if>
		   <p><button class="relate_select_btn">자세히 보기</button></p>
		  </div>
		</div>
</c:forEach>
</div>
</div>
<div id="relateBtn_wrap">
<a id="relate_prev" class="card_prev">&#10094;</a>
<span class="relate_name">관련 물품</span>
<a id="relate_next" class="card_next">&#10095;</a>
</div>
<script type="text/javascript">
	var page = 0;
	var number = "${number}";
	var category = "${relate[0].category}";
	var count = "${count}"*1;
	var curPage = "${curPage}"*1;
	if(count%4!=0){
		page = parseInt(count/4)+1;
	}else{
		page = count/4;
	}
	$(function(){
		$(".relate_select_btn").click(function(){
			var num = $(this).parents(".relate_card").attr("id");
			num = num.split("_");
			alert(num);
			location.href = "${pageContext.servletContext.contextPath }/auctionView/"+num[1];
		});
		
		$("#relate_prev").click(function(){
			if(curPage>1){
				curPage = curPage-1;
			}else{
				curPage=page;
			}
			relate_list(category,curPage,number);
		});
		$("#relate_next").click(function(){
			if(curPage<page){
				curPage = curPage+1;
			}else{
				curPage=1;
			}
			relate_list(category,curPage,number);
		});
		function relate_list(c,p,num){
			$.ajax({
				url:"${pageContext.servletContext.contextPath }/auction/relateList",
				type:"post",
				data:{
					curPage:p,
					category:c,
					num:num
				},success:function(data){
					$("#auctionView_related").html(data);
				}
			});
		}
	});	
</script>
</c:if>
<c:if test="${count==0 }">
	<div><img alt="" src="${pageContext.servletContext.contextPath }/resources/img/auction/nolist.png" style="padding-left:9%; width:90%; height: 100%; border-radius: 10px;"> </div>
</c:if>
</div>
</body>
</html>