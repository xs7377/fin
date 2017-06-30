<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var cliend_id = "";
		var tender_price = "${tender_info.buyer}";
		var min_price = "${tender_info.min_price}";
		var max_price = '${tender_info.max_price}';
		var period = '${tender_info.period}';
		var kind = "${kind}";
		$(document).ready(function(){
			var date = period.split(",");
			$(".tender_date").html(date[0]+" "+date[1]);
			tender_price = tender_price.split(",");
			cliend_id = tender_price[0];
			min_price = min_price*1;
			max_price = max_price*1;
			if(tender_price!=''){
				$("#tender_price").attr("min",tender_price[1]*1+500);
				$(".tender_price_info").html("현재 "+(tender_price[1]*1+500)+"원 부터 입찰할 수 있습니다.")
				$("#n_price").html(tender_price[1]*1);
			}else{
				$("#tender_price").attr("min", min_price-1);
				$(".tender_price_info").html("현재 "+min_price+"원 부터 입찰할 수 있습니다.")
				$("#n_price").html(min_price);
			}
		});
		$("#tender_btn").click(function(){
			var check_pri=true;
			var m_id = "xs7377";
			var check_id=true;
			var form = $("#auction_tender").serialize();
			var price = $("#tender_price").val();
			if(tender_price!=''){
				min_price = tender_price[1]*1+500;
			}
			if(price%500>0){
				check_pri=false;
				alert("금액의 최소단위는 500원입니다.");
			}else if(price==''){
				check_pri=false;
				alert("가격을 입력해주세요.");
			}
			
			
			if(cliend_id==m_id){
				check_id = false;
			}
			
			if(check_pri && price<min_price || price>=max_price){
				check_pri=false;
				alert("금액을 다시 입력해주세요.");
			}
			if(kind=="buy"){
				alert(kind);
				parent.$("#tender_modal_frame").css("height","650px");
				parent.$(".modal-content").css("width","750px");
				parent.$(".modal").css("padding-top","0");
				location.href="${pageContext.servletContext.contextPath }/auction/auctionPay";	
			}else if(check_id){
				if(check_pri){
					$.ajax({
						url:"./auction_tender",
						type:"post",
						data:form,
						success:function(data){
							if(data=='1'){
								if(kind=='buy'){
									parent.location.reload();
									alert("구매완료되었습니다.");
									$('#myModal', parent.document).trigger("click");
								}else{
									parent.location.reload();
									alert("입찰되었습니다.")
									$('#myModal', parent.document).trigger("click");
								}
							}else{
								parent.location.reload();
								alert("경매가 종료되었습니다.");
								$('#myModal', parent.document).trigger("click");
							}
						}
					});
	
				}
			}else{
				if(kind=="tender" && check_pri){
					alert("중복입찰은 할 수 없습니다.")
					$('#myModal', parent.document).trigger("click");
				}
			}
		});
	});
	
</script>
<style type="text/css">
	.tender_wrap{
		width: 900px;
	}
	#tender_price{
		width: 150px;
		height: 35px;
		text-align: right;
		margin-left: 30px;
		border-radius: 5px;
	}
	
#tender_price::-webkit-outer-spin-button,
#tender_price::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
#tender_table{
	width: 900px;
}
.tender_price_info{
	font-size: 0.8em;
	margin-left: 25px;
}
.tender_title{
	width: 200px;
}

#tender_btn {
  border: none;
  border-radius: 5px;
  outline: 0;
  display: inline-block;
  padding: 5px;
  color: white;
  background-color:  #ca3038;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 15px;
}

.info_text{
	margin: 0 30px;
	outline: 0;
	text-align: left;
	font-size: 15px;
	width: 80%;
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis;
	width: 150px;
}

#tender_btn:hover, a:hover {
  opacity: 0.7;
}
	
</style>
</head>
<body>
<form id="auction_tender">
<c:if test="${kind eq 'tender' }">
<div class="tender_wrap">
	<table id="tender_table">
			<tr>
				<td class="tender_title">물품</td>
				<td class="tender_title">마감시간</td>
				<td class="tender_title">현재가</td>
				<td class="tender_title">최대 입찰가</td>
			</tr>
			<tr>
				<td class="info_text" style="display: inline-block;">${tender_info.title }</td>
				<td class="tender_date info_text"></td>
				<td id="n_price" class="info_text">${tender_info.max_price-1000 }</td>
				<td>${tender_info.max_price-1000 }</td>
			</tr>
	</table>
<%-- 	<p class="tender_title">물 품</p>
	<p class="info_text">${tender_info.title }</p>
	<p class="tender_title">경매 마감 </p>
	<p class="demo"></p>
	<p class="tender_date info_text"></p>
	<p class="tender_title">현재가</p>
	<p id="n_price" class="info_text">${tender_info.max_price-1000 }</p>
	<p class="tender_title">최대 입찰가</p>
	<p class="info_text">${tender_info.max_price-1000 }</p> --%>
	<input type="hidden" value="xs7377" name="id">
	<input type="hidden" value="${tender_info.num }" name="num">
	<p class="tender_title">입찰가</p>
	<p><input id="tender_price" name="price" type="number" max="${tender_info.max_price-1000 }"><span class="tender_price_info"></span></p>
	<input type="button" id="tender_btn" value="입찰하기">
</div>
</c:if>
<c:if test="${kind eq 'buy' }">
<div class="tender_wrap">
	<p class="tender_title">물 품</p>
	<p class="info_text">${tender_info.title }</p>
	<p class="tender_title">경매 마감</p>
	<p class="tender_date info_text"></p>
	<p class="tender_title">즉시 구매가</p>
	<p class="info_text">${tender_info.max_price }</p>
	<input type="hidden" value="${tender_info.num }" name="num">
	<input type="hidden" value="xs7377" name="id">
	<p><input type="hidden" name="price" value="${tender_info.max_price }"></p>
	<input type="button" id="tender_btn" value="구매">
</div>
</c:if>
</form>
</body>
</html>