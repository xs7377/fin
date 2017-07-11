<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var price = "${auction.max_price}";
	$(function(){
		var modal = this;
		var hash = modal.id;
		window.location.hash = hash;
		var num = "${auction.num}";
		var price = "${auction.max_price}"*1;
		var address = "${member.addr}";
		$(document).ready(function(){
			var add = $(".address_mode[value='basic']");
			price_check();
			$(add).trigger('click');
			
			
		});
		$(".address_mode").click(function(){
			var val = $(this).val();
			if(val=="basic"){
				var addr = address.split(",");
				$("#sample6_postcode").val(addr[0]); // 우편번호
				$("#sample6_address").val(addr[1]); // 주소
				$("#sample6_address2").val(addr[2]); // 상세주소
			}else{
				$("#sample6_postcode").val(''); // 우편번호
				$("#sample6_address").val(''); // 주소
				$("#sample6_address2").val(''); // 상세주소
			}
		});
		
		$("body").on("change","#sel_coupon",function(){
			var coupon = $(this).val();
			coupon = coupon.split(",");
			if(coupon[1]=="포인트"){
				$("#coupon_info").html(coupon[0]);
			}else if(coupon[1]=='퍼센트'){
				coupon = coupon[0]*1;
				var discount = price * (0.01*coupon);
				$("#coupon_info").html(discount);
			}else{
				$("#coupon_info").html(0);
			}
			price_check();
		});
		
		$("#point_info").change(function(){
			var point = $(this).val()*1;
			var real = $("#real_point").val();
			if(real<point){
				$(this).val(0);
				alert("포인트가 부족합니다.");
			}else{
				if(point>=500){
					price_check();
				}else{
					$(this).val(0);
					alert("500Point부터 사용가능합니다.");
				}
			}
		});
		
		$("#card_label").click(function(){
			var btn = $(this).find("img");
			var phone = $("#phone_label").find("img");
			alert("준비중입니다.")
			/* $(btn).attr("src","${pageContext.servletContext.contextPath }/resources/img/auction/card_click.png");
			$(btn).css("background-color","#ffdb43");
			$(phone).attr("src","${pageContext.servletContext.contextPath }/resources/img/auction/phone.png");
			$(phone).css("background-color","white"); */
		});
		
		$("#phone_label").click(function(){
			var btn = $(this).find("img");
			var card = $("#card_label").find("img");
			$(btn).attr("src","${pageContext.servletContext.contextPath }/resources/img/auction/phone_click.png");
			$(btn).css("background-color","#52bb02");
			$(card).attr("src","${pageContext.servletContext.contextPath }/resources/img/auction/card.png");
			$(card).css("background-color","white");
		});
		
		$(".pay_button").click(function(){
			var check_addr = true;
			var addr1 = $("#sample6_address").val(); // 주소
			var addr2 = $("#sample6_address2").val(); // 상세주소
			var postcode = $("#sample6_postcode").val(); // 우편번호
			if(addr1=='' || addr2=='' || postcode ==''){
				check_addr=false;
			}
			if(check_addr){
				window.open("${pageContext.servletContext.contextPath }/auction/auctionPayment/"+num,"결제하기","width=690px; height=550px;");
			}else{
				alert("주소를 입력해주세요.");
			}
		});
		
		function price_check(){
			var coupon = $("#coupon_info").text();
			var point = $("#point_info").val();
			coupon = coupon*1+point*1;
			var pay_price = price+2500-(coupon);
			$("#pay_price").html(pay_price+"원");
			$("#price_pay").html(pay_price+"원");
			point = pay_price*0.02;
			$(".pay_point").html(point);
		}
		
		
		
		
	});
</script>
<style type="text/css">

#auctionPay_wrap{
	width: 700px;
	height: 600px;
}
.product_table{
	width: 100%;
	height: auto;
	overflow: hidden;
}

/* 물품 정보 */
#product_thead>td{
	text-align: center;
	font-size: 0.8em;
	color: #1e90ff;
	border-bottom: 1px solid #1E90FF;
	border-top: 1px solid #1E90FF;
}

.product_it{
	width: 300px;
}
.coupon{
	width: 100px;
	text-align: center;
}
.price{
	width: 100px;
	text-align: center;
}
.seller{
	width: 100px;
	text-align: center;
}
.tran{
	width: 80px;	
	text-align: center;
}

#product_thead{
	width: 100%;
	height: 25px;
}
.product_title{
	display: inline-block;
	width: 200px;
	height: 35px;
	white-space:nowrap; 
	overflow:hidden;
	text-overflow: ellipsis;
	margin-bottom: 40px;
}
/* 물품 정보 */

/* 가격 정보 */

#product_price{
	height: 100px;
	margin: 20px auto;
	border-bottom: 1px solid #1E90FF;
	border-top: 1px solid #1E90FF;
}
.price_table{
	width: 100%;
	height: auto;
	overflow: hidden;
	text-align: center;
	margin-top: 15px;
}
.point{
	width: 170px;
	text-align: center;
}

.point_text{
	font-size: 0.8em;
	margin-top: 3px;
	float: left;
}

#point_info::-webkit-outer-spin-button,
#point_info::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#real_point::-webkit-outer-spin-button,
#real_point::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/* 가격 정보 */



