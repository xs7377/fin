<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/fin/resources/css/reset.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
	body{
	font-size: 16px;
	font-family: inherit;
}
.mypage_wrap {
	width: 1300px;  
	height: 800px;  
	margin: 100px auto;

} 
button.accordion {
	background-color: #eee;
	color: #444; 
	cursor: pointer;
	padding: 18px;
	width: 200px;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;

}

button.accordion.active, button.accordion:hover {
	background-color: #ddd;
}

button.accordion:after {
	content: '\002B';
	color: #777;
	font-weight: bold;
	float: right;
	margin-left: 5px;
	
}

button.accordion.active:after {
	content: "\2212";
}

div.panel2 {
	padding: 0 18px;
	background-color: none;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	margin-bottom: 0px;
	border: none;
	width: 200px;
}

a{
	text-decoration: none;
	color: #595959;
	line-height: 250%;
	font-weight: normal;
}
.paging{
	margin-top: 20px; 
	margin-left: 500px;
}


@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
	
	




</style>
<script type="text/javascript">
$(function(){

	var id = '${member.id}'
	$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="sellIng?curPage="+curPage+"&id="+id;
		}); 
	
	
	$("table").on("click","#review_btn",function(){
		var p_id=$(this).attr("class");
		
		alert(p_id);
		//m_id(member.id) title contents score id(pid)
		$("#p_id").val(p_id);
		
	})
	
	
});
</script>
</head>
<body>
<%@ include file="../sub/header.jspf"%>
	<section class="mypage_wrap">
<div style="display: inline-block;">
	
	<!--@hyo3  -->
		<a href="/fin/member/memberMypage" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-th-list" ></span> MENU
		</button> 
		</a>
	
		<div class="panel2"></div>
	 
	<!--@hyo3  -->	
		
		<a href="/fin/member/memberView" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-user"></span> 나의 정보
		</button> 
		</a> 
		
		<div class="panel2"></div>
		
		
		<a href="/fin/member/memberFriends?curPage=1&id=${member.id }" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-music"></span> 나의 친구
		</button> 
		</a> 
		
		<div class="panel2"></div>
 
		

		<button class="accordion">
			<span class="glyphicon glyphicon-envelope"></span> 나의 쪽지
		</button>
	
		
		
		<div class="panel2">
			<dl>
				<dd class="w3-bar-item w3-button tablink" onclick="openCity(event,'sendM')">
					<a href="/fin/member/memberMessage?id=${member.id }" id="sendList" style="font-weight: normal; font-size: 0.9em;" > 보낸 쪽지함</a>
				</dd>
				<dd class="w3-bar-item w3-button tablink" onclick="openCity(event,'recvM')">
					<a href="#" id="reciveList" style="font-weight: normal; font-size: 0.9em;" > 받은 쪽지함 </a>
				</dd>
			</dl>
		</div>
		
<a href="/fin/member/memberAttend?m_id=${member.id }" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-ok-circle"></span> 나의 출석
		</button>
		</a>
		<div class="panel2"></div>
		

	<a href="/fin/member/memberPoint" style="font-weight: normal;">
		<button class="accordion">
			<span class="glyphicon glyphicon-heart"></span> 포인트 몰
		</button>
		</a>
		
		 
		<div class="panel2"></div>

		<button class="accordion">
			<span class="glyphicon glyphicon-shopping-cart"></span> 구매 관련
		</button>
		<div class="panel2">
			<dl>
				<dd>
					<a href="/fin/member/bidding?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">입찰 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/buyIng?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">구매 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/likesProduct?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">관심 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/buyEnd?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">구매 완료 상품</a>
				</dd>
			</dl>
		</div>

		<button class="accordion">
			<span class="glyphicon glyphicon-usd"></span> 판매 관련
		</button>
		<div class="panel2">
			<dl>
				<dd>
					<a href="/fin/member/sellIng?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">판매 중 상품</a>
				</dd>
				<dd>
					<a href="/fin/member/sellEnd?curPage=1&id=${member.id }" style="font-weight: normal; font-size: 0.9em;">판매 완료 상품</a>
				</dd>
			</dl>
		</div>
		
	</div>	
	
	
