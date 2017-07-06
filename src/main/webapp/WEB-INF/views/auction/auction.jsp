<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/datepicker/css/pikaday.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/datepicker/pikaday.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	var fi;
	var preCount=0;
	var ssCount=0;
	var min_check=false;
	var max_check=false;
	var kind='${kind}';
	$(function(){
		// ===================================== 등록 취소 ==================================
		$("#aucCBtn").on("click",function(){
			document.jumpFrm.submit();
		});
			aucCBtn
		// ===================================== 썸네일 업로드 ==================================
		$("#imgInp").on("change",function(){
			fi = document.getElementById('imgInp').files;
			readURL(fi);
			var files = new FormData($("#fileForm")[0]);
			$.ajax({
				type : 'post',
				url : './thumUpload',
				data : files,
				processData : false,	
				contentType : false,
				success : function(data) {
					alert("썸네일파일 올림");
					preCount=data;
				}
			});
		});
		// ===================================== SE2 ==================================
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
	    
    	 // ===================================== 경매등록 시 유효성 검사 ==================================
    	
    	var isMin=$("#minP").val();
    	var isMax=$("#maxP").val();
    	if(kind=='ModProcess' && isMin!=null && isMin!='' ){
    		min_check=true;
    	}
		if(kind=='ModProcess' && isMax!=null && isMax!=''){
		    	max_check=true;
		}
    	
	    $("#aucWBtn").click(function(){
	    	editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		var ctg1=$("#ctg1").val();
				var ctg2=$("#ctg2").val();
				var ctg3=$("#ctg3").val();
	    	 	if(ctg3==null || ctg3=='' || ctg2==null || ctg2=='' || ctg1==null || ctg1==''){
	    	 		ctg3=false
				}else{
					ctg3=true;
				}
				var find=$("#wFrm").find("input");
			 	var fValue=true;
			 		$.makeArray($(find).map(function(){
			 		if($(this).val()=='' || $(this).val()==null){
			 			fValue=false;
			 		}
			 	}));
				if(fValue&&ctg3&&min_check&&max_check&&max_check){
					alert("등록진행");
					$("#wFrm").submit();
				}else{
					alert("내용을 전부 입력해주세요");
				}
	    });
	    // ===================================== min_price, max_price, per_price 유효성 검사 ==================================
	    	$("#minP").on("blur",function(){
	    		var min=$("#minP").val()*1;
	    		if(min>=1000){
	    			if(min%100==0){
	    				min_check=true;
	    			}else{
	    				alert("10원, 1원단위로 등록할 수 없습니다");
	    				$("#minP").val('');
	    			}
	    		}else{
	    			alert("최소 가격 설정은 1000원 이상입니다");
	    			$("#minP").val('');
	    		}
	    		
	    	});
			$("#maxP").on("focus",function(){
				var min=$("#minP").val()*1;
				if(min==''){
					$(this).trigger("blur");
					alert("최소가격을 먼저 설정 해주세요")
				}
			});
	    	$("#maxP").on("blur",function(){
	    		var min=$("#minP").val()*1;
	      		var max=$("#maxP").val()*1;
	      		if(min<=max){
	      			if(max%100==0){
	      				max_check=true;
	      			}else{
	      				alert("10원, 1원단위로 등록할 수 없습니다");
	    				$("#maxP").val('');
	      			}
	      		}else{
	      			if(max==''){
	      				alert("공백 불가");
	      				$("#maxP").val('');
	      			}else{
		      			alert("최소가격이 즉시낙찰가보다 높을 수 없습니다");
		      			$("#maxP").val('');
	      			}
	      		}
	    	});
	    
	    // ===================================== DatePicker ==================================
		$("#datePicker").load(
			"../resources/datepicker/datepicker.jsp"	
		);
		// ===================================== TimePicker ==================================
		// ===================================== 카테고리 ==================================
			
			var cate_array=new Array();
			var category='${auc.category}';
			category=category.split(",");
			var modCount=0;
			
			$.ajax({
				url : "./category",
				type : "post",
				data : {
					pNum : 0
				},
				success : function(data) {
					var i = 0;
					$(data).each(function(){
						$("#ctg1").append(
							'<option value="'+data[i].name+'" id="ctg_'+data[i].num+'">'+data[i].name+'</option>'
						);
						i++;
					});
					if(kind=='ModProcess' && modCount==0){
						$("#ctg1").val(category[0]).trigger("change");
						modCount++;
					}
				}
			});
			
			 
			$("body").on("change","#ctg1",function(){
				var ctg1=$("#ctg1").val();
				$("#ctg3").attr("hidden",true);
				$("#ctg2").attr("hidden",false);
				if(ctg1==null || ctg1==''){
					$("#ctg2").attr("hidden",true);
				}
				var val=$(this).val();
				var num = $("option[value='"+val+"']").attr("id");
				var result='<option value="">2차 카테고리</option>';
				num=num.substring(num.lastIndexOf("_")+1);
				$.ajax({
					url:"./category",
					type:"post",
					data:{
						pNum:num
					},
					success:function(data){
						var i=0;
						$(data).each(function(){
							result+='<option value="'+data[i].name+'" id="ctg_'+data[i].num+'">'+data[i].name+'</option>';	
							i++;
						});
						$("#ctg2").html(result);
						if(kind=='ModProcess'&&modCount==1){
							$("#ctg2").val(category[1]).trigger("change");
							modCount++;
						}
					}
				});
			});
			$("body").on("change","#ctg2",function(){
				var ctg2=$("#ctg2").val();
				$("#ctg3").attr("hidden",false);
				if(ctg2==null || ctg2==''){
					$("#ctg3").attr("hidden",true);
				}
				var val=$(this).val();
				var num = $("option[value='"+val+"']").attr("id");
				var result='<option value="">3차 카테고리</option>';
				num=num.substring(num.lastIndexOf("_")+1);
				$.ajax({
					url:"./category",
					type:"post",
					data:{
						pNum:num
					},
					success:function(data){
						var i=0;
						$(data).each(function(){
							result+='<option value="'+data[i].name+'" id="ctg_'+data[i].num+'">'+data[i].name+'</option>';	
							i++;
						});
						$("#ctg3").html(result);
						if(kind=='ModProcess'&&modCount==2){
							$("#ctg3").val(category[2]).trigger("change");
							modCount++;
						}
					}
				});
			});
			
			
			
		// ===================================== Mod form ==================================
			var isBuy='${auc.buyer}';
			if(isBuy!=''){
				alert("입찰 진행중인 상품은 수정이 불가능합니다");
				document.jumpFrm.submit();
			}
			
			if(kind=='ModProcess'){
	    		var aNum='${auc.num}';
	    		$("#hd").html(
	    			'<input type="hidden" name="num" value="'+aNum+'">'	
	    		);
	    		
			
			
			var reply='${auc.reply}';
			$('.isReply[value="'+reply+'"]').trigger("click");
			var primeum='${auc.primeum}';
			$('.isPri[value="'+primeum+'"]').trigger("click");
		 	$(".isPri").attr("hidden",true);
			if(primeum=='y'){
				$("#isPriN").attr("hidden",true);
			}else if (primeum=='n'){
				$("#isPriY").attr("hidden",true);
			}
		 	
			var period='${auc.period}';
			var period_array=new Array();
			period_array=period.split(",");
			if(kind=='ModProcess'){
				$("#temp").html(
					'<input type="hidden" value="'+period_array[0]+'" id="val_datePicker">'			
				);
			}
			
			$('#period_time>option[value="'+period_array[1]+'"]').attr("selected",true);
			
			
			
			$("body").on("click",".orgImg",function(){
				var orgImg=$(this).closest('table');
				var orgFName=$(this).attr("id");
				$(orgImg).remove();
				
				$.ajax({
					url:"./modOrgImgDel",
					type:"post",
					data:{
						orgFName:orgFName
					},
					success:function(){
						
					}
					
				});
			});
			}
			
		//=======================================================================================
	});
	
	
	function readURL(fi){
		var files= fi;
		var str='';
		if(ssCount==0){
			preCount=0;
		}
		for(var i=0;i<files.length;i++){
			var j=0;
			var reader=new FileReader();
			reader.onload= function(e){
				 $('#status1').append(
						 	'<table class="auctb" style="float:left;" id="file_result_'+preCount+'">'+
			                '<tr><td style="padding: 0; padding-right: 7px;border:none;"><img id="file_img_'+preCount+'" src="'+e.target.result+'" width="100px" height="100px" style="border:1px solid #bcbcbc"></td></tr>'+
			                '<tr><td style="text-align: center;padding: 0; padding-right: 7px;border:none;"><input type="button" value="삭제" style="width:50px;" onclick="delete_file('+preCount+')"></td></tr>'+
			                '</table>'); 
				 j++;
				 preCount++;
			}
			reader.readAsDataURL(files[i]);
		}
		ssCount++;
	};
	function delete_file(idx){
	        $('#file_result_'+idx).remove();
	        $.ajax({
	        	type:"post",
	        	url:"./thumDel",
	        	data:{
	        		idx:idx
	        	},
	        	success:function(data){
	        		
	        	}
	        })
	}
