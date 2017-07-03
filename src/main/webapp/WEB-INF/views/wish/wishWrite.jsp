<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
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
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	$(function(){
		 //전역변수선언
	    var editor_object = [];

	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        //teatarea ID
	        elPlaceHolder: "contents",
	        sSkinURI: "../resources/SE2/SmartEditor2Skin.html", 
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true, 
	        }
	    });
	    
	    $("#savebutton").click(function(){
	    	editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	    	$("#frm").submit();
	    });

	});
</script>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>
	<div class="box">
		<h2>${board}</h2>
		<form action="${board}${state}" method="post" id="frm">
			<table class="table table-hover">
			
				<tr>
					<td>제목</td><td>작성자</td>
				</tr>
				
				<tr>
					<td><input type="text" class="form-control" name="title" value="${dto.title}"></td>
					<c:if test="${state eq 'Write'}">
					<td><input type="text" class="form-control" name="m_id" readonly="readonly" value="${member.id}"></td>
					</c:if>
					<c:if test="${state eq 'Update'}">
					<td><input type="text" class="form-control" name="m_id" readonly="readonly" value="${dto.m_id}"></td>
					</c:if>
				</tr>
				
				<tr>
					<td colspan="2">내용</td>
				</tr>
				
				<tr>
					<td colspan="2"><textarea style="height: 300px;"rows="" cols="" class="form-control" id="contents" name="contents">${dto.contents}</textarea></td>
				</tr>
			</table>
		<input type="hidden" name="num" value="${dto.num }">
		<input type="button" id="savebutton" class="btn btn-success" value="작성 완료">
		<a class="btn btn-info" href="${board}List?curPage=1">목록으로</a>
		</form>
	</div>
		<%@ include file="../sub/footer.jspf"%>
</body>
</html>