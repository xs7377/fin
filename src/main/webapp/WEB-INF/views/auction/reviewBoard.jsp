<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	$(function(){
		var curPage = 1;
		var p_id = "${p_id}";
		$(document).ready(function(){
			$(".media-object").map(function(){
				var id = $(this).attr("id");
				id = id.split("_");
				var fName = imgs(id[1]);
				$(this).attr("src","${pageContext.servletContext.contextPath }/resources/upload/"+fName);
			});
			$(".media").map(function(){
				var depth = $(this).attr("id");
				depth = depth.split("_");
				var pad = depth[1]*1*50;
				$(this).css("padding-left",pad);
			});
			
			$(".score_wrap").map(function(){
				var id = $(this).attr("id");
				id = id.split("_");
				id = id[1]*1;
				for(var i=1; i<6; i++){
					if(id>=i){
						$(this).prepend('<i class="fa fa-star" style="font-size:20px;color:#FFD700"></i>');
					}else{
						$(this).append('<i class="fa fa-star-o" style="font-size:20px"></i>');
					}
				}
				
			});
			
		});
		
		function imgs(id){
			var imgs = '';
			$.ajax({
				url:"${pageContext.servletContext.contextPath }/member/memberImages",
				type:"post",
				async:false,
				data:{
					id:id
				},success:function(data){
					imgs = data;
				}
			});
			if(imgs==''){
				imgs = "noImage.png";
			}
			return imgs;
		}
		
		$("body").on("click",".review_reply_cancel",function(){
			var parent = $(this).parents(".review_reply_wrap");
			var gparent = $(this).parents(".review_wrap");
			var find = $(gparent).find(".media");
			$(find).attr("hidden",false);
			$(parent).remove();
		});
		
		$(".remove_review").click(function(){
			var num = $(this).attr("id");
			num = num.split("_");
			var result = confirm("리뷰 답글을 삭제하시겠습니까?");
			if(result){
				$.ajax({
					url:"${pageContext.servletContext.contextPath }/review/reviewDelete",
					type:"get",
					data:{
						num:num[1]
					},success:function(data){
						reload(curPage);
					}
				});
			}
		})
		
		
		$("body").on("click",".review_reply",function(){
			var parent = $(this).parents(".media");
			var gparent = $(parent).parents(".review_wrap");
			var find = $(gparent).find(".review_reply_wrap");
			var id = $(parent).find(".media-object").attr("id");
			id = id.split("_");
			var num = $(this).attr("id");
			num = num.split("_");
			
			if(find.size()>0){
				$(find).remove();
			}
			
			var mod = "<div class='review_reply_wrap'>";
			mod += '<div id="replyNum_'+id[1]+'" class="review_reply_mid">';
			mod += '<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload/${member.fname}" style="width: 48px; height: 48px; margin: 10px 10px;">';
			mod +='<span><textarea id="review_contents" class="reply_contents" rows="" cols=""></textarea></span>';
			mod += '<div class="review_reply_btn_wrap"><input id="replyCancel_'+num[1]+'" class="reply_btn review_reply_cancel" type="button" value="취소"><input class="reply_btn review_reply_input" id="replyInput_'+num[1]+'" type="button" value="댓글"></div>';
			mod += '</div></div>';
			$(parent).after(mod);
		});
		
		$("body").on("click",".mod_review",function(){
			var parent = $(this).parents(".media");
			var gparent = $(parent).parents(".review_wrap");
			var find = $(gparent).find(".review_reply_wrap");
			var id = $(parent).find(".media-object").attr("id");
			id = id.split("_");
			var num = $(this).attr("id");
			num = num.split("_");
			
			if(find.size()>0){
				$(find).remove();
			}
				var contents = $(parent).find(".review_contents_wrap").html();
				var mod = "<div class='review_reply_wrap'>";
				mod += '<div id="replyNum_'+id[1]+'" class="review_reply_mid">';
				mod += '<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload/${member.fname}" style="width: 48px; height: 48px; margin: 10px 10px;">';
				mod +='<span><textarea id="review_contents" class="reply_contents" rows="" cols="">'+contents+'</textarea></span>';
				mod += '<div class="review_reply_btn_wrap"><input id="replyCancel_'+num[1]+'" class="reply_btn review_reply_cancel" type="button" value="취소"><input class="reply_btn review_mod_update" id="replyInput_'+num[1]+'" type="button" value="수정"></div>';
				mod += '</div></div>';
				$(parent).after(mod);
				$(parent).attr("hidden",true);
		});
		
		$("body").on("click",".review_mod_update",function(){
			var contents = $("#review_contents").val();
			var num = $(this).attr("id");
			num = num.split("_");
			$.ajax({
				url: "${pageContext.servletContext.contextPath }/review/reviewUpdate",
				type: "post",
				data:{
					title:"판매자 답변",
					contents:contents,
					score:0,
					num:num[1]
				},success:function(data){
					reload(curPage);
				}
			});
		});
		
		$("body").on("click",".review_reply_input",function(){
			var num = $(this).attr("id");
			var id = $(this).parents(".review_reply_mid").attr("id");
			var con = $("#review_contents").val();
			id = id.split("_");
			num = num.split("_");
			$.ajax({
				url: "${pageContext.servletContext.contextPath }/review/revieReply",
				type: "post",
				async: false,
				data:{
					title:"판매자 답글",
					contents:con,
					m_id:id[1],
					num:num[1],
					p_id:"${member.id}"
				},success:function(){
					reload(curPage);
				}
			});
		});
		
		function reload(curPage){
			$.ajax({
				url: "${pageContext.servletContext.contextPath }/review/reviewList",
				type: "get",
				async: false,
				data: {
					curPage:curPage,
					id:p_id
				},success:function(data){
					$("#review_board").html(data);
				}
			});
		}
	});
