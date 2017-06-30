<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<style type="text/css">

#auctionPay_wrap{
	width: 700px;
	height: 600px;
	border: 1px solid silver;
}
.product_table{
	width: 100%;
	height: auto;
	overflow: hidden;
}

/* 물품 정보 */
#product_thead>td{
	border: 1px solid silver;
	background-color: silver;
	text-align: center;
	font-size: 0.8em;
	color: white;
}

.product_it{
	width: 300px;
}
.coupon{
	width: 100px;
}
.price{
	width: 100px;
}
.seller{
	width: 100px;
}
.tran{
	width: 80px;	
}

#product_tbody{
	border-bottom: 1px solid silver;
}
#product_thead{
	width: 100%;
	height: 25px;
	border: 1px solid silver;
}
/* 물품 정보 */

/* 가격 정보 */

#product_price{
	width: 90%;
	height: 100px;
	margin: 20px auto;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}
.price_table{
	width: 100%;
	height: auto;
	overflow: hidden;
	text-align: center;
	
}
.point{
	width: 100px;
}

/* 가격 정보 */


</style>
</head>
<body>

<div id="auctionPay_wrap">
	<div id="auctionPay_info">
		<table class="product_table">
			<thead>
				<tr id="product_thead">
					<td class="product_it">물품 정보</td>
					<td class="coupon">할인 쿠폰</td>
					<td class="price">금액</td>
					<td class="seller">판매자</td>
					<td class="tran">배송비</td>
				</tr>
			</thead>
			<tbody id="product_tbody">
				<tr>
					<td>
						<div>
							<img alt="상품" src="" style="width: 70px; height: 70px; padding: 5px 5px;">
							<span>물품명</span>
						</div>
					</td>
					<td>
						<select style="width: 100%; height: 30px;">
							<option>My Coupon</option>
						</select>
					</td>
					<td>

					</td>
					<td>
						판매자 ID
					</td>
					<td>
						2500원
					</td>
				</tr>
			</tbody>
		</table>
		<div id="product_price">
			<table class="price_table">
				<tr>
					<td class="price"><h4>상품금액</h4></td>
					<td class="tran"><h4>배송비</h4></td>
					<td class="coupon"><h4>할인</h4></td>
					<td class="point"><h4>포인트</h4></td>
					<td class="payment"><h4>결제금액</h4></td>
				</tr>
				<tr>
					<td class="price"></td>
					<td class="tran">2500원</td>
					<td class="coupon"></td>
					<td class="point"></td>
					<td class="payment"></td>
				</tr>	
			</table>
		</div>
		<div id="address_info">
			<h3>배송지 정보 입력</h3>
				<div>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소">
					<input type="text" id="sample6_address2" placeholder="상세주소">
				</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
			
		</div>
		<div>
			<h3>결제 정보 입력</h3>
			<P></P>
		</div>
		
	</div>

</div>

</body>
</html>