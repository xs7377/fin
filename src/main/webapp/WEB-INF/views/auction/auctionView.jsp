<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/img_view.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	var check=true;
	var number = '${auctionDTO.num}'*1;
	var category = "${auctionDTO.category}";
	var period = "${auctionDTO.period}";
	var t_price = "${auctionDTO.buyer}";
	var max_price = "${auctionDTO.max_price}";
	var min_price = "${auctionDTO.min_price}";
	var akind = "${auctionDTO.kind}";
	var like_count = "${auctionDTO.likes}";
	var lastRow = 10;
	$(function(){
		$(document).ready(function(){
			var date = period.split(",");
			var day = date[0].split("-");
			var time = date[1].split(":");
			var nav = $('#auctionView_tender');
			$(".auctionView_period").html("("+day[0]+"년 "+day[1]+"월 "+day[2]+"일 "+time[0]+"시 "+time[1]+"분)");
			$("#product_btn").trigger("click");
			
			if(t_price!=''){
				t_price=t_price.split(",");
				if(akind=='buy'){
					$(".real_tprice").html("낙찰가  "+t_price[1]);
				}else{
					$(".real_tprice").html("현재가  "+t_price[1]);
				}
			}else{
				$(".real_tprice").html("현재가  "+min_price);
			}
			
			
			var top=800;
			$(window).scroll(function () {
				if ($(this).scrollTop() > top) {
					nav.css("height","45");
					nav.addClass("f-nav");
				} else {
					nav.css("height","0");
					nav.removeClass("f-nav");
				}
				
				if($(this).scrollTop() > 900){
					$("#scrol_top_btn").css("display","block");
				}else{
					$("#scrol_top_btn").css("display","none");
				}
			});
			var p=1;
			relate_list(category,p,number);
			
			$.ajax({
				url:"../auctionImage",
				type:"post",
				data :{
					pNum:number
				},success:function(data){
					$(".auctionView_thumbnail").html(data);
				}
			});
			reply_list(number, lastRow);
			
			$.ajax({
				url: "../category_search",
				type:"post",
				data:{
					category:category	
				},success:function(data){
					$("#auctionVeiw_category").html(data);
				}
			});
			
		});
		
		$("#scrol_top_btn").click(function(){
			$(window).scrollTop("0");
		});
		
		$("body").on("click","#reply_more_btn",function(){
			lastRow += 10;
			alert(lastRow);
			reply_list(number, lastRow);
		});
		
		$("body").on("click",".rereply_input",function(){
			var num = $(this).attr("id");
			var parent_node = $(this).parents(".auctionView_reply_write");
			var contents = $(parent_node).find(".reply_contents");
			var contents_val = $(contents).val();
			var parent = $(this).parents(".re_write_node");
			num = num.split("_");
			num = num[1];
			if(contents_val==""){
				alert("댓글을 작성하세요.");
			}else{
				$.ajax({
					url: "../auctionReply",
					type:"post",
					data:{
						pNum:number,
						contents:contents_val,
						m_id:"xs7377",
						num:num
					},success:function(data){
						$(parent).before(reply(data));
						$(parent).remove();
					}
				});
			}
		});
		
		$("#product_btn").click(function(){
			$(this).css("background-color","#f8f8f8")
			$("#seller_btn").css("background-color","silver");
			$("#auctionProduct_info").show();
			$("#auctionSeller_info").hide();
		});
		
		$("#seller_btn").click(function(){
			$(this).css("background-color","#f8f8f8")
			$("#product_btn").css("background-color","silver");
			$("#auctionProduct_info").hide();
			$("#auctionSeller_info").show();
		});
		
		$("body").on("click",".detail_btn",function(){
			var parent_node = $(this).parent("div");
			var check_id = $(this).text();
			var num = $(parent_node).attr("class");
			num=num.split("_");
			num=num[1];
			if(check_id=='댓글 숨기기'){
				for(var i=0; i<num-2; i++){
					$(parent_node).prev(".dept").css("display","none");
					parent_node = $(parent_node).prev(".dept");
				}
				$(this).html("댓글 "+num+"개 모두 보기");
			}else{
				for(var i=0; i<num-2; i++){
					$(parent_node).prev(".dept").css("display","block");
					parent_node = $(parent_node).prev(".dept");
				}
				$(this).html("댓글 숨기기");
			}
			
		});
		
		$("body").on("click",".rereply_cancel",function(){
			var parent = $(this).parents(".re_write_node");
			$(parent).remove();
		})
		
		$("body").on("click","#reply_cancel",function(){
			var parent_node = $(this).parent("div");
			$(parent_node).css("display","none");
		});
		
		$("body").on("click","#auctionReply_input",function(){
			var parent_node = $(this).parents(".auctionView_reply_write");
			var contents = $(parent_node).find(".reply_contents");
			var contents_val = $(contents).val();
			var text = $("#nolist").text();
			alert(text);
			if(contents_val==""){
				alert("댓글을 작성하세요.");
			}else{
				$.ajax({
					url: "../auctionReply",
					type: "post",
					data:{
						pNum:number,
						contents:contents_val,
						m_id:"xs7377"
					},success:function(data){
						$(contents).val("");
						$(".reply_btn_wrap").css("display","none");
						if(text=='등록된 댓글이 없습니다.'){
							$("#auctionView_reply").html(reply(data));
						}else{
							$("#auctionView_reply").prepend(reply(data));
						}
					}
				});
			}
		});
		
		$(".auction_tender_btn").click(function(){
			if(check){
				var num = '${auctionDTO.num}';
				$("#modal_title").html("입찰하기")
				$("body").css("overflow","hidden");
				$("#tender_modal_frame").attr("src","../auction_tender/"+num+"/tender");
				$("#tender_modal_frame").css("height","300px");
				$(".modal-content").css("width","900px");
				$(".modal").css("padding-top","100px");
				$("#myModal").css("display","block");
			}else{
				alert("경매종료된 물품입니다.");
			}
			
		});
		
		$(".auction_buy_btn").click(function(){
			if(check){
				var num = '${auctionDTO.num}';
				$("#modal_title").html("즉시구매")
				$("body").css("overflow","hidden");
				$("#tender_modal_frame").attr("src","../auction_tender/"+num+"/buy");
				$("#tender_modal_frame").css("height","300px");
				$(".modal-content").css("width","900px");
				$(".modal").css("padding-top","100px");
				$("#myModal").css("display","block");
			}else{
				alert("경매종료된 물품입니다.");
			}
		});
		
		$(".auction_likes").mouseover(function(){
			var img = $(this).children("img");
			var alt = $(img).attr("alt");
			if(alt=='no'){
				$(img).attr("src","${pageContext.servletContext.contextPath }/resources/upload/heart_hover.png");
			}
		})
		
		$(".auction_likes").mouseout(function(){
			var img = $(this).children("img");
			var alt = $(img).attr("alt");
			if(alt=='no'){
				$(img).attr("src","${pageContext.servletContext.contextPath }/resources/upload/heart_out.png");
			}
		})
		$(".auction_likes").click(function(){
			var m_id = 'xs7377';
			var img = $(this).children("img");
			$.ajax({
				url:"auctionLike",
				type:"post",
				data:{
					pNum:number,
					m_id:m_id
				},success:function(data){
					if(data==1){
						like_count++;
						$(img).attr("src","${pageContext.servletContext.contextPath }/resources/upload/heart_in.png");
						$(img).attr("alt","yes");
					}else{
						like_count--;
						$(img).attr("src","${pageContext.servletContext.contextPath }/resources/upload/heart_out.png");
						$(img).attr("alt","no");
					}
					$(".like_count_wrap").html(like_count);
					
				}
			});
		});
		$('.modal').click(function () {  
			$("#myModal").css("display","none");
			$("body").css("overflow","auto");
		});
		
		$("body").on("focus",".reply_contents",function(){
			var parent_reply = $(this).parents(".auctionView_reply_write");
			var children_btn = $(parent_reply).children('div');
			$(children_btn).css("display","block");			
		});
		
		$("body").on("focus","#contents_focus",function(){
			var parent_reply = $(this).parents(".auctionView_reply_write");
			var po = $("#auctionView_reply").find(".re_write_node");
			if(po.length>=1){
				$(po).remove();
			}
		});
		
		
		
		$("body").on("click","#reply_in_reply",function(){
			var parent = $(this).parent("div");
			var next = $(parent).next().attr("class");
			var po = $("#auctionView_reply").find(".re_write_node");
			var num = $(this).attr("class");
			num = num.split(" ");
			num = num[0].split("_");
			num = num[1];
			
			var parent_id = $(parent).attr("id");
			parent_id = parent_id.split("_");
			var depth = $(parent).parent().attr("class");
			if(depth!=undefined){
				depth = depth.split("_");
				depth = depth[2];
				depth++;
			}else{
				depth = 1;				
			}
			if(next=='re_write_node'){
				alert("리플을 작성하세요!");
			}else if(depth>4){
				alert("리플을 작성할 수 없습니다.");				
			}else{
				if(po!=null){
					$(po).remove();
				}
				var mod = "<div class='re_write_node'>";
				mod += '<div id="replyNum_'+parent_id[1]+'" class="auctionView_reply_write"style="padding-left:'+(50*depth)+'">';
				mod += '<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload/noImage.png" style="width: 48px; height: 48px; margin: 10px 10px;">';
				mod +='<span><textarea class="reply_contents" rows="" cols=""></textarea></span>';
				mod += '<div class="reply_btn_wrap"><input id="replyCancel_'+num+'" class="reply_btn rereply_cancel" type="button" value="취소"><input class="reply_btn rereply_input" id="replyInput_'+num+'" type="button" value="댓글"></div>';
				mod += '</div></div>';
				$(parent).after(mod);
			}
		});
		
		function relate_list(c,p,num){
			$.ajax({
				url:"../relateList",
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
		
		function reply_list(num,lastRow){
			$.ajax({
				url : "../replyView",
				type : "post",
				data :{
					pNum:num,
					lastRow:lastRow
				},
				success:function(data){
					var text = "";
					if(data.length>0){
						$(data).each(function(){
							text += reply(this);
						});
					$("#auctionView_reply").html(text);
						var j = 0;
						$(".reply_wrap").map(function(){
							var cl = $(this).parent().attr("class");

							if(cl==undefined){
								if(j>=3){
									$(this).before("<div class='detail replyDe_"+j+"'><span class='detail_btn'>댓글 "+j+"개 모두 보기</span></div>");
								}
								j=0;
							}else{
								j++;
								if(j>=3){
									$(this).parent().css("display","none");
								}
							}
						});
						var last_node = $("#auctionView_reply").children(".dept").last();
						var display = $(last_node).css("display");
						
						if(data.length>=lastRow){
							$("#auctionView_reply").append("<div id='reply_more_btn'>더보기</div>")
						}else{
							if(display=='none'){
								$(last_node).after("<div class='detail replyDe_"+j+"'><span class='detail_btn'>댓글 "+j+"개 모두 보기</span></div>");
							}
						}
					}else{
						$("#auctionView_reply").html("<div id='nolist' colspan='2'>등록된 댓글이 없습니다.</div>")
					}
				}
			});
		}
		
		
		function reply(data){
			var mod = "";
				if(data.depth>0){
					mod+="<div class='dept reply_plus_"+data.depth+"'>";
					mod += "<div class='reply_wrap' id='replyNum_"+data.num+"' style='padding-left:"+(50*data.depth)+"px'>";
				}else{
					mod += "<div class='reply_wrap' id='replyNum_"+data.num+"'>";
				}
				mod += "<img class='reply_imgs' src='${pageContext.servletContext.contextPath }/resources/upload/noImage.png'>";
				mod += "<span id='reply_in_reply' class='replyIn_"+data.num+" reply_in_btn'>답글</span><span id='rereply_cancel' class='replyOut_"+data.num+" reply_in_btn'>신고</span>";
				mod +="<span class='reply_mid'>"+data.m_id+"</span><span class='reply_mid'>"+data.reg_date+"</span>";
				mod += "<pre class='reply_contents_pre'>"+data.contents+"</pre></div>";
				if(data.depth>0){
					mod+="</div>"
				}
			return mod;
		}
		
	});
	
	

//Set the date we're counting down to
var countDownDate = new Date(period).getTime();

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    
    // Find the distance between now an the count down date
	var now = new Date().getTime();
	distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    // Output the result in an element with id="demo"
    $(".demo").html(days + "일 " + hours + "시간 "
    + minutes + "분 " + seconds + "초 "
	);
    
    if (distance < 0) {
        clearInterval(x);
        var num = "${auctionDTO.num}";
        $.ajax({
        	url:"../auctionBid",
        	type:"post",
        	data:{
        		num:num
        	},success:function(data){
        		if(data=='y'){
        			$(".demo").html("경매 종료");
			        $(".demo").css("color","#e61722");
			        check=false;
        		}
        	}
        });
    }
    // If the count down is over, write some text 

}, 0);

</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
*{
	box-sizing: border-box;
	word-wrap: break-word;
	word-break:break-all;
}

#tender_modal_frame{
	width: 100%;
	overflow: hidden;
	frameborder: 0;
}


