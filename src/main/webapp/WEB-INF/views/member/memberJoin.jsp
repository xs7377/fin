<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<style type="text/css">
.join_wrap{
	width: 1100px;
	height: 800px;
	margin: 100px auto;
}
.join{ 
	width: 443px;
	height: 65px;
	font-size: 3em;
	font-weight: bolder;
	color: #333333; 
	font-family:Georgia;
	margin: 0 auto;
}
.join_contents_wrap{
	width: 800px;
	height: 700px;
	margin: 0 auto;
	font-size: 0.8em;
}
.member_join_btn{
	width: 400px;
	height: 50px;
	display: block;
	background-color: #ff4d4d;
	font-weight: bold;
	margin: 10px auto;
	text-align: center;
	line-height: 100%;
	color: white;
	font-size: 0.95em;
	border: none;
	cursor: pointer;
}

</style>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">

$(function() {
var file_check = false;
var upload = document.getElementById('member_file'), 
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

  if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = 'File API & FileReader available';
}  
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    file_check = true;
    // note: no onload required since we've got the dataurl...I think! :)
  /*   if (img.width > 150) { // holder width */
      img.width = 160;
   /*  } */
   /*  if(img.height > 180) { */
    	img.height = 190;
/*     } */
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};

var phone = document.getElementById("member_phone");
var email = document.getElementById("member_email");
var addr = document.getElementById("sample6_address");
var name = document.getElementById("member_name");
var member_id_check = document.getElementById("member_id_check");
var member_id = document.getElementById("member_id");
var member_check = document.getElementById("member_check");
var pw1 = document.getElementById("member_pw");
var pw2 = document.getElementById("member_re_pw");
var name_check = false;
var phone_check = false;
var pw1_check = false;
var pw2_check = false;
var addr_check = false;
var email_check = false;

$("#member_check").click(function(){
		window.open("/fin/member/idCheck?id="+ member_id.value, "", "width=350px, height=80px");
}); 

$("#member_name").keyup(function(){
	if(!/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]$/.test(name.value)){
		document.getElementById("s3").innerHTML = "이름은 한글만 입력 가능합니다. 다시 입력해주세요.";
		document.getElementById("s3").style.color = 'red';
		name_check = false;
	} else {
		document.getElementById("s3").innerHTML = "";
		name_check = true;
	}
}); 

$("#member_phone").keyup(function(){
	if(!/^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/.test(phone.value)){
		document.getElementById("s4").innerHTML = "휴대폰 번호 형식이 틀립니다. 다시 입력해주세요.";
		document.getElementById("s4").style.color = 'red';
		phone_check = false;
	} else {
		document.getElementById("s4").innerHTML = "";
		phone_check = true;
	}
}); 


$("#member_email").keyup(function(){
	if(!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/.test(email.value)){
		document.getElementById("s5").innerHTML = "이메일주소 형식이 틀립니다. 다시 입력해주세요.";
		document.getElementById("s5").style.color = 'red';
		email_check = false;
	} else {
		document.getElementById("s5").innerHTML = ""; 
		email_check = true;
	}
});  

$("#member_pw").focus(function() {
	document.getElementById("s1").innerHTML = "6~15자 영문자, 숫자를 사용해주세요.";
});


$(("#member_pw")).keyup(function() {
	if (!/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/.test(pw1.value)) {
		document.getElementById("s1").innerHTML = "비밀번호 형식이 틀립니다. 다시 입력해주세요.";
		document.getElementById("s1").style.color = 'red';
		pw1_check = false;
	} else {
		document.getElementById("s1").innerHTML = "사용가능";
		document.getElementById("s1").style.color = '#404040';
		pw1_check = true;
	}
}); 

$(("#member_pw")).change(function() {
	if (pw1.value == pw2.value) {
		document.getElementById("s2").innerHTML = "비밀번호와 일치합니다.";
		document.getElementById("s2").style.color = '#404040';
		pw2_check = true;
	} else {
		document.getElementById("s2").innerHTML = "비밀번호와 일치하지 않습니다.";
		document.getElementById("s2").style.color = 'red';
		pw2_check = false;
	}
}); 


$("#member_re_pw").keyup(function() {
	if (pw1.value == pw2.value) {
		document.getElementById("s2").innerHTML = "비밀번호와 일치합니다.";
		document.getElementById("s2").style.color = '#404040';
		pw2_check = true;
	} else {
		document.getElementById("s2").innerHTML = "비밀번호와 일치하지 않습니다.";
		document.getElementById("s2").style.color = 'red';
		pw2_check = false;
	}
});

