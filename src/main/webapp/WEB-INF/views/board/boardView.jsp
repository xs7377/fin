<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/img_view.css?ver=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.box {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

/* wishView reply  */
.reply_in_btn {
	width: 30px;
	height: 20px;
	margin-left: 5px;
	float: right;
	color: silver;
	font-size: 0.8em;
	cursor: pointer;
}

#wishView_reply {
	margin-bottom: 15px;
}

#wishView_reply_wrap {
	width: 1000px;
	margin: 0 auto;
	border: 1px solid #f2f2f2;
	overflow: hidden;
	height: auto;
	min-height: 300px;
	box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.wishView_reply_write {
	width: 80%;
	margin: 20px auto;
	border-bottom: 1px solid silver;
	text-align: center;
}

.reply_wrap {
	width: 71%;
	height: auto;
	overflow: hidden;
	min-height: 60px;
	background-color: white;
	margin: 10 auto;
}

.reply_contents {
	width: 80%;
	height: 48px;
	border: 1px solid silver;
	resize: none;
	margin: 10px 10px;
	border-radius: 5px;
}

.reply_btn_wrap {
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

.reply_contents_pre {
	margin-left: 100px;
	margin-top: 20px;
}

.reply_mid {
	float: left;
	margin: 0 10px;
	font-size: 0.7em;
}

.detail {
	color: silver;
	font-size: 0.7em;
	width: 100%;
	padding-left: 160px;
	padding-bottom: 20px;
}

.detail_btn {
	cursor: pointer;
}

.reply_imgs {
	width: 48px;
	height: 48px;
	float: left;
}

.dept .reply_imgs {
	width: 42px;
	height: 42px;
}

#reply_more_btn {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #333333;
	text-align: center;
	cursor: pointer;
	width: 85%;
	font-size: 18px;
	margin-left: 80px;
}

#reply_more_btn:hover, a:hover {
	opacity: 0.7;
}

.reply_btn:hover, a:hover {
	opacity: 0.7;
}