#auctionView_body{
	left:0;
	top:0;
	margin: 140px auto;
}


#auctionView_rule{
	width: 95%;
	margin: 0 auto;
	height: 150px;
	top: 0;
	font-size: 0.8em;
	color: silver;
}

#auctionView_header{
	width: 1000px;
	overflow:hidden;
	height:auto;
	margin: 0 auto;
	display: table;
}
.auctionView_thumbnail{
	width: 500px;
	padding: 30px 30px;
	margin-top: 25px;
	float: left;
	display: table-cell;
	margin: 0 auto;
}
.auctionView_title{
	width: 450px;
	padding: 30px 30px;
	margin-left: 50px;
	float: left;
	display: table-cell;
}


#auctionView_tender{
	width: 100%;
	height: 0;
	position: fixed;
    z-index: 1;
    top: 0;
    overflow:hidden;
	background-color: #333333;
	box-shadow: 0 0 0 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	transition: 0.5s; 
}


#auctionVeiw_body{
	width: 1000px;
	margin: 0 auto;
	padding: 0 50px;
	background-color: #f8f8f8;
	padding-top: 50px;
}

#auctionView_info{
	width: 100%;
	margin: 0 auto;
	padding: 20px 20px;
	background-color: white;
	overflow:hidden;
    height: auto;
    min-height: 500px;
}
.sel_title_wrap{
	width: 100%;
	padding-bottom: 10px;
	border-bottom: 1px solid silver;
}
#title_text{
	overflow: hidden;
	height: 60px;
}

