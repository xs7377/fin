<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	/* ./friendAdd?f_id=dd */
	$("#add").click(function() {
		
	    var r = confirm("친구추가 하시겠습니까?");
	    if (r == true) {
	       location.href="./friendAdd?f_id=dd";
	    } else {
	    	location.href="../";
	    }
		
	})
	
	$("#del").click(function() {
		 var r = confirm("친구삭제 하시겠습니까?");
	    if (r == true) {
	       location.href="./friendDel?f_id=dd";
	    } else {
	    	location.href="../";
	    }
	})
	
	$("#report").click(function() {
		
	
	});
	
});
function myFunction() {
    var x = document.getElementById("Demo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

</script>
</head>
<body>
<!-- 친구추가 -->
<h2>친구 추가</h2>

<div class="w3-container">
  <h2>Clickable Dropdown</h2>
  <p>Click on the button to open the dropdown menu.</p>
  <div class="w3-dropdown-click">
    <button onclick="myFunction()" class="w3-button w3-black">Click Me!</button>
    <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border">
      <a href="#" id="add" class="w3-bar-item w3-button">친구추가</a>
      <a href="#" id="del" class="w3-bar-item w3-button">친구삭제</a>
      <a href="#" id="message" class="w3-bar-item w3-button" data-toggle="modal" data-target="#myMemo">쪽지</a>
      <a href="#" id="report" class="w3-bar-item w3-button" data-toggle="modal" data-target="#myModal">신 고</a>
    </div>
  </div>
</div>

<!-- MODAL Report 처리  -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
   	<!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">신 고</h4>
        </div>
        <div class="modal-body">
          <form action="../report/reportReg" method="post">
          	<p><input type="hidden" name="kind" value="1" readonly="readonly"></p>
          	<p>게시글:<input type="number" name="pnum" value="2" readonly="readonly"></p>
          	<p>신고자:<input type="text" name="from_id" value="sonaaa" readonly="readonly"></p>
			<p>대상:<input type="text" name="to_id" value="dd" readonly="readonly"></p>
			<textarea rows="10" cols="40" name="contents"></textarea>
			<p><button class="btn btn-default">작성</button> </p>			          
          </form>
         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        <div class="modal-footer">
        </div>
      </div>
      
    </div>
  </div>

<!--쪽지  -->
<div class="modal fade" id="myMemo" role="dialog">
    <div class="modal-dialog">
   	<!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">쪽 지</h4>
        </div>
        <div class="modal-body">
          <form action="" method="post">
          	<p>쪽지 </p>
          	
          	
          	
          	
          </form>
         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        <div class="modal-footer">
        </div>
      </div>
      
    </div>
  </div>




</body>
</html>