</script>
<style type="text/css">
@font-face {
	font-family: 'NanumGothic'; 
	src: url(../resources/font/NanumGothic.ttf) format('truetype'); }
*{
	box-sizing: border-box;
	word-wrap:break-word;
	word-break:break-all;
	border-collapse: collapse;
	font-family: NanumGothic;
}
.auctb{
	border-collapse: collapse;
}
.auctb td{
	padding: 7px 15px;
	border-bottom: 1px solid #d6d6d6;
	border-top: 1px solid #d6d6d6;
}
.a-td-bc{
	background-color: #dfeefd;
	padding-left: 30px;
	color: #2d2d2d;
}
.a-td-top{
	border-top: 2px solid #808080;
}
.a-td-bot{
	border-bottom: 2px solid #808080;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.a-container{
	width: 1500px;
	margin: 20px auto;
	padding: 20px;
	border: 1px solid #216ed7;
	background-color: white;
}
.a-sideNav-title{
	float:left;
	width: 280px;
	height:450px;
	height:50px;
	margin-bottom:5px;
	padding-top:5px;
	text-align: center;
	color: #2d2d2d;
	font-weight: bold;
	font-size: 14px;
	margin-left: 20px;
}
.a-sideNav{
	float:left;
	width: 280px;
	padding: 10px 20px;
	border: 1px solid #bcbcbc;
	margin-top: 0px;
	margin-left: 20px;
}
.a-subcon-title{
	padding-top:5px;
	float: right;
	width:1114px;
	height:50px;
	margin-bottom:5px;
}
.a-subcon{
	float: right;
	width:1114px;
}
.a-footer{
	clear: both;
}
.a-tb-title{
	padding-top: 7px;
	float: right;
	width:1114px;
	height:40px;
	font-weight: bold;
	font-size: 15px;
}
.a-td1{
	height:40px;
	width: 15%;
	font-weight: bold;
	font-size: 14px;
}
.a-td1-con{
	height:40px;
	width: 85%;
}
.a-td2{
	height: 300px;
	width: 15%;
	font-weight: bold;
	font-size: 14px;
}
.a-td2-con{
	height:300px;
	width: 85%;
}
.a-td3{
	height: 130px;
	width: 15%;
	font-weight: bold;
	font-size: 14px;
}
.a-td3-con{
	width: 85%;
	font-weight: bold;
}
.a-td4{
	height: 40px;
	width: 15%;
	font-weight: bold;
	font-size: 14px;
}
.a-td4-con{
	height:40px;
	width: 35%;
}
.a-btn{
	width: 1114px;
	height: 60px;
	margin-bottom:10px;
	vertical-align: middle;
	text-align:center;
	border:none;
}
.ctg{
	height: 25px;
}