.auction_likes{
	margin-left: 160px;
}

/* auctionView reply  */

.reply_in_btn{
	width: 30px;
	height: 20px;
	margin-left: 5px;
	float: right;
	color: silver;
	font-size: 0.8em;
	cursor: pointer;
}

#auction_reply_box{
	background-color: white;
	width: 900px;
	margin: 0 auto;
	border-radius: 20px;
}

#auctionView_reply_wrap{
	width: 1000px;
	margin: 0 auto;
	overflow: hidden;
	height: auto;
	min-height: 300px;	
	background-color: #f8f8f8;
	padding-bottom: 40px;
}
.auctionView_reply_write{
	width: 80%;
	margin: 0 auto;
	border-bottom: 1px solid silver;
	text-align: center;
}
.reply_wrap{
	width: 71%;
	height: auto;
	overflow: hidden;
	min-height: 60px;
	background-color: white;
	margin: 10 auto;
}
.reply_contents{
	width:80%;
	height:48px;
	border: 1px solid silver;
	resize: none;
	margin: 10px 10px;
	border-radius: 5px;
}
.reply_btn_wrap{
	width: 100%;
	height: 50px;
	margin-left: 78%;
	display: none;
}

.reply_btn {
  border: none;
  outline: 0;
  padding: 5px;
  color: white;
  background-color: #167ac6;
  text-align: center;
  cursor: pointer;
  width: 60px;
  font-size: 0.8em;
  margin-left: 15px;
  float: left;
  border-radius: 5px;
}
.reply_contents_pre{
	margin-left: 100px;
	margin-top: 20px;
}
.reply_mid{
	float: left;
	margin: 0 10px;
	font-size: 0.7em;
}
.detail{
	color: silver;
	font-size: 0.7em;
	width: 100%;
	padding-left: 160px;
	padding-bottom: 20px;
}
.detail_btn{
	cursor: pointer;
}