</script>
<style type="text/css">
.review_wrap{
	width: 100%;
	height: auto;
	overflow: hidden;
	min-height: 400px;
	padding-bottom: 50px;
}
.review_reply{
	margin-left: 25px;
}
.media{
	margin-left: 25px;
	margin-top: 20px;
}
.media-left{
	float: left;
	margin-right: 10px;
}

.review_reply{
	cursor: pointer;
}

.review_reply_wrap{
margin: 5px 60px;;
} 
.media-heading{
	font-size: 0.9em;
	color: gray;
	font-weight: normal;
	margin-top: 5px;
	margin-bottom: 5px;
	width: 85%;
}

.review_reply_btn_wrap{
	float: right;
	margin-right: 100px;
}

.review_line{
	border: none;
	border-bottom: 1px solid silver;
}
.buyer_behind{
	width: 100%;
	height: 70px;
	padding: 20px 20px;
}

.score_wrap{
	float: right;
}
.review_reply{
	font-size: 0.8em;
	color: gray;
	float: right;
	margin-right: 50px;
}
.seller_mode_btn{
	float: right;
	margin-right: 10px;
	font-size: 0.8em;
	color: gray;
	cursor: pointer;
}
.page_wrap{
	width: 100%;
	height: 50px;
}
</style>
</head>
<body>
<div class="review_wrap">
<div class="buyer_behind">구매자 후기</div>
<c:forEach items="${list }" var="l">
      <div class="media" id="depth_${l.depth }">
        <div class="media-left">
        <c:if test="${l.depth>0 }">
          <img id="buyerId_${l.p_id }" src="" class="media-object" style="width:48px; height: 48px;">
        </c:if>
        <c:if test="${l.depth==0 }">
          <img id="buyerId_${l.m_id }" src="" class="media-object" style="width:48px; height: 48px;">
        </c:if>
        </div>
        <div class="media-body">
        <c:if test="${l.depth>0 }">
          <h4 class="media-heading">${l.p_id } <small><i>${l.reg_date }</i></small></h4>
        </c:if>
        <c:if test="${l.depth==0 }">
          <h4 class="media-heading">${l.m_id } <small><i>${l.reg_date }</i></small><span id="score_${l.score }" class="score_wrap"></span></h4>
        </c:if>
          <div>${l.title } - <span class="review_contents_wrap">${l.contents }</span>
          <c:if test="${l.p_id eq member.id && l.depth==0}">
          	<span id="reviewNum_${l.num }" class="review_reply">답글</span>
          </c:if>
          <c:if test="${l.p_id eq member.id && l.depth>0}">
          	<span class="seller_mode_btn remove_review" id="reviewDel_${l.num }" style="margin-right: 50px;">삭제</span><span id="reviewMod_${l.num }" class="seller_mode_btn mod_review">수정</span>
          </c:if>
          </div>
    </div>
  </div>
</c:forEach>
</div>
<div class="page_wrap"></div>
</body>
</html>