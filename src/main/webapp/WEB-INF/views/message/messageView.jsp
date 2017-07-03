<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	var num=$("#num").val();

	$("#delete").click(function () {
		alert(num);
		$.ajax({
			url: "./messageDelete",	
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

	
	$("#cancle").click(function() {
		alert("cancle")
		opener.parent.location.reload();
		window.close();
	})
		
	

})

</script>
</head>
<body>
<input type="hidden" name="num" id="num" value="${msgDTO.num }">
<div class="container">


<h3>Message</h3>
<table class="table table-hover">
<tr>
<td> FROM</td>
<td> TO </td>
</tr>

<tr>
	<td><input type="text" class="form-control" name="from_id" id="from_id" value="${msgDTO.from_id }"></td>
	<td><input type="text" class="form-control" name="to_id" id="to_id" value="${msgDTO.to_id }"></td>
</tr>

<tr><td colspan="2">TITLE</td></tr>
<tr><td colspan="2"><input type="text" name="title" value="${msgDTO.title }" class="form-control"> </td></tr>

<tr>
<td colspan="2"><textarea style="height: 200px;" class="form-control"  rows="" cols="" name="contents">${msgDTO.contents }</textarea></td>
<!-- check 1로 바꾸고  from_id 및 to_id에게 쪽지로 발송 -->
</tr>

</table>
 <button type="button" class="btn btn-danger" id="delete">삭제</button>
 <button type="button" class="btn btn-Info" id="cancle" >취소</button>

</div>

</body>
</html>