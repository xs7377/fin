<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	.box{
		width: 1000px;
		margin: 0 auto;
		text-align: center;
	}
</style>
<script type="text/javascript">
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
		
		
		
		
	});
</script>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>
	<div class="box">
		<h2>${board}</h2>
		<table class="table table-hover">
			<tr>
				<td>번호</td><td>제목</td><td>작성자</td><td>조회수</td>
			</tr>
			<tr>
				<td>${dto.num}</td><td>${dto.title }</td><td>${dto.m_id}</td><td>${dto.hit}</td>
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
		<span id="likesBnt" class="LIKE"><span class="fa fa-heart" style="font-size:48px;color:red; cursor:pointer;"></span></span>
	</c:when>
	
	<c:when test="${check eq 0}">
		<span id="likesBnt" class="CANCLE"><span class="fa fa-heart-o" style="font-size:48px;color:red;cursor:pointer;"></span></span>
	</c:when>
</c:choose>

<div id="result">
	<span>좋아요 ${count}</span>
</div>
				
<i><a href="#" id="m${f.m_id}" class="w3-bar-item w3-button" data-toggle="modal" data-target="#myReport">신고</a></i>

<a class="btn btn-success" href="${board}List?curPage=1">목록으로</a>
		<c:if test="${board ne 'notice'}">
			<input type="button" class="btn btn-info" value="답글 달기" id="reply">
			<form action="${board}Reply" method="post" id="frm">
				<h3>Reply</h3>
				<table class="table table-hover">
					<tr>
						<td>제목</td><td>작성자</td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" name="title"></td>
						<td><input type="text" class="form-control" name="m_id" readonly="readonly" value="${sessionScope.member.id}"></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><textarea style="height: 200px;"rows="" cols="" class="form-control" name="contents"></textarea></td>
					</tr>
				</table>
				
				<input type="hidden" name="num" value="${dto.num}">
				<button class="btn btn-warning">답글 작성</button>
				
			</form>
		</c:if>
	</div>
	
		<!-- MODAL 신고기능 처리  -->
<div class="modal fade" id="myReport" role="dialog">
    <div class="modal-dialog">
   	<!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">신 고 </h4>
        </div>
        <div class="modal-body">
          <form action="../report/reportReg" method="post">
          	KIND<input type="text" name="kind" value="${board}">
          	<input type="number" name="pnum" value="${dto.num}">
         	<p> 신 고 자 <input type="text" name="from_id" value="${member.id}" readonly="readonly"></p>
			<p>  대 상 <input type="text" name="to_id" value="${dto.m_id }" readonly="readonly"></p>
			<p>제 목 <input type="text" name="title">
			<p><textarea rows="10" cols="40" name="contents"></textarea></p>
			<p><button class="btn btn-default">작성</button> </p>			          
          </form>
         <button type="button" id="rClose" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        <div class="modal-footer">
        </div>
      </div>
      
    </div>
  </div>
	
<!-- MODAL 신고 기능 끝 -->	
	
	
	
		<%@ include file="../sub/footer.jspf"%>
</body>
</html>