$("#join_btn").click(function() {
	if(name_check == true &&  file_check == true && phone_check == true && pw1_check == true &&
			pw2_check == true &&  email_check == true && member_id_check.value == '0' && addr.value != ""){
		alert("환영합니다!");
		document.frm.submit();
	} else{
		alert("필수 입력사항을 확인해주세요.");
	}
});

});
</script>
</head>
<body>
	<%@ include file="../sub/header.jspf"%>
	
	<section class="join_wrap">
	<div class="join">WELCOME TO JOIN</div><br><br>
	<div class="join_contents_wrap">
	<form action="memberJoin" name="frm" method="post" enctype="multipart/form-data">
	 
	 
	<div id="holder" style="display: inline-block; width: 160px; height: 190px; outline: 1px dotted black; margin-top: 10px;"></div>
	 <div style="display: inline-block; width: 635px; height: 190px; float: right;">
	 
	<p id="status" style="color: white;">File API & FileReader API not supported</p>
    <!-- 이름 -->   
     <div class="input-group" style="margin-left: 20px;">
      <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
      <input id="member_name" style="width: 575px;" type="text" class="form-control" name="name" placeholder="Name" >
    </div> <div id="s3" class="s" style="width: 260px; display: inline-block; margin-left: 20px;"></div> <br> <br>
     
	 <!-- 프로필 사진 첨부 -->
	  <div class="input-group" style="margin-left: 20px;">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="member_file"  style="width: 575px;"  type="file" class="form-control" name="file" placeholder="File">
    </div><br><br>

    <!-- 핸드폰번호 -->  
     <div class="input-group" style="margin-left: 20px;">
      <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
      <input id="member_phone" style="width: 575px;" type="text" class="form-control" name="phone" placeholder="Phone ex)01012345678" 
      onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
    </div><div id="s4" class="s" style="width: 260px; display: inline-block; margin-left: 20px;"></div><br> <br>
    </div>

	 <!-- 아이디 중복 확인 -->
	 <input type="hidden" name="check" id="member_id_check" disabled="disabled" value="1">
	 <div class="input-group" style="margin-top: 20px;">
      <span class="input-group-addon"><i class="glyphicon glyphicon-option-horizontal"></i></span>
      <input id="member_id" style="width: 672px;"  type="text" class="form-control" name="id" placeholder="Id" readonly="readonly">
      <input type="button" class="id_check btn" id="member_check" value="Id Check" style="margin-left: 5px;">
    </div><span id="s6" class="s">5~11자 시작은 영문만 가능하며 '_'를 제외한 특수문자는 불가능합니다.</span> <br> <br>
   
    <!-- 비밀번호 중복 확인 -->
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="member_pw" type="password" class="form-control" name="pw" placeholder="Password" >
    </div> <span id="s1" class="s"></span><br> <br>
    
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="member_re_pw" type="password" class="form-control" name="re_pw" placeholder="Reapeat Password">
    </div> <span id="s2" class="s"></span> <br> <br>
    
     
     <!-- 주소 -->
     <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-modal-window"></i></span> 
	   <input type="text" id="sample6_postcode" class="form-control" placeholder="Postal Code" style="width: 120px;" readonly="readonly">
      <input id="sample6_address" type="text" class="form-control" name="addr" placeholder="Address" style="width: 350px; margin-left: 5px;" readonly="readonly">
      <input id="sample6_address2" type="text" class="form-control" placeholder="Detailed Address" style="width: 194px; margin-left: 5px;">
		<input type="button" onclick="sample6_execDaumPostcode()" value="주소검색"  class="id_check btn" style="margin-left: 5px;"><br>
    </div> <br> <br> 
    
   
	<!-- 이메일 주소  -->    
	<div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input id="member_email" type="text" class="form-control" name="email" placeholder="Email ex)abc@gmail.com" >
    </div> <span id="s5" class="s"></span><br> <br> <br> 
 
 <input class="member_join_btn" id="join_btn" value="가입하기">
  </form> 
   
</div>  
	</section>
	<%@ include file="../sub/footer.jspf"%>
	
	 <script>
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script>
try {
var pageTracker = _gat._getTracker("UA-1656750-18");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>