.reply_imgs{
	width:48px;
	height:48px;
	float:left;
}

.dept .reply_imgs{
	width: 42px;
	height: 42px;
}

#reply_more_btn{
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color:  #333333;
  text-align: center;
  cursor: pointer;
  width: 80%;
  font-size: 18px;
  margin-left: 90px;
  margin-bottom: 20px;
}

#reply_more_btn:hover, a:hover {
  opacity: 0.7;
}
.reply_btn:hover, a:hover {
  opacity: 0.7;
}


/* reply css End */

/* seller_bar */

#auctionView_seller{
	width: 1000px;
	height: auto;
	overflow: hidden;
	min-height: 500px;	
	padding: 20px 20px;
	margin: 0 auto;
	background-color: #f8f8f8;
}


#auctionView_sell_wrap{
	width: 100%;
	height: 50px;
}

#auctionView_sell_bar{
	width: 1000px;
	height: 50px;
	margin: 0 auto;
}

#seller_data{
	width: 50%;
	height: 50px;
	float: left;
}
#product_data{
	width: 50%;
	height: 50px;
	float: left;
}

.sell_btn_wrap {
  width: 100%;
  height: 100%;
  bottom: 25px;
  right: 30px;
  border: none;
  outline: none;
  background-color: silver;
  color: black;
  cursor: pointer;
  padding: 15px;
  font-size: 1.2em;
  font-weight: bolder;
}