/* reply css End */
</style>
<script type="text/javascript">
	
	var lastRow = 10;
	var number='${dto.num}';
	alert(number);
	$(function(){
		
		var board="${board}";
		if(board!='notice'){
			$("#frm").hide();
			$("#reply").click(function(){
				$("#frm").toggle(500);
			});	
		}
		/* 좋아요부분 */
		$("body").on("click", "#likesBnt", function() {
			// 처음에는 view에서 불러오고 두번째부터는 ajax므로 count1로 만들어준다	
			 //var like = $(this).attr("alt");
			var kind='${board}';
			var pnum='${dto.num}';
			var m_id='${member.id}';
			var like = $(this).attr("class");
			//좋아요 안 눌렀으면 'LIKE'가 나와야 한다.
			//false가 넘어오는데 왜 true로 들어가냐고;;
			//true가 넘어오면 "좋아요" 상태이다.
			if (like == "CANCLE") {//현재 상태가 좋아요면
						$(this).attr("class","LIKE");
						$(this).html("<i class=\"fa fa-heart\" style=\"font-size:48px;color:red\"></i>");
			} else {
						$(this).attr("class","CANCLE");
						$(this).html("<i class=\"fa fa-heart-o\" style=\"font-size:48px;color:red\"></i>");
			}
			$.ajax({
				url : "../likes/likesInsert",
				type: "POST",
				data : {
					kind : kind,
					pnum : pnum,
					m_id : m_id
				},
				success : function(data) {
					alert(data.msg);
					$("#result").html('<span>좋아요'+ data.count+'</span>');
				}
		})
	});
	
		
		
		//여기서부터 손 좀 보자
		$("body").on("click", "#reply_more_btn", function() {
			lastRow += 10;
			alert(lastRow);
			reply_list(number, lastRow);
		});
		

		$("body").on("click", ".rereply_input", function() {
			var num = $(this).attr("id");
			var parent_node = $(this).parents(".wishView_reply_write");
			var contents = $(parent_node).find(".reply_contents");
			var contents_val = $(contents).val();
			var parent = $(this).parents(".re_write_node");
			num = num.split("_");
			num = num[1];
			
			if (contents_val == "") {
				alert("댓글을 작성하세요.");
			} else {
				$.ajax({
					url : "./wishViewReply",
					type : "post",
					data : {
						pNum : number,
						contents : contents_val,
						m_id : "xs7377",
						num : num
					},
					success : function(data) {
						$(parent).before(reply(data));
						$(parent).remove();
					}
				});
			}
		});

		$("body").on("click", ".detail_btn", function() {
			var parent_node = $(this).parent("div");
			var check_id = $(this).text();
			var num = $(parent_node).attr("class");
			num = num.split("_");
			num = num[1];
			if (check_id == '댓글 숨기기') {
				for (var i = 0; i < num - 2; i++) {
					$(parent_node).prev(".dept").css

					("display", "none");
					parent_node = $(parent_node).prev(".dept");
				}
				$(this).html("댓글 " + num + "개 모두 보기");
			} else {
				for (var i = 0; i < num - 2; i++) {
					$(parent_node).prev(".dept").css

					("display", "block");
					parent_node = $(parent_node).prev(".dept");
				}
				$(this).html("댓글 숨기기");
			}

		});

		$("body").on("click", ".rereply_cancel", function() {
			var parent = $(this).parents(".re_write_node");
			$(parent).remove();
		})

		$("body").on("click", "#reply_cancel", function() {
			var parent_node = $(this).parent("div");
			$(parent_node).css("display", "none");
		});
		
		
		//여기도 손 보자

		$("body").on("click", "#wishReply_input", function() {
			var parent_node = $(this).parents(".wishView_reply_write");
			var contents = $(parent_node).find(".reply_contents");
			var contents_val = $(contents).val();
			var text = $("#nolist").text();
			
			alert(text);
			
			if (contents_val == "") {
				alert("댓글을 작성하세요.");
			} else {
				$.ajax({
					url : "./wishViewReply",
					type : "post",
					data : {
						pNum : number,
						contents : contents_val,
						m_id : "xs7377"
					},
					success : function(data) {
						$(contents).val("");
						$(".reply_btn_wrap").css

						("display", "none");
						if (text == '등록된 댓글이 없습니다.') {

							$("#wishView_reply").html(reply(data));
						} else {

							$("#wishView_reply").prepend(reply(data));
						}
					}
				});
			}
		});
		
		
		
		//여기도 
		$("body").on("focus",".reply_contents",function(){
			var parent_reply = $(this).parents(".wishView_reply_write");
			var children_btn = $(parent_reply).children('div');
			$(children_btn).css("display","block");			
		});
		
		
		//여기또한
		$("body").on("focus","#contents_focus",function(){
			var parent_reply = $(this).parents(".wishView_reply_write");
			var po = $("#wishView_reply").find(".re_write_node");
			if(po.length>=1){
				$(po).remove();
			}
		});
		
		
		//여기도 
		$("body").on("click","#reply_in_reply",function(){
			var parent = $(this).parent("div");
			var next = $(parent).next().attr("class");
			var po = $("#wishView_reply").find(".re_write_node");
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
				
				//여기도 
				var mod = "<div class='re_write_node'>";
				mod += '<div id="replyNum_'+parent_id[1]+'"class="wishView_reply_write"style="padding-left:'+(50*depth)+'">';
				mod += '<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload/noImage.png" style="width: 48px; height: 48px; margin: 10px 10px;">';
				mod +='<span><textarea class="reply_contents" rows="" cols=""></textarea></span>';
				mod += '<div class="reply_btn_wrap"><input id="replyCancel_'+num+'" class="reply_btn rereply_cancel" type="button" value="취소"><input class="reply_btn rereply_input" id="replyInput_'+num+'" type="button" value="댓글"></div>';
				mod += '</div></div>';
				$(parent).after(mod);
			}
		});
		
		function reply_list(num,lastRow){
			$.ajax({
				url : "./replyView",
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
						
						//여기도 
					$("#wishView_reply").html(text);
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
						var last_node = $("#wishView_reply").children(".dept").last();
						var display = $(last_node).css("display");
						
						if(data.length>=lastRow){
							$("#wishView_reply").append("<div id='reply_more_btn'>더보기</div>")
						}else{
							if(display=='none'){
								$(last_node).after("<div class='detail replyDe_"+j+"'><span class='detail_btn'>댓글 "+j+"개 모두 보기</span></div>");
							}
						}
					}else{
						$("#wishView_reply").html("<div id='nolist' colspan='2'>등록된 댓글이 없습니다.</div>")
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
</script>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>
	<div class="box">
		<h2>${board}</h2>
		<table class="table table-hover">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
			</tr>
			<tr>
				<td>${dto.num}</td>
				<td>${dto.title }</td>
				<td>${dto.m_id}</td>
				<td>${dto.hit}</td>
			</tr>
			<tr>
				<td colspan="4">내용</td>
			</tr>
			<tr>
				<td colspan="4">${dto.contents}</td>
			</tr>
		</table>

		<c:if test="${member.id eq dto.m_id}">
			<a class="btn btn-primary" href="./${board}Update?num=${dto.num}">수정</a>
			<a class="btn btn-danger" href="./${board}Delete?num=${dto.num}">삭제</a>
		</c:if>

		<c:choose>
			<c:when test="${check eq 1}">
				<span id="likesBnt" class="LIKE"><span class="fa fa-heart"
					style="font-size: 48px; color: red; cursor: pointer;"></span></span>
			</c:when>

			<c:when test="${check eq 0}">
				<span id="likesBnt" class="CANCLE"><span
					class="fa fa-heart-o"
					style="font-size: 48px; color: red; cursor: pointer;"></span></span>
			</c:when>
		</c:choose>

		<div id="result">
			<span>좋아요 ${count}</span>
		</div>



	<!-- 여기로 안 들어오는구나 생각해보니까  -->
		<!-- 댓글 여기도 Wish로 된 곳 다 고쳐야지 -->
	
	<c:if test="${board == 'wish'}">
	
		<div id="wishView_reply_wrap">


			<div>
				<div class="wishView_reply_write">
					<img alt=""
						src="${pageContext.servletContext.contextPath }/resources/upload/noImage.png"
						style="width: 48px; height: 48px; margin: 10px 10px;"> <span>
						<textarea id="contents_focus" class="reply_contents" rows=""
							cols=""></textarea>
					</span>
					<div class="reply_btn_wrap">
						<input class="reply_btn" id="reply_cancel" type="button"value="취소"> 
						<input class="reply_btn" id="wishReply_input" type="button" value="댓글">
					</div>
				</div>
			</div>

			<div id="wishView_reply"></div>



		</div>
		</c:if>
		<!-- 댓글 끝ㅅ-->



		<div style="border: 3px solid red;">
			<i><a href="#" id="m${f.m_id}" class="w3-bar-item w3-button"
				data-toggle="modal" data-target="#myReport">신고</a></i> <a
				class="btn btn-success" href="${board}List?curPage=1">목록으로</a>
			<c:if test="${board ne 'notice'}">
				
				<input type="button" class="btn btn-info" value="답글 달기" id="reply">
				
				<form action="${board}Reply" method="post" id="frm">
					<h3>Reply</h3>
					<table class="table table-hover">
						<tr>
							<td>제목</td>
							<td>작성자</td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" name="title"></td>
							<td><input type="text" class="form-control" name="m_id"
								readonly="readonly" value="${sessionScope.member.id}"></td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<td colspan="2"><textarea style="height: 200px;" rows=""
									cols="" class="form-control" name="contents"></textarea></td>
						</tr>
					</table>

					<input type="hidden" name="num" value="${dto.num}">
					<button class="btn btn-warning">답글 작성</button>

				</form>
			</c:if>
		</div>




		<!--글쓰기 몸체끝  -->
	</div>


	<!-- MODAL 신고기능 처리  -->
	<div class="modal fade" id="myReport" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">신 고</h4>
				</div>
				<div class="modal-body">
					<form action="../report/reportReg" method="post">
						KIND<input type="text" name="kind" value="${board}"> <input
							type="number" name="pnum" value="${dto.num}">
						<p>
							신 고 자 <input type="text" name="from_id" value="${member.id}"
								readonly="readonly">
						</p>
						<p>
							대 상 <input type="text" name="to_id" value="${dto.m_id }"
								readonly="readonly">
						</p>
						<p>
							제 목 <input type="text" name="title">
						<p>
							<textarea rows="10" cols="40" name="contents"></textarea>
						</p>
						<p>
							<button class="btn btn-default">작성</button>
						</p>
					</form>
					<button type="button" id="rClose" class="btn btn-default"
						data-dismiss="modal">Close</button>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>

	<!-- MODAL 신고 기능 끝 -->



	<%@ include file="../sub/footer.jspf"%>
</body>
</html>