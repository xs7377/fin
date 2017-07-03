<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {

	var num='${reportDTO.num }';
	
	var check_num='${reportDTO.check_num }';
	
	var from_id='${reportDTO.from_id }';
	
	var to_id='${reportDTO.to_id }';
	
	$("#delete").click(function () {
		alert(num);
		$.ajax({
			url: "./reportDelete",	
			type:"POST",
			data:{
			 num: num	
			},
			success: function(data) {
				alert(data);
				opener.parent.location.reload();
				self.close();
			}
		});
		
	});
	
	$("#report").click(function() {
		alert(num);
		alert(check_num);
		
		if(check_num=='0'){
		$.ajax({
			url: "./reportRead",	
			type:"POST",
			data:{
			 num: num,
			 from_id : from_id,
			 to_id : to_id
			},
			success: function(data) {
				alert(data);
				opener.parent.location.reload();
				self.close();
			}
		});
		}else{
			alert("이미 신고 완료");
			self.close();
		}
		
		
	});
	  
});
  
  
 </script>
 <style type="text/css">
 #button_check{
 	
 	padding-left: 140px;
 }
 
 
 
 </style>
 
 
 
</head>


<body>

<div class="container">

<h3>REPORT</h3>
<table class="table table-hover">
<tr>
<td> 게시판</td>
<td> 게시물 번호</td>
</tr>

<tr>
	<td><input type="text" class="form-control" name="kind" readonly="readonly" value="${reportDTO.kind }"></td>
	<td><input type="text" class="form-control" name="pnum" readonly="readonly" value="${reportDTO.pnum}"></td>
</tr>


<tr>
		<td>신 고 자</td>
		<td> 대 상</td>
</tr>
<tr>
	<td><input type="text" class="form-control" name="from_id" readonly="readonly" value="${reportDTO.from_id }"></td>
	<td><input type="text" class="form-control" name="to_id" readonly="readonly" value="${reportDTO.to_id}"></td>
</tr>
<tr>


<tr>
		<td colspan="2">
		<textarea style="height: 200px;" rows="" cols="" class="form-control" name="contents" readonly="readonly">
		${reportDTO.contents }
		</textarea>
		</td>
</tr>

</table>

<!-- check 1로 바꾸고  from_id 및 to_id에게 쪽지로 발송 -->
	<div id="button_check">
		 <button type="button" class="btn btn-success" id="report">신고접수</button>
		 <button type="button" class="btn btn-danger" id="delete">삭제</button>
		 <button type="button" class="btn btn-Info" onclick="window.close()">취소</button>
	</div>
</div>
</body>
</html>