.sell_btn_wrap:hover {
  opacity: 0.7;
}

/* sell_bar End */

/* tender_bar */

#tender_btn_wrap{
	width: 100%;
}

#auctionView_tender_contents{
	margin: 0 auto;
	width: 1000px;
}

#auction_tender_info{
	float: left;
	width: 70%;
	text-align: center;
}

.product_text{
	text-align: left;
	padding-left: 15px;
	border-bottom: 1px solid #c0c0c0;
	padding-bottom: 15px;
	color: #333333;
	font-size: 1.2em;
	font-weight: bolder;
}

.auctionView_tender_btn {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px;
  color: white;
  background-color: #ca3038;
  text-align: center;
  cursor: pointer;
  width: 185px;
  font-size: 20px;
  font-weight: bolder;
  margin-left: 7px;
  border-radius: 5px;
}


.auctionView_tender_bar_btn {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 5px;
  color: white;
  background-color: #ca3038;
  text-align: center;
  cursor: pointer;
  width: 120px;
  font-size: 18px;
  font-weight: bolder;
  margin-left: 4%;
  border-radius: 5px;
}


/* tender_bar End */
#nolist{
	margin: 50px auto;
	width: 80%;
	height: 100px;
	text-align: center;
}

#auctionView_btn_wrap{
	float: left;
	width: 30%;
	padding: 5px 10px;
}

#auctionVeiw_category{
	height: 50px;
	width: 100%;
	padding: 9px;
	vertical-align: middle;
	border-bottom: 1px solid silver;
	border-top: 1px solid silver;
}
.f-nav{z-index: 10; position: fixed; left: 0; top: 0; width: 100%;}



.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 11; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    width: 900px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}
#auctionView_product{
	width: 100%;
	margin-top: 20px;
}

#auctionView_related{
	width: 1000px;
	height: 400px;
	margin: 0 auto;
	background-color:#f8f8f8;
	padding-top: 25px;
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  text-align: center;
  font-family: arial;
}

.seller_container {
  padding: 0 16px;
}

.seller_container::after {
  content: "";
  clear: both;
  display: table;
}

#bidder_btn{
  border: none;
  outline: 0;
  display: inline-block;
  padding: 2px;
  color: black;
  text-align: center;
  cursor: pointer;
  font-size: 18px;
}


#select_btn{
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color:  #e91e63;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}
.like_count_wrap{
	width: 30px;
	font-size: 15px;
}

.sel_info{
  display: inline-block;
  color: #f8f8f8;
  font-size: 13px;
  margin-right: 10px;
  vertical-align: middle;
  padding: 0;
}

#scrol_top_btn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 8;
  border: none;
  outline: none;
  background-color: #333333;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 10px;
}

#scrol_top_btn:hover, a:hover {
  opacity: 0.7;
}


#select_btn:hover, a:hover {
  opacity: 0.7;
}

.auction_buy_btn:hover, a:hover {
  opacity: 0.7;
}