<div style="width: 1050px; height: 700px; float: right;">
 <table id="Mtable" class="table table-hover" style="font-size: 0.9em;">
		<tr class="sellIng_tr" style="text-align: center; font-family: Georgia; font-weight: bolder;
		height: 50px; vertical-align: middle;
	line-height: 100%;">
		<td style="vertical-align: middle;">SELLER</td>
		<td style="vertical-align: middle;">CATEGORY</td>
		<td style="vertical-align: middle;">TITLE</td>
		<td style="vertical-align: middle;">MIN_PRICE</td>
		<td style="vertical-align: middle;">MAX_PRICE</td>
		<td style="vertical-align: middle;">PRICE</td>
		<td style="vertical-align: middle;">DATE</td>
		<td style="vertical-align: middle;">REVEIW</td>
		</tr>
	

	<c:forEach items="${list}" var="f">
		<tr style="text-align: center; ">
		<td style="width: 100px; vertical-align: middle;">${f.m_id}</td>
		<td style="width: 150px; vertical-align: middle;">${f.category}</td>
		<td style="vertical-align: middle;"><a href="/fin/auction/auctionView/${f.num}">${f.title}</a></td>
		<td style="width: 100px; vertical-align: middle;">${f.min_price}원</td>
		<td style="width: 100px; vertical-align: middle;">${f.max_price}원</td>
		<td style="width: 100px; vertical-align: middle;">${f.price}원</td>
		<td style="width: 120px; vertical-align: middle;">${f.reg_date}</td>
		<td style="width: 120px; vertical-align: middle;"> <button id="review_btn" data-toggle="modal" data-target="#Review_w" class="${f.m_id}">REVIEW</button> </td>
		</tr>
		</c:forEach>

	<c:if test="${list == '[]'}">
		<tr>
		<td colspan="7" style="text-align: center;">구매 완료 상품이 없습니다.</td>
		</tr>
	</c:if>
		
		<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
	</table>
<div class="paging">
		<c:if test="${pageResult.curBlock>1}">
			<span class="go" id="${pageResult.startNum-1}" style="cursor: pointer; font-weight: bolder;">[이전]</span>
		</c:if>
		<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
			<span class="go" id="${i}" style="cursor: pointer; font-weight: bolder;">${i}</span>
		</c:forEach>
		<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
			<span class="go" id="${pageResult.lastNum+1}" style="cursor: pointer; font-weight: bolder;">[다음]</span>
		</c:if>
	</div>
</div>



<!--리뷰 작성  -->
<div class="modal fade" id="Review_w" role="dialog">
    <div class="modal-dialog">
   	<!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-family: Georgia; font-weight: bolder;">SEND MESSAGE</h4>
        </div>
        <div class="modal-body">
    
     <form action="../review/reviewWrite" method="post">
          <table class="table table-hover">
          <tr>
          	<td style="font-family: Georgia; font-weight: bolder;">작성자</td>
          	<td style="font-family: Georgia; font-weight: bolder;">판매자</td>
          
          </tr>
          <tr>
         	<td><input type="text" name="m_id" class="form-control" value="${member.id}" readonly="readonly"></td>
		 	<td><input type="text" name="p_id" class="form-control" id="p_id" readonly="readonly"></td>
          </tr>
         
         <!-- 별점 --> 
         <tr><td colspan="2">별점</td></tr> 
          <tr>
          <td colspan="2">
          
          <!-- 리뷰하면 별점  -->
	
<fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    
    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
</fieldset>	
	
          </td>
          </tr>
          
          
		<tr>
		<td colspan="2" style="font-family: Georgia; font-weight: bolder;">T I T L E</td>
		</tr>
		<tr >	
			<td colspan="2"><input type="text" class="form-control" name="title"></td>
         </tr>
	<tr>        
	<td colspan="2">
		<textarea rows="10" cols="60" id="contents" name="contents"></textarea>
	</td>
	</tr>		

	<tr style="height: 40px;">
	<td>
	<button class="btn btn-default" style="width: 205px; margin-top: 25px; font-family: Georgia; font-weight: bolder;">WRITE</button>
	</td>
	<td>
         <input type="button" id="mClose" 
         style="width: 205px; margin-top: 25px; font-family: Georgia; font-weight: bolder;" 
         class="btn btn-default" data-dismiss="modal" value="CLOSE">
	</td>
	</tr>

</table>
          
					          
         
</form>
        </div>
        <div class="modal-footer">
        </div>
      </div>
      
    </div>
  </div>






		<script>
			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
				acc[i].onclick = function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.maxHeight) {
						panel.style.maxHeight = null;
					} else {
						panel.style.maxHeight = panel.scrollHeight + "px";
					}
				}
			}
		</script>
	</section>
<%@ include file="../sub/footer.jspf"%>
</body>
</html>