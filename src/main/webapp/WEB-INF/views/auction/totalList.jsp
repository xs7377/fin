<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var startNum=1;
var lastNum=8;
var page=0;
var curPage=1;
var txt='';
var search='';
$(function(){
	// ====================================hover 처리
	
	$(".go-ctg").hover(function(){
		$(this).children('span').addClass('hover');
	},function(){
		$(this).children('span').removeClass('hover');
	});
	$(".go-ctg").on("click",function(){
		var ga=$.makeArray($('.go-ctg').map(function(){
			return $(this).attr('class');
		}));
		for(var i=0;i<ga.length;i++){
			$('.'+ga[i]).removeClass('click');
		}
		$(this).addClass('click');
	});
	// ====================================토탈페이지 더보기
	$("#moreBtn").on("click",function(){
		var ic='${totalCount}';
		if(ic%8==0){
			page=parseInt(ic/8);
		}else{
			page=parseInt(ic/8+1);			
		}
		search=$("#search_result").text();
		search=search.substring(2,search.lastIndexOf("'")-1);
		startNum=curPage*8+1;
		lastNum=(curPage+1)*8;
		curPage++;
		if(curPage>=page){
			$("#moreBtn").remove();
		}
		$.ajax({
			url:"./listChoice",
			type:'post',
			data:{
				search:search,
				category:"",
				startNum:startNum,
				lastNum:lastNum
			},
			success:function(data){
				var i=0;
				var ht='';
				$(data).each(function(){
					ht+=album(this,i);
					i++;
				});
				$('.t-auc-con').append(
					ht		
				);
				var tl_aucNum_array=$.makeArray($(".tl_aucNum").map(function(){
					return $(this).attr("id");
				}));
				for(var i=0;i<tl_aucNum_array.length;i++){
					var str=tl_aucNum_array[i];
					str=str.substring(str.lastIndexOf("_")+1);
					var img='tl_img_'+str;
					$.ajax({
						url:"./selectThum",
						type:"post",
						async: false,
						data:{
							num:str
						},
						success:function(data){
							$("#"+img).html(
								data		
							);
						}
					});
				}
			}
		});
	});
	// ====================================초이스페이지 더보기
	$("body").on("click","#more_auc",function(){
		startNum=curPage*8+1;
		lastNum=(curPage+1)*8;
		curPage++;
		if(curPage>=page){
			$("#more_auc").remove();
		}
		$.ajax({
			url:"./listChoice",
			type:'post',
			data:{
				search:search,
				category:txt,
				startNum:startNum,
				lastNum:lastNum
			},
			success:function(data){
				var i=0;
				var ht='';
				$(data).each(function(){
					ht+=album(this,i);
					i++;
				});
				$('.t-auc-con').append(
					ht		
				);
				var tl_aucNum_array=$.makeArray($(".tl_aucNum").map(function(){
					return $(this).attr("id");
				}));
				for(var i=0;i<tl_aucNum_array.length;i++){
					var str=tl_aucNum_array[i];
					str=str.substring(str.lastIndexOf("_")+1);
					var img='tl_img_'+str;
					$.ajax({
						url:"./selectThum",
						type:"post",
						async: false,
						data:{
							num:str
						},
						success:function(data){
							$("#"+img).html(
								data		
							);
						}
					});
				}
			}
		});
	});
	// ==================================== 갯수 검색
	$(".go-ctg").on("click",function(){
		$("#moreBtn").remove();
		$("#more_auc").remove();
		startNum=1;
		lastNum=8;
		page=0;
		curPage=1;
		var ic=$(this).attr("id");
		ic=ic.substring(ic.lastIndexOf("_")+1);
		if(ic%8==0){
			page=parseInt(ic/8);
		}else{
			page=parseInt(ic/8+1);			
		}
		if(page>1 && ic>8){
			$("#t_paging").html(
				'<span id="more_auc" class="more-btn">더보기</span>'		
			);
		}
		
		
		txt=$(this).children('.ctg_name').text();
		search='${search}';
		$.ajax({
			url:'./listChoice',
			type:'post',
			data:{
				search:search,
				category:txt,
				startNum:startNum,
				lastNum:lastNum
			},
			success:function(data){
				var i=0;
				var ht='';
				$(data).each(function(){
					ht+=album(this,i);
					i++;
				});
				$('.t-auc-con').html(
					ht		
				);
				var tl_aucNum_array=$.makeArray($(".tl_aucNum").map(function(){
					return $(this).attr("id");
				}));
				for(var i=0;i<tl_aucNum_array.length;i++){
					var str=tl_aucNum_array[i];
					str=str.substring(str.lastIndexOf("_")+1);
					var img='tl_img_'+str;
					$.ajax({
						url:"./selectThum",
						type:"post",
						async: false,
						data:{
							num:str
						},
						success:function(data){
							$("#"+img).html(
								data		
							);
						}
					});
				}
			}
		});
		
		
		
	});
	// ==================================== 첫토탈페이지 이미지처리
	var tl_aucNum_array=$.makeArray($(".tl_aucNum").map(function(){
		return $(this).attr("id");
	}));
	for(var i=0;i<tl_aucNum_array.length;i++){
		var str=tl_aucNum_array[i];
		str=str.substring(str.lastIndexOf("_")+1);
		var img='tl_img_'+str;
		$.ajax({
			url:"./selectThum",
			type:"post",
			async: false,
			data:{
				num:str
			},
			success:function(data){
				$("#"+img).html(
					data		
				);
			}
		});
	}
	
});
function album(data){
	if(data.buyer==null || data.buyer==''){
		data.buyer='';
	}
	var result='';
	result+='<div class="items clk">';
	result+='<input type="hidden" class="tl_aucNum" id="tl_aucNum_'+data.num+'" value="'+data.num+'">'
	result+='<div class="tl-img" id="tl_img_'+data.num+'">이미지</div>'
	result+='<div class="tl-title">'+data.title+'</div>'
	result+='<div class="tl-minP"><span class="tl-index">최소 입찰가</span>'+data.min_price+'</div>';
	result+='<div class="tl-maxP"><span class="tl-index">즉시 낙찰가</span>'+data.max_price+'</div>';
	result+='<div class="tl-buyer"><span class="tl-index">현재 입찰가</span>'+data.buyer+'</div>';
	result+='<div class="tl-period"><span class="tl-index">경매 기간</span>'+data.period+'</div>';
	result+='<div class="tl-seller"><span class="tl-index">판매자</span>'+data.m_id+'</div>';
	result+='</div>';
	return result;
}
function reload(){
	window.location.reload();	
}
</script>
<title>Insert title here</title>
<style type="text/css">
*{
	box-sizing: border-box;
	word-wrap:break-word;
	word-break:break-all;
	border-collapse: collapse;
	font-family: NanumGothic;
}
.hover{
	text-decoration: underline;
	color: red;
}
.click{
	font-weight: bold;
	color: red;
}
.t-container{
	width: 1500px;
	margin: 10px auto;
	padding: 20px 20px 10px 20px;
	
	border: 1px solid #bcbcbc;
	background-color: white;
	
}
.t-board-con{
	width: 1160px;
	height:400px;
	border: 1px solid #bcbcbc;
	float: left;
	margin: 10px auto;
	margin-left: 150px;
}
.t-con-title{
	width: 1160px;
	margin: 10px auto;
	border: 2px solid black;
	float: left;
	margin-left: 150px;
	padding: 10px 20px;
}
.t-paging{
	width: 1160px;
	height:40px;
	margin: 10px auto;
	border: 1px solid #bcbcbc;
	float: left;
	margin-left: 150px;
	text-align: center;
}
.t-auc-con{
	width: 1160px;
	margin: 10px auto;
	border-top: 1px solid #bcbcbc;
	border-bottom: 1px solid #bcbcbc;
	padding: 10px;
	float: left;
	margin-left: 150px;
}
.t-footer{
	clear: both;
}
.items{
	width:263.5px;
	height: 370px;
	float: left;
	margin: 10px;
}
.tl-img{
	width:100%;
	height: 50%;
}
.tl-title{
	padding-top:8px;
	overflow:hidden;
	text-overflow:ellipsis;
	width:100%;
	height: 20%;
	border-bottom: 1px solid #bcbcbc;
	font-size:20px;
	
	display: -webkit-box; 
	display: -ms-flexbox; 
	display: box;
	vertical-align:top;
	-webkit-box-orient:vertical;
	-webkit-line-clamp:3;
	line-height: 22px;
}
.tl-minP{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
	font-weight: bold;
}
.tl-maxP{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
	font-weight: bold;
}
.tl-buyer{
	vertical-align:middle;
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
	font-weight: bold;
}
.tl-period{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
}
.tl-seller{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
}
.tl-index{
	display:inline-block;
	width:30%;
	font-size: 12px;
	color: rgb(160,160,160);
	font-weight: bold;
}
.font-eft{
	text-shadow: 1px 1px 1px rgb(220,220,220);
	box-shadow: 5px 5px 5px rgb(180,180,180);
	border-left: 1px solid #bcbcbc;
	border-bottom: 1px solid #bcbcbc;
}
.clk:hover{
	text-shadow: 1px 1px 1px rgb(220,220,220);
	box-shadow: 5px 5px 5px rgb(180,180,180);
	border-left: 1px solid #bcbcbc;
	border-bottom: 1px solid #bcbcbc;
}
.clk{
	cursor: pointer;
}
#search_result:hover{
	color: red;
	text-decoration: underline;
}
#moreBtn{
	color: blue;
	text-decoration: underline;
}
#moreBtn:hover{
	color: red;
	text-decoration: underline;
}
#more_auc{
	color: blue;
	text-decoration: underline;
}
#more_auc:hover{
	color: red;
	text-decoration: underline;
}
.more-btn{
	cursor: pointer;
	font-size: 20px;
	display: inline-block;
	height: 100%;
}
</style>
</head>
<body>
	<div class="t-container">
		<div class="t-con-title"></div>
		<div class="t-board-con"></div>
		<div class="t-paging"></div>
		<div class="t-con-title">
			<span style="font-weight: bold;font-size: 20px;color:red;cursor: pointer;" id="search_result" onclick="reload()">' ${search } '</span>
			<span style="font-size: 20px;display: inline-block;text-indent: 20px;">에 대한 물품 검색결과(${totalCount})</span><br>
			<c:forEach begin="0" end="6" step="1" var="i">
				<c:if test="${listCount[i] ne 0 }">
					<span id="go_ctg_${listCount[i] }" class="go-ctg" style="cursor: pointer;">
						<span class="ctg_name" style="line-height: 35px;">${ctg[i]}</span><span>(${listCount[i]})</span>
					</span>
				</c:if>
			</c:forEach>
		</div>
		<div class="t-auc-con">
			<c:if test="${totalList.size() gt 0}">
				<c:forEach begin="0" end="${totalList.size()-1}" step="1" var="i">
					<div class="items clk">
						<input type="hidden" class="tl_aucNum" id="tl_aucNum_${totalList[i].num}" value="${totalList[i].num}">
						<div class="tl-img" id="tl_img_${totalList[i].num}">이미지</div>
						<div class="tl-title">${totalList[i].title }</div>
						<div class="tl-minP"><span class="tl-index">최소 입찰가</span>${totalList[i].min_price }</div>
						<div class="tl-maxP"><span class="tl-index">즉시 낙찰가</span>${totalList[i].max_price }</div>
						<div class="tl-buyer"><span class="tl-index">현재 입찰가</span>
							<c:if test="${totalList[i].buyer eq null || totalList[i].buyer eq '' }">&nbsp;</c:if>
							<c:if test="${totalList[i].buyer ne null || totalList[i].buyer ne '' }">${totalList[i].buyer}</c:if>
						</div>
						<div class="tl-period"><span class="tl-index">경매 기간</span>${totalList[i].period }</div>
						<div class="tl-seller"><span class="tl-index">판매자</span>${totalList[i].m_id }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${totalList.size() le 0 || totalList eq null}">
				검색조건에 일치하는 결과가 없습니다
			</c:if>
		</div>
		<div class="t-paging" id="t_paging" style="border: none;">
			<c:if test="${totalCount >8}">
				<span id="moreBtn"  class="more-btn">더보기</span>
			</c:if>
		</div>
		<div class="t-footer"></div>
	</div>

</body>
</html>