.a-subcon-title-shadow{
	height:40px;
	width:200px;
	border-bottom: 2px solid #407FD4;
	text-shadow: 0px 1px #ffffff, 4px 4px 0px #dad7d7;
}
.a-ex1{
	font-family: monospace;
	font-size: 12px;
	color: #3c3c3c;
	padding-right: 5px;
	list-style: none;
	font-weight: bold;
	line-height: 25px;
}
.a-ex2{
	font-size: 11px;
	color: #3c3c3c;
	padding-right: 5px;
	line-height: 16px;
	margin-top: 10px;
}
.a-text{
  background: url(../img/keyIcon.png) 12px 11px no-repeat, linear-gradient(to bottom, #f7f7f8 0%,#ffffff 100%);
  border-radius: 3px;
  border: none;
  box-shadow: 0 1px 2px rgba(0,0,0,0.2) inset, 0 -1px 0 rgba(0,0,0,0.05) inset;
  transition: all 0.2s linear;
  font-family: "Helvetica Neue", sans-serif;
  font-size: 13px;
  color: #222222;
  position: relative;
  height: 30px;
  width: 150px;
  padding-left: 15px;
}
.a-wBtn{
   width: 150px;
   height: 40px;
   background: #3498db;
   border: none;
   color: #fff;
   font-size: 14px;
   font-weight: bold;
  cursor:pointer;
  
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
	 background: rgb(33, 110, 215);
   color: #fff;
   -webkit-transition: background .5s ease, color .3s;
   -moz-transition: background .5s ease, color .3s;
   -ms-transition: background .5s ease, color .3s;
   transition: background .5s ease, color .3s;
}

.a-cBtn{
	width: 150px;
   height: 40px;
   background: #3498db;
   border: none;
   color: #fff;
   font-size: 14px;
   font-weight: bold;
   cursor:pointer;
  
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
	 background: rgba(0, 0, 0, 0.3);
   color: #fff;
   -webkit-transition: background .5s ease, color .3s;
   -moz-transition: background .5s ease, color .3s;
   -ms-transition: background .5s ease, color .3s;
   transition: background .5s ease, color .3s;
}
.isPri, .isReply{
	margin-left: 10px;
	margin-right: 10px;
}
</style>
<title>Insert title here</title>
</head>
<body style="background-image: url('${pageContext.servletContext.contextPath}/resources/auction-img/dot.jpg');">
<%@ include file="../sub/header.jspf"%>
<div class="a-container">
	<div class="a-sideNav-title"> 
			<div style="width: 200px; height: 35px;box-shadow: 5px 5px 5px lightgray;margin:0 auto;background-color: #ffe7c3;border-radius: 6px;">
				<img alt="" src="../resources/auction-img/w.png" width="22px" height="22px" style="margin-top: 7px;float: left;margin-left: 7px;"><span style="margin-left: 35px; display: inline-block;float:left; margin-top: -18px;font-weight: bold;">물품판매 등록 전 알아두기</span>
			</div>
	</div>
	<div class="a-subcon-title">
		<div class="a-subcon-title-shadow">
		<span style="font-size: 30px; color: #0080ff;font-weight: bold;">물품판매</span><span style="font-size: 30px;display: inline-block;text-indent: 12px;font-weight: bold;">등록</span>
		</div>
	</div>
	<div class="a-sideNav" style="background-color: rgba(240, 240, 240, 0.4);box-shadow: 5px 5px 5px lightgray;text-align: center;">
		<img alt="" src="../resources/auction-img/circle.gif">
		<div style="width:240px;margin: 0 auto;padding: 5px 10px;text-align: justify;">
			<ul style="padding-left: 10px;margin: 0px;">
				<li class="a-ex1">판매물품 등록 시 알아둘 점</li>
				<li class="a-ex2">입찰가는 1000원 이상부터 등록이 가능하며 1원, 10원 단위로 등록 할 수 없습니다.</li>
				<li class="a-ex2">낙찰가는 입찰가 보다 낮을 수 없습니다.</li>
				<li class="a-ex2">프리미엄서비스는 글 수정시 변경 할 수 없습니다.</li>
				<li class="a-ex2">경매기간은 최대 7일이며 기간 내에 즉시낙찰이 이루어 질 경우 경매는 종료됩니다.</li>
				<li class="a-ex2">개인정보는 회원님의 정보와 상태를 확인을 위한 것이며 다른 사람에겐 보여지지 않습니다.</li>
			</ul>
		</div>
	</div>
	<div class="a-subcon">
		<div class="a-tb-title"><i><img alt="" src="../resources/auction-img/i.png" width="22px" height="22px" style=""></i><span style="position: absolute;padding-top: 3px;text-indent: 7px;">물품정보</span></div>
		<form action="./auction${kind}" id="wFrm" method="post">
			<div id="hd"></div>
			<table class="auctb" style="width: 1114px;">
				<tr>
					<td class="a-td1 a-td-bc a-td-top">카테고리</td><td class="a-td1-con a-td-top" colspan="3">
						<div id="ctry">
							<select name="category" id="ctg1" class="ctg"><option value="">1차 카테고리</option></select>
							<select name="category" id="ctg2" class="ctg" hidden="true"></select>
							<select name="category" id="ctg3" class="ctg" hidden="true"></select>
						</div>
					</td>
				</tr>
				<tr>
					<td class="a-td4 a-td-bc">댓글허용</td><td class="a-td4-con" style="text-align: center;">
						예<input type="radio" name="reply" value="y" class="isReply">
						아니오<input type="radio" name="reply" value="n" class="isReply">
					</td>
					<td class="a-td4 a-td-bc">프리미엄 서비스</td><td class="a-td4-con" style="text-align: center;" id="a-pri">
						<span id="isPriY">예</span><input type="radio" name="primeum" value="y" class="isPri">
						<span id="isPriN">아니오</span><input type="radio" name="primeum" value="n" class="isPri">
					</td>
				</tr>
				<tr>
					<td class="a-td1 a-td-bc">입찰가</td><td class="a-td1-con" colspan="3">
						<input type="number" name="min_price" placeholder="min_price" id="minP" value="${auc.min_price }" class="a-text">
					</td>
				</tr>
				<tr>
					<td class="a-td1 a-td-bc">낙찰가</td><td class="a-td1-con" colspan="3">
						<input type="number" name="max_price" placeholder="max_price" id="maxP" value="${auc.max_price }" class="a-text">
					</td>
				</tr>
				<tr>
					<td class="a-td4 a-td-bc">경매기간(월/일)</td><td class="a-td4-con">
						<div id="datePicker"></div>
						<div id="temp"></div>
					</td>
					<td class="a-td4 a-td-bc">경매기간(시/24H)</td><td class="a-td4-con">
						<select id="period_time" name="period" class="ctg" style="width: 100px;padding-left: 25px;">
							<c:forEach begin="0" end="9" step="1" var="i">
								<option value="0${i}:00">0${i}:00</option>
							</c:forEach>
							<c:forEach begin="10" end="24" step="1" var="i">
								<option value="${i}:00">${i}:00</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="a-td1 a-td-bc">아이디</td><td class="a-td1-con" colspan="3">
						<input type="text" name="m_id" value="${auc.m_id }" class="a-text">
					</td>
				</tr>
				<tr>
					<td class="a-td1 a-td-bc">제목</td><td class="a-td1-con" colspan="3">
						<input type="text" name="title" placeholder="title" value="${auc.title}" class="a-text" style="width: 600px;">
					</td>
				</tr>
				<tr>
					<td class="a-td2 a-td-bc">내용</td>
					<td class="a-td2-con" colspan="3">
							<textarea rows="" cols="" id="contents" style="height: 300px;width: 100%;" name="contents">${auc.contents}</textarea>
					</td>
				</tr>
			</table>
		</form>
		
		
		
		
		<table class="auctb" style="width: 1114px;margin-bottom: 10px;">
				<tr>
					<td class="a-td1 a-td-bc" style="border-top: none;">섬네일</td><td class="a-td1-con" colspan="3" style="border-top: none;">
						<form action="" enctype="multipart/form-data" method="post" id="fileForm">
							<input type="file" multiple="multiple" name="files" id="imgInp">
						</form>
					</td>
				</tr>
				<tr>
					<td class="a-td3 a-td-bc a-td-bot">섬네일 미리보기</td><td class="a-td3-con a-td-bot" colspan="3">
						<div id="status1">
							<c:forEach items="${img}" var="i">
								<table class="auctb" style="float: left;"><tr><td style="padding: 0; padding-right: 7px;border: none;"><img alt="" src="../resources/upload/${i.fName}" width="100px;" height="100px;" style="border: 1px solid #bcbcbc;"></td></tr>
								<tr><td style="text-align: center; height: 15px;padding: 0;padding-right: 7px;border: none;"><input style="width:50px;" type="button" id="${i.fName}" class="orgImg" value="삭제"></td></tr></table>
							</c:forEach>
						</div>
					</td>
				</tr>
		</table>
		<div class="a-tb-title"><i><img alt="" src="../resources/auction-img/p.jpg" width="22px" height="22px" style=""></i><span style="position: absolute;padding-top: 3px;text-indent: 7px;">개인정보</span></div>
		<table class="auctb" style="width: 1114px;margin-bottom: 10px;">
			<tr>
				<td class="a-td4 a-td-bc a-td-top">이름</td><td class="a-td4-con a-td-top"></td><td class="a-td4 a-td-bc a-td-top">연락처</td><td class="a-td4-con a-td-top"></td>
			</tr>
			<tr>
				<td class="a-td4 a-td-bc a-td-bot">회원등급</td><td class="a-td4-con a-td-bot"></td><td class="a-td4 a-td-bc a-td-bot">인증 상태</td><td class="a-td4-con a-td-bot"></td>
			</tr>
		</table>
		
		
		<table class="auctb" style="width: 1114px;margin-bottom: 10px;">
			<tr>
				<td class="a-btn">
					<input type="button" id="aucWBtn" value="등록하기" style="margin-right: 30px;" class="a-wBtn">
					<input type="button" id="aucCBtn" value="등록취소" class="a-cBtn">
				</td>
			</tr>
		</table>
	</div>
	<div class="a-footer">
	</div>
</div>

<div id="jump" hidden="">
	<form action="./home" method="post" name="jumpFrm">
	</form>
</div>

<%@ include file="../sub/footer.jspf"%>
</body>

</html>