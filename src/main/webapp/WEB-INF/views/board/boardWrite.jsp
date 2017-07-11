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
	    	
	    	document.frm.submit();
	    	
	    	
	    });
	    
	    
	    
	   /*여기는 wish를 할 때만 되게   */
		  $("#cate1").on("change",function(){
	    	var pnum=$(this).val();
	    	//들어온 값이 category pnum으로 들어간다.
	    	alert(pnum);
	    	//Mapper를 처리해야 한다. you should make the MAPPER
	    	$.ajax({
	    		url:"./selectOption",
				type:"POST",
				cache : false,
				data:{
					pnum : pnum
				},
				success:function(data){
					//List형식으로 들어와서 option이 몇개가 만들어지는지 모르니까 여기서 처리.
					for(var i=0;i<data.length;i++){
					var result='';
					result=getResult(result, data[i].num, data[i].name,data[i].pnum);
					$("#cate2Add").after(result);
					}
				}
			});
	    });
	    /*2카테  */
	    $("#cate2").on("change",function(){
	    	var pnum=$(this).val();
	    	//들어온 값이 category pnum으로 들어간다.
	    	alert(pnum);
	    	//Mapper를 처리해야 한다. you should make the MAPPER
	    	$.ajax({
	    		url:"./selectOption",
				type:"POST",
				cache : false,
				data:{
					pnum : pnum
				},
				success:function(data){
					//List형식으로 들어와서 option이 몇개가 만들어지는지 모르니까 여기서 처리.
					for(var i=0;i<data.length;i++){
					var result='';
					result=getResult(result, data[i].num, data[i].name,data[i].pnum);
					$("#cate3Add").after(result);
					}
				}
			});
	    });
	    
	    
});
	function getResult(result, num, name, pnum) {
		result=result+"<option value='"+num+"'>";	
		result=result+name;
		result=result+"</option>";
		return result;
	}
</script>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>
	<div class="box">
		<h2>${board}${state}</h2>
	
<form action="${board}${state}" method="post" name="frm">
			<table class="table table-hover">
				<tr>
					<td>제목</td><td>작성자</td>
				</tr>
				
				<tr>
					<td><input type="text" class="form-control" name="title" value="${dto.title}"></td>
				<c:choose>
					 <c:when test="${state eq 'Write'}">
					 <td><input type="text" class="form-control" name="m_id" readonly="readonly" value="${member.id}"></td>
					 </c:when>
					 <c:when test="${state eq 'Update'}">
					<td><input type="text" class="form-control" name="m_id" readonly="readonly" value="${dto.m_id}"></td>
					 </c:when>
					</c:choose>
				</tr>
				<!-- 카테고리 -->
			
	<c:if test="${board eq 'wish' }">		
		<tr >
			<td colspan="2">
				<select id="cate1" name="cate1">
					<option value="1" selected="selected">패션 </option>
					<option value="2">잡화</option>
					<option value="3">스포츠/레저/자동차</option>
					<option value="4">유아</option>
					<option value="5">가구/생활/건강</option>
					<option value="6">디지털/가전/컴퓨터</option>
					<option value="7">도서</option>
				</select>
				<select id="cate2" name="cate2">
					<option id="cate2Add" value="0" selected="selected">선택하세요 </option>
					
				</select>
				<select id="cate3" name="cate3">
					<option id="cate3Add" value="0" selected="selected">선택하세요 </option>
				
				</select>
			</td>
	</tr>
	</c:if> 
				<!-- 카테고리 끝-->
				<!-- 리뷰하면 별점  -->
	<c:if test="${board eq 'review'}">			
	<tr>
					<td>
				<fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    
    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    </fieldset>	
				
				
					</td>
	</tr>
	</c:if>
				<!-- 끝  -->
				
				<!--내용  -->
				
				<tr>
					<td colspan="2">내용</td>
				</tr>
				
				<tr>
					<td colspan="2"><textarea style="height: 300px;"rows="" cols="" class="form-control" id="contents" name="contents">${dto.contents}</textarea></td>
				</tr>
			</table>
			
		<c:if test="${state eq 'Update'}">	
		<input type="hidden" name="num" value="${dto.num}">
		</c:if>
		
		<input type="button" id="savebutton" class="btn btn-success" value="작성 완료">
		
		<a class="btn btn-info" href="${board}List?curPage=1">목록으로</a>
	
		
</form>
		





		
		
	</div>
		<%@ include file="../sub/footer.jspf"%>
</body>
</html>