/* 주소 정보 */
#address_info{	
	width: 100%;
	height: 150px;
	float: left;
	border-bottom: 1px solid #1E90FF;
	border-top: 1px solid #1E90FF;
	padding-bottom: 20px;
}
#address_input{
	width: 100%;
	margin-left: 20px;
}
#address_box{
	width: 200px;
	font-size: 0.8em;
	top: 0;
	margin-bottom: 20px;
}
/* 주소 정보 */

/* 결제정보 */
#pay_info{
	width: 100%;
	float: left;
}
#payment_mode{
	width: 100%;
	height: 80px;
	float: left;
	margin: 20px 20px;
}


#payment_btn_wrap{
	width: 100%;
	height: 300px;
	float: left;
	margin-left: 10px;
	
}

.label{
    cursor: pointer;
}

/* 결제정보 */


/* 결제하기 */
.pay_button {
  border-radius: 4px;
  background-color: #1E90FF;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  margin-top: 50px;
}
#price_pay{
  border-radius: 4px;
  border: none;
  color: #ca3038;
  text-align: center;
  font-size: 25px;
  font-weight:bolder;
  padding: 20px 0;
  transition: all 0.5s;
  margin: 5px;
  width: 200px;
  height: 25px;
  
}
.pay_button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.pay_button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.pay_button:hover span {
  padding-right: 25px;
}

.pay_button:hover span:after {
  opacity: 1;
  right: 0;
}
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
				<tr style="height: 50px;">
					<td class="product_it">
						<div style="vertical-align: middle;">
							<img alt="상품" src="${pageContext.servletContext.contextPath }/resources/upload/${imgs[0].fName}" style="width: 70px; height: 70px; padding: 5px 5px;">
							<span class="product_title">${auction.title}</span>
						</div>
					</td>
					<td class="coupon">
						<select id="sel_coupon" style="width: 100%; height: 20px; font-size: 0.8em;">
							<option value="no">Coupon</option>
							<c:forEach items="${coupon }" var="c">
								<option value="${c.contents },${c.kind}">${c.name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="price">
						${auction.max_price}원
					</td>
					<td class="seller">
						${auction.m_id }
					</td>
					<td class="tran">
						2500원
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td style="border-top:1px solid #1e90ff;" colspan="6"></td>
				</tr>
			</tfoot>
		</table>
		<div id="product_price">
			<table class="price_table">
				<tr>
					<td class="price"><span>상품금액</span></td>
					<td rowspan="2"><img alt="" src="${pageContext.servletContext.contextPath }/resources/img/auction/plus.png"></td>
					<td class="tran"><span>배송비</span></td>
					<td rowspan="2"><img alt="" src="${pageContext.servletContext.contextPath }/resources/img/auction/minus.png"></td>
					<td class="coupon"><span>쿠폰</span></td>
					<td class="point"><span>포인트</span></td>
					<td rowspan="2"><img alt="" src="${pageContext.servletContext.contextPath }/resources/img/auction/equal.png"></td>
					<td class="payment"><span>결제금액</span></td>
				</tr>
				<tr style="margin-bottom: 20px;">
					<td class="price">${auction.max_price }원</td>
					<td class="tran">2500원</td>
					<td id="coupon_info" class="coupon">0</td>
					<td class="point">
						<span class="point_text">잔여포인트 <input type="number" id="real_point" style="width: 80px; text-align: right;" readonly="readonly" value="${member.point }" ></span>
						<span class="point_text">사용<input type="number" id="point_info" style="width: 80px; margin-left: 42px; text-align: right;" value="0"></span>
					</td>
					<td id="pay_price" class="payment">
					</td>
				</tr>	
			</table>
		</div>
		<table style="width: 100%; height: 100%;">
			<tr>
				<td style="width: 70%;">
					<div id="address_info">
						<p>주소 정보</p>
						<div id="address_box"><input id="address_1" type="radio" class="address_mode" name="add" value="basic"><label for="address_1">기본주소</label> &nbsp<input id="address_2" type="radio" class="address_mode" name="add" value="new"><label for="address_2">새로운 주소</label> </div>
						<div id="address_input">
							<input hidden="true" type="text" id="sample6_postcode" name="addr" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" placeholder="주소" name="addr">
							<input type="text" id="sample6_address2" placeholder="상세주소" name="addr">
						</div>
				</div>
				</td>
				<td style="width: 100px;" rowspan="2">
					<div id="payment_btn_wrap">
						<div id="price_pay">
						</div>
						<div id="price_pay" style="font-size: 15px; color: #1E90FF;"><span class="pay_point"></span>Point 적립</div>
						<button class="pay_button"><span>결제하기 </span></button> 
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 70%;">
					<div id="pay_info">
					<p>결제 방법</p>
					<div id="payment_mode">
						<input hidden="true" class="pay_mode" type="radio"  id="phone_mode" name="payment" value="phone">
						<!-- <input hidden="true" class="pay_mode" type="radio" id="card_mode" name="payment" value="card">  -->
						<label id="phone_label" class="label" for="phone_mode" >
							<img style="border: 1px solid #52bb02; padding: 20px 20px;" alt="" src="${pageContext.servletContext.contextPath }/resources/img/auction/phone.png">
						</label>
						<label id="card_label" class="label" for="card_mode">
							<span>
								<img style="border: 1px solid #ffdb43; padding: 20px 20px;" alt="" src="${pageContext.servletContext.contextPath }/resources/img/auction/card.png">
							</span>
						</label>
					</div>
				</div>
				</td>
			</tr>
		</table>
		
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        $(".address_mode[value='new']").trigger("click");
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

</div>

</body>
</html>