.auction_tender_btn:hover, a:hover {
  opacity: 0.7;
}
</style>
</head>
<body id="auctionView_body">
	<div id="auctionVeiw_category"></div>
	<div id="auctionView_header">
		<div class="auctionView_thumbnail"></div>
		<div class="auctionView_title">
			<div class="sel_title_wrap">
				<h2 id="title_text">${auctionDTO.title }</h2>
				<span id="bidder_btn">입찰자 : ${bidder } 명</span>
				<span class="auction_likes">
					<img alt="no" src="${pageContext.servletContext.contextPath }/resources/upload/heart_out.png">
					<span class="like_count_wrap">${auctionDTO.likes }</span>
				</span>
			</div>
			<div id="auctionView_product">
				<div id="auction_product_info">
					<p class="product_text"><span>시작가  </span>${auctionDTO.min_price }원</p>
					<h3 class="product_text">즉시 구매가  ${auctionDTO.max_price }</h3>
					<h3 class="product_text real_tprice"></h3>
					<h2 class="product_text demo"></h2>
					<h3 class="product_text auctionView_period"></h3>
				</div>
				<div id="tender_btn_wrap">
					<input type="button" class="auctionView_tender_btn auction_tender_btn" value="입찰하기">
					<input type="button" class="auctionView_tender_btn auction_buy_btn"value="즉시구매">
				</div>
			</div>
		</div>
	</div>
		<div id="auctionView_sell_wrap">
		<div id="auctionView_sell_bar">
			<div id="product_data">
				<button id="product_btn" class="sell_btn_wrap">물품 정보</button>
			</div>
			<div id="seller_data">
				<button id="seller_btn" class="sell_btn_wrap">판매자 정보</button>
			</div>
		</div>
	</div>
	<div id="auctionView_tender">
		<div id="auctionView_tender_contents">
			<div id="auction_tender_info">
				<h3 class="sel_info">시작가    ${auctionDTO.min_price }</h3>
				<h3 class="sel_info">즉시 구매가   ${auctionDTO.max_price }</h3>
				<h3 class="sel_info real_tprice"></h3>
				<h2 class="sel_info demo"></h2>
				<h3 class="sel_info auctionView_period"></h3>
			</div>
			<div id="auctionView_btn_wrap">
				<input type="button" class="auctionView_tender_bar_btn auction_tender_btn" value="입찰하기">
				<input type="button" class="auctionView_tender_bar_btn auction_buy_btn" value="즉시구매">
			</div>
		</div>
	</div>
<div id="auctionProduct_info">
	<div id="auctionVeiw_body">
		<div id="auctionView_rule">소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 1항 또는 제 3항에 따라 청약철회를 하고 동법 제 18조 제 1항에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구하고 결제 대금의 환급이 3영업일을 넘게 지연된 경우, 소비자는 전자상거래등에서 소비자 보호에 관한 법률 제 18조 제2항및 동법 시행령 제 21조 2에 따라 지연일수에 대하여 연 20%의 지연배상급을 신청할 수 있습니다. 주문취소 및 결제대금의 환급신청은 “나의 쇼핑정보”에서 하실 수 있으며, 지연배상급 신청에 대한 자세한 문의는 판매자정보의 연락처로 해주시기 바랍니다.</div>
		<div id="auctionView_info">
			${auctionDTO.contents }		
		</div>
	</div>
	
	<div id="auctionView_related">
	</div>
	
	<div id="auctionView_reply_wrap">
		<div id="auction_reply_box">
				<div class="auctionView_reply_write">
					<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload/noImage.png" style="width: 48px; height: 48px; margin: 10px 10px;">
					<span><textarea id="contents_focus" class="reply_contents" rows="" cols=""></textarea></span>
					<div class="reply_btn_wrap"><input class="reply_btn" id="reply_cancel" type="button" value="취소"><input class="reply_btn" id="auctionReply_input" type="button" value="댓글"></div>
				</div>
				<div id="auctionView_reply">
				</div>
		</div>
	</div>
</div>	
<div id="auctionSeller_info">
			<div id="auctionView_seller">
				<div class="card">
				  <img id="" src="${pageContext.servletContext.contextPath }/resources/upload/noImage.png" alt="John" style="width:100%; height: 200px;">
				  <div class="seller_container">
				    <h1>${auctionDTO.m_id }</h1>
				   <p><button id="select_btn">판매자 물품보기</button></p>
				  </div>
				</div>
			</div>
</div>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 id="modal_title"></h2>
    </div>
    <div class="modal-body">
    <iframe id="tender_modal_frame" frameborder=0 framespacing=0 scrolling=no>
    
    </iframe>

    </div>
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>

</div>
<button id="scrol_top_btn">Top</button>

</body>
</html>