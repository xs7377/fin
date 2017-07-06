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
		var client_id ="";
		var seller_id = "${auction_info.m_id}";
		var tender_price = "${auction_info.buyer}";
		var min_price = "${auction_info.min_price}";
		var max_price = '${auction_info.max_price}';
		var period = '${auction_info.period}';
		var kind = "${kind}";
		var num = "${auction_info.num}";
		$(document).ready(function(){
			var date = period.split(",");
			$("#timeEnd").html(date[0]+" "+date[1]);
			tender_price = tender_price.split(",");
			client_id = tender_price[0];
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
			var text = "";
			var price = $("#tender_price").val();
			if(tender_price!=''){
				min_price = tender_price[1]*1+500;
			}
			if(price%500>0){
				check_pri=false;
				alert("금액의 최소단위는 500원입니다.");
			}else if(price=='' && kind!="buy"){
				check_pri=false;
				alert("가격을 입력해주세요.");
			}
			
			
			if(client_id==m_id){
				check_id = false;
				text = "중복입찰을 할 수 없습니다.";
			}else if(seller_id==m_id){
				check_id = false;
				text = "경매에 참여할 수 없습니다.";
			}
			
			if(check_pri && kind!="buy" && price<min_price || price>=max_price){
				check_pri=false;
				alert("금액을 다시 입력해주세요.");
			}
			if(kind=="buy"){
				parent.$("#tender_modal_frame").css("height","650px");
				parent.$(".modal-content").css("width","750px");
				parent.$(".modal").css("padding-top","50px");
				location.replace("${pageContext.servletContext.contextPath }/auction/auctionPay/"+num);	
			}else if(check_id){
				if(check_pri){
					$.ajax({
						url:"${pageContext.servletContext.contextPath }/auction/auction_tender",
						type:"post",
						data:{
							price:price,
							num:num
						},success:function(data){
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
					alert(text);
					$('#myModal', parent.document).trigger("click");
				}
			}
		});
	});
	
</script>
<style type="text/css">
	.tender_wrap{
		width: 850px;
		margin: 0 auto;
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
	width: 850px;
}
.tender_price_info{
	font-size: 0.8em;
	margin-left: 25px;
}
#tender_thead>td{
	border-bottom: 1px solid #ca3038;
	border-top: 1px solid #ca3038;
}

#tender_thead{
	font-size: 0.8em;
	text-align: center;
	font-weight: bolder;
	color: #ca3038;
	height: 25px;
}
#tender_btn {
  border: none;
  border-radius: 5px;
  outline: 0;
  display: inline-block;
  padding: 5px;
  color: white;
  background-color: #ca3038;
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

.product_it{
	width: 250px;
}
.coupon{
	width: 80px;
	text-align: center;
}
.price{
	width: 80px;
	text-align: center;
}
.seller{
	width: 70px;
	text-align: center;
}
.time{
	width: 100px;	
	text-align: center;
}
.tender_title{
	font-size: 18px;
	font-family: sans-serif;
	color: #ca3038;
}

.product_title{
	display: inline-block;
	width: 150px;
	height: 35px;
	white-space:nowrap; 
	overflow:hidden;
	text-overflow: ellipsis;
	margin-bottom: 40px;
	color: #ca3038;
}
	
</style>
</head>
<body>
<form id="auction_tender">
<div class="tender_wrap">
	<table id="tender_table">
			<thead>
				<tr id="tender_thead">
					<td class="product_it">물품 정보</td>
					<td class="price">즉시 구매가</td>
					<td class="price">현재입찰가</td>
					<td class="seller">판매자</td>
					<td class="time">마감시간</td>
				</tr>
			</thead>
			<tbody id="product_tbody">
				<tr style="height: 50px;">
					<td class="product_it">
						<div style="vertical-align: middle;">
							<img alt="상품" src="${pageContext.servletContext.contextPath }/resources/upload/${imgs[0].fName}" style="width: 70px; height: 70px; padding: 5px 5px;">
							<span class="product_title">${auction_info.title}</span>
						</div>
					</td>
					<td class="price tender_title">
						${auction_info.max_price}
					</td>
					<td id="n_price" class="price tender_title">
					</td>
					<td class="seller tender_title tender_title">
						${auction_info.m_id }
					</td>
					<td id="timeEnd" class="time tender_title">
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td style="border-top:1px solid #ca3038; height: 20px;" colspan="6"></td>
				</tr>
			</tfoot>
		</table>
<c:if test="${kind eq 'tender' }">
	<p class="tender_title">입찰가</p>
	<p><input id="tender_price" name="price" type="number" max="${tender_info.max_price-1000 }"><span class="tender_price_info"></span></p>
	<input type="button" id="tender_btn" value="입찰하기">
</c:if>
</div>
<c:if test="${kind eq 'buy' }">
	<p class="info_text">${tender_info.max_price }</p>
	<p><input id="tender_price" type="hidden" name="price" value="${tender_info.max_price }"></p>
	<input type="button" id="tender_btn" value="구매" style="margin-top: 50px;">
</c:if>
</form>
</body>
</html>