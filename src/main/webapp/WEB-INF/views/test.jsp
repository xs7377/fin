<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제하기</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		
	});
	var real_price = $(".real_price",opener.document).text();
	real_price = real_price.split("원");
	real_price = real_price[0]*1+2500;
	var pay = $("#pay_price",opener.document).text();
	pay = pay.split('원');
	var use_point = $("#point_info",opener.document).val();
	var point = $(".pay_point",opener.document).text()*1;
	var use_coupon = $("#sel_coupon",opener.document).val();
	var ad = $(".address_mode:checked",opener.document).val();
	var pay_method = $(".pay_mode:checked",opener.document).val();
	var addr = "${member.addr}";
	var num ="${auction.num}";
	if(ad=='new'){
		addr = $.makeArray($("input[name='addr']",opener.document).map(function(){
			return $(this).val();
		}));
	}else{
		addr = addr.split(",");
	}
	IMP.init('imp77993445');
	IMP.request_pay({
	    pg : 'danal', // version 1.1.0부터 지원.
	    pay_method : 'phone',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${auction.title}',
	    amount : pay[0],
	    buyer_email : '${member.email}',
	    buyer_name : '${member.name}',
	    buyer_tel : '${member.phone}',
	    buyer_addr : addr[1]+addr[2],
	    buyer_postcode : addr[0],
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        $.ajax({
	        	url: "${pageContext.servletContext.contextPath }/auction/auction_tender",
	        	type:"post",
	        	data:{
	        		num:num,
	        		price:real_price,
	        		addr:addr[0]+","+addr[1]+","+addr[2],
	        		coupon:use_coupon,
	        		point:use_point-point
	        	},success:function(){
	        		opener.parent.location.reload();
	        		window.close();
	        	}
	        });
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
});
</script>
<body>