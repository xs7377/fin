<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
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
	
	$("#rTable").on("click","#reportRead",function(){
		var num=$(this).attr("class");
		alert(num);
		window.open("../report/reportView?num="+num,"REPORT","width=500 , height=550");
		
	})
		
	$("#attend").click(function() {
		var m_id=$("#attend_id").val();
		alert(m_id);
		if(m_id==''){
		alert("로그인하세요!");
		location.href="../member/memberLogin"
		}else{
		location.href="../attend/attendCheck?m_id="+m_id;
		}
	});
	
	
});

function openCity(evt, cityName) {
	  var i, x, tablinks;
	  x = document.getElementsByClassName("city");
	  for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < x.length; i++) {
	      tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " w3-red";
	}

</script>
<style type="text/css">
#attend_stamp{
border: 3px solid black;
margin:auto;
width: 820px; 
height: 850px; 
z-index: 6666; 
position: relative;

}



</style>


</head>
<body>

<h2>신고자</h2>
<h2>판매 결산</h2>
 <div class="w3-bar w3-black">
    <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'seller')">판매자</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'report')">신고게시판</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">Tokyo</button>
  </div>
  
  <div id="seller" class="w3-container w3-border city">
    <h2>출석쳌</h2>
    
    <div style="border: 3px solid red; width: 1270px;" >
    
    <div id="attend_wrap" style="border: 3px soild #ffcccc; margin-top: 50px; ">
    
    <img alt="" src="../resources/img/attend/att.jpg" style="float: left; ">
    <div id="attend_stamp" >
    
    
    </div>
    
    
    </div>
    
  
 	<div id="btn_wrap" style="border: 3px solid green; clear: both;" > 
    <input type="hidden" id="attend_id" name="m_id" value="${member.id}">
    <button id="attend" style="width: 100px; height: 58px; ">출첵</button>
    </div>
    
    </div>
  </div>

  <div id="report" class="w3-container w3-border city" style="display:none">
    <h2>신고게시판</h2>
    
    <table class="table" id="rTable">
    <tr>
    <td>NO</td><td>FROM</td><td>TO</td><td>내용</td><td>READ</td>
    </tr>
    <c:forEach items="${list}" var="list">
    <tr>
    <td>${list.num}</td>
  	<td>${list.from_id}</td>
    <td>${list.to_id} </td>
    <td>${list.contents}</td>
    <c:if test="${list.check_num==0}">
    	<td><button id="reportRead" class="${list.num}">신고 대기</button></td>
    </c:if>
    <c:if test="${list.check_num==1}">
    	<td><button id="reportRead" class="${list.num}">신고 접수</button></td>
    </c:if>
    </tr>
    </c:forEach>
    </table>
 
 </div>
 
 
 
 
 

  <div id="Tokyo" class="w3-container w3-border city" style="display:none">
    <h2>쪽지함</h2>
    <button>쪽지</button>
    
    
  </div>



</body>
</html>