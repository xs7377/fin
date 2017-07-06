<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	// =======================================view 페이지 링크 & hover=======================
		$(".go-view").on("click",function(){
			var getViewNum=$(this).attr('id');
			getViewNum=getViewNum.substring(getViewNum.lastIndexOf("_")+1);
			location.href="${pageContext.servletContext.contextPath}/auction/auctionView/"+getViewNum;
		});
		$(".go-view").hover(function(){
			$(this).addClass('go-view-change');
		},function(){
			$(this).removeClass('go-view-change');	
		});
	// =======================================hover 밑줄처리================================
		$(".rank-search").hover(function(){
			$(this).addClass('udl');
		},function(){
			$(this).removeClass('udl');
		});
		$(".clk").hover(function(){
			$(this).addClass('font-eft');
		},function(){
			$(this).removeClass('font-eft');
		});
		$(".cpt").hover(function(){
			var p=$(this).parents('.al-list-wrap');
			$(p).children('div').addClass('font-eft2');
		},function(){
			var p=$(this).parents('.al-list-wrap');
			$(p).children('div').removeClass('font-eft2');
		});
		var pa=$(".al-pri-paging").children('a');
		$(pa).hover(function(){
			$(this).addClass('udl2');
		},function(){
			$(this).removeClass('udl2');
		});
		
		var na=$(".al-nor-paging").children('a');
		$(na).hover(function(){
			$(this).addClass('udl2');
		},function(){
			$(this).removeClass('udl2');
		});
		//=======================================검색어link================================
		$(".rank-search").on("click",function(){
			var sr=$(this).text();
			var form=document.createElement("form");
			form.method="post";
			form.action="./totalList";
			var e1=document.createElement("input");
			var e2=document.createElement("input");
			var e3=document.createElement("input");
			
			e1.name="search";
			e2.name="startNum";
			e3.name="lastNum";
			
			e1.value=sr;
			e2.value=1;
			e3.value=8;
			
			e1.type="hidden";
			e2.type="hidden";
			e3.type="hidden";
			document.body.appendChild(form);
			form.appendChild(e1);
			form.appendChild(e2);
			form.appendChild(e3);
			form.submit();
		});
		//=======================================검색어순위변동================================
		for(var i=0;i<=9;i++){
			var rm=$("#rank_move_"+i).text();
			if(rm*1<0){
				$("#rank_move_"+i).html(rm*-1);
				$("#rank_move_"+i).append('<span style="display:inline-block;text-indent: 5px;font-size:14px;padding-top:2px;float:right;">↑</span>');
				$("#rank_move_"+i).addClass('blue');
			}
			if(rm*1>0){
				$("#rank_move_"+i).append('<span style="display:inline-block;text-indent: 5px;font-size:14px;padding-top:2px;float:right;">↓</span>');
				$("#rank_move_"+i).addClass('red');
			}
			if(rm=='new'){
				$("#rank_move_"+i).addClass('green');
			}
			if(rm==0){
				$("#rank_move_"+i).html('-');
				$("#rank_move_"+i).addClass('gray');
			}
		}	
	// =======================================카테고리 제목 클릭================================
		$("#go_ctg2").on("click",function(){
			var cname1='${ctgName1}';
			var cnum1='${ctgNum1}';
			var cnum2='${ctgNum2}';
			var g=cnum1+"_"+cnum2;
			movePage(1, 8, 1, cname1, "", "titleContents", g, "album", 'n');
		});
	 // =======================================앨범형, 리스트형 보기================================
		 var view_kind='${view_kind}';
		 if(view_kind=='album'){
		 	 $("#al_pri_wrap_list").addClass("hide");
		 	 $("#al_nor_wrap_list").addClass("hide");
		     $("#al-p1").removeClass("al-remove-bt");
		 	 $("#al-p2").removeClass("al-remove-bt");
		 }else{
			 $("#al_pri_wrap_album").addClass("hide");
		 	 $("#al_nor_wrap_album").addClass("hide");
		 	 $("#al-p1").addClass("al-remove-bt");
		 	 $("#al-p2").addClass("al-remove-bt");
		 }
		 $("#al-list-view").on("click",function(){
			 view_kind='list';
			 $("#al_pri_wrap_album").addClass("hide");
			 $("#al_nor_wrap_album").addClass("hide");
			 $("#al_pri_wrap_list").removeClass("hide");
			 $("#al_nor_wrap_list").removeClass("hide");
			 $("#al-p1").addClass("al-remove-bt");
		 	 $("#al-p2").addClass("al-remove-bt");
		 });
		 $("#al-album-view").on("click",function(){
			 view_kind='album';
			 $("#al_pri_wrap_album").removeClass("hide");
			 $("#al_nor_wrap_album").removeClass("hide");
			 $("#al_pri_wrap_list").addClass("hide");
			 $("#al_nor_wrap_list").addClass("hide");
		 	 $("#al-p1").removeClass("al-remove-bt");
		 	 $("#al-p2").removeClass("al-remove-bt");
		 });
	 // =======================================카테고리(sideNav) 처리================================
		 $(document).ready(function(){
			 var ctgN2='${ctgNum2}';
			 $("#al_pnum_"+ctgN2).trigger("click");
		 });
		 $(".al-ctg3").on("click",function(){
			 var name3=$(this).text();
			 var al_pnum=$(this).attr("id");
			 al_pnum=al_pnum.split("_");
			 var al_ctg2="al_pnum_"+al_pnum[2];
			 var name2=$("#"+al_ctg2).text();
			 var name1='${ctgName1}';
			 var al_ctg=name1+","+name2+","+name3;
			 var al_nums='${ctgNum1}'+"_"+al_pnum[2]+"_"+al_pnum[3];
			 movePage(1, 8, 1, al_ctg, "", "titleContents", al_nums, "album", 'n');
		 });
	 // =======================================검색 처리================================
		 $("#aSBtn").on("click",function(){
			 var al_search=$("#al_search").val();
			 var al_kind=$("#al_kind").val();
			 var al_category='${ctgName1}';
			 var al_ctgNum='${ctgNum}';
			 var al_ctgNum_array=al_ctgNum.split("_");
			 
			 if(al_search=='' || al_search==null){
				 alert("검색어를 입력해주세요");
			 }else{
				 movePage(1, 8, 1, al_category, al_search, al_kind, al_ctgNum_array[0], "album", 'y');
				 //movePage(curPage, perPage, pri_curPage, category, search, kind, ctgNum, view_kind, isSearch)
			 }
		 });
	 // =======================================일반상품 페이징처리================================
		$(function(){
			var perPage='${perPage}';
			var pri_curPage='${pri_curPage}';
			var cur_category='${category}';
			var cur_search='${search}';
			var kind='${kind}';
			var ctgNum='${ctgNum}';
			
			$(".al-nor-firstPage").on("click",function(){
				var curPage=1;
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-nor-prePage").on("click",function(){
				var startNum='${pageResult.startNum}';
				var curPage=startNum*1-1;
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-nor-page").on("click",function(){
				var curPage=$(this).text();
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-nor-nextPage").on("click",function(){
				var lastNum='${pageResult.lastNum}';
				var curPage=lastNum*1+1;
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-nor-lastPage").on("click",function(){
				var curPage='${pageResult.totalPage}';
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
		});
	// =======================================프리미엄 페이징처리================================
		$(function(){
			var curPage='${curPage}';
			var perPage='${perPage}';
			var cur_category='${category}';
			var cur_search='${search}';
			var kind='${kind}';
			var ctgNum='${ctgNum}';
			
			$(".al-pri-firstPage").on("click",function(){
				var pri_curPage=1;
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-pri-prePage").on("click",function(){
				var startNum='${pri_pageResult.startNum}';
				var pri_curPage=startNum*1-1;
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-pri-page").on("click",function(){
				var pri_curPage=$(this).text();
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-pri-nextPage").on("click",function(){
				var lastNum='${pri_pageResult.lastNum}';
				var pri_curPage=lastNum*1+1;
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
			$(".al-pri-lastPage").on("click",function(){
				var pri_curPage='${pri_pageResult.totalPage}';
				movePage(curPage, perPage, pri_curPage, cur_category, cur_search, kind, ctgNum, view_kind, 'n');
			});
		});
	// =======================================썸네일 조회======================================
		$(document).ready(function(){
		//===================likeTop3 썸네일
			var likeTop3_array=$.makeArray($(".likeTop3_aucNum").map(function(){
				return $(this).attr('id');
			}));	
			for(var i=0;i<likeTop3_array.length;i++){
				var str=likeTop3_array[i];
				str=str.substring(str.lastIndexOf("_")+1);
				var img='likeTop3_img_'+i;
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
		//===================리스트형
			var pri_img_list_array=$.makeArray($(".pri_aucNum_list").map(function(){
				return $(this).attr("id");
			}));
			for(var i=0;i<pri_img_list_array.length;i++){
				var str=pri_img_list_array[i];
				str=str.substring(str.lastIndexOf("_")+1);
				var img='al_pri_img_list_'+i;
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
			var nor_img_list_array=$.makeArray($(".nor_aucNum_list").map(function(){
				return $(this).attr("id");
			}));
			for(var i=0;i<nor_img_list_array.length;i++){
				var str=nor_img_list_array[i];
				str=str.substring(str.lastIndexOf("_")+1);
				var img='al_nor_img_list_'+i;
				$.ajax({
					url:"./selectThum",
					type:"post",
					async:false,
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
			//===================앨범형
			var pri_img_array=$.makeArray($(".pri_aucNum").map(function(){
				return $(this).attr("id");
			}));
			for(var i=0;i<pri_img_array.length;i++){
				var str=pri_img_array[i];
				str=str.substring(str.lastIndexOf("_")+1);
				var img='al_pri_img_'+i;
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
			var nor_img_array=$.makeArray($(".nor_aucNum").map(function(){
				return $(this).attr("id");
			}));
			for(var i=0;i<nor_img_array.length;i++){
				var str=nor_img_array[i];
				str=str.substring(str.lastIndexOf("_")+1);
				var img='al_nor_img_'+i;
				$.ajax({
					url:"./selectThum",
					type:"post",
					async:false,
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
			
		
	// =======================================sideNav======================================
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	

	var accordion = new Accordion($('#accordion'), false);
});

function movePage(curPage, perPage, pri_curPage, category, search, kind, ctgNum, view_kind, isSearch){
	var form=document.createElement("form");
	form.method="post";
	form.action="./auctionList";
	var e1=document.createElement("input");
	var e2=document.createElement("input");
	var e3=document.createElement("input");
	var e4=document.createElement("input");
	var e5=document.createElement("input");
	var e6=document.createElement("input");
	var e7=document.createElement("input");
	var e8=document.createElement("input");
	var e9=document.createElement("input");
	
	e1.name="curPage";
	e2.name="perPage";
	e3.name="pri_curPage";
	e4.name="category";
	e5.name="kind";
	e6.name="search";
	e7.name="ctgNum";
	e8.name="view_kind";
	e9.name="isSearch";
	
	e1.value=curPage;
	e2.value=perPage;
	e3.value=pri_curPage;
	e4.value=category;
	e5.value=kind;
	e6.value=search;
	e7.value=ctgNum;
	e8.value=view_kind;
	e9.value=isSearch;
	
	e1.type="hidden";
	e2.type="hidden";
	e3.type="hidden";
	e4.type="hidden";
	e5.type="hidden";
	e6.type="hidden";
	e7.type="hidden";
	e8.type="hidden";
	e9.type="hidden";
	document.body.appendChild(form);
	form.appendChild(e1);
	form.appendChild(e2);
	form.appendChild(e3);
	form.appendChild(e4);
	form.appendChild(e5);
	form.appendChild(e6);
	form.appendChild(e7);
	form.appendChild(e8);
	form.appendChild(e9);
	form.submit();
}
</script>
	
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
*{
	box-sizing: border-box;
	word-wrap:break-word;
	word-break:break-all;
	border-collapse: collapse;
}
.al-container{
	width:1500px;
	margin: 20px auto 0 auto;
	padding: 20px;
	background-color: white;
	border-top: 2px solid #e4e4e4;
	border-left: 2px solid #e4e4e4;
	border-right: 2px solid #e4e4e4;
}
.al-subcon{
	float: right;
	width: 1114px;
}
.al-sideNav{
	position:absolute;
	overflow:scroll;
	overflow-X:hidden;
	width: 300px;
	padding: 20px;
	margin-bottom:20px;
	float: left;
	border: 1px solid #bcbcbc;
	box-shadow: 5px 5px 5px lightgray;
}
.al-search{
	padding-top:12px;
	margin-bottom:20px;
	width:258px;
	height:110px;
	border: 1px solid #bcbcbc;
	box-shadow: 2.5px 2.5px 2.5px lightgray;
}
.al-callCenter{
	width:258px;
	height:100px;
	padding: 20px;
	border: 1px solid #bcbcbc;
	box-shadow: 2.5px 2.5px 2.5px lightgray;
}
.al-pri{
	 text-align:justify;
	 height: 324px;
	 width: 1114px;
     margin-bottom:60px;
     float: right;
}
.al-priTitle{
	height: 60px;
	width: 1114px;
	padding-left:10px;
	padding-top:12px;
	margin-bottom:5px;
	float: right;
	color: #FC4C8C;
	font-size: 30px;
	font-weight: bold;	
	border-bottom: 1px solid #bcbcbc;
	text-shadow: 1px 1px 1px gray;
}
.al-pri-paging{
	text-align:center;
	height: 40px;
	width: 1114px;
	padding: 10px;
	float: right;
	border-top: 1px solid #bcbcbc;
	margin-bottom: 60px;
}
.al-norTitle{
	float:left;
	text-align:left;
	width: 1114px;
	height: 50px;
	padding-left:10px;
	margin-bottom: 5px;
	color:	#24b900;
	font-size: 30px;
	font-weight: bold;
	text-shadow: 1px 1px 1px rgb(190,190,190);	
	border-bottom: 1px solid #bcbcbc;
}
.al-nor-paging{
	float: right;
	text-align:center;
	height:40px;
	width: 1114px;
	padding: 10px;
	border-top: 1px solid #bcbcbc;
}
.al-nor6{
	text-align:left;
	height: 370px;
	width:263.5px;	
	margin-bottom: 20px;
	margin-left:20px;
	float:left;
	cursor: pointer;
}
.al-nor5{
	text-align:left;
	height: 370px;
	width:263.5px;	
	margin-bottom: 20px;
	float:left;
	cursor: pointer;
}
.al-nor2,.al-nor3,.al-nor4{
	height: 370px;
	width:263.5px;	
    margin-bottom: 20px;
    margin-left:20px;
    float:left;
    cursor: pointer;
}
.al-nor1{
	height: 370px;
	width:263.5px;	
    margin-bottom: 20px;
    float:left;
    cursor: pointer;
}
.al-subcontainer{
	margin-left:344px;
	margin-bottom:20px;
	box-sizing: border-box;
	width:1114px;
	
}
.al-footer{
	clear: both;
}
#al_pri_wrap_list{
	float: right;
	height: 500px;
}
#al_nor_wrap_list{
	float: right;
}
/*-------------------------	sideNav Style ------------------------------ */
ul { 
padding: 0;
list-style-type: none;
box-shadow: 2.5px 2.5px 2.5px lightgray;
 }
a {
  color: #b63b4d;
  text-decoration: none;
}
.accordion {
  width: 100%;
  max-width: 360px;
  margin: 30px auto 20px;
  background: #FFF;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
}

.accordion .link {
  cursor: pointer;
  display: block;
  padding: 15px 15px 15px 42px;
  font-size: 14px;
  font-weight: 700;
  border-bottom: 1px solid #CCC;
  position: relative;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.accordion li:last-child .link { border-bottom: 0; }

.accordion li i {
  position: absolute;
  top: 16px;
  left: 12px;
  font-size: 18px;
  color: #595959;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.accordion li i.fa-chevron-down {
  right: 12px;
  left: auto;
  font-size: 16px;
}

.accordion li.open .link { color: #b63b4d; }

.accordion li.open i { color: #b63b4d; }

.accordion li.open i.fa-chevron-down {
  -webkit-transform: rotate(180deg);
  -ms-transform: rotate(180deg);
  -o-transform: rotate(180deg);
  transform: rotate(180deg);
}

/**
 * Submenu
 -----------------------------*/


.submenu {
  display: none;
  background: #444359;
  font-size: 14px;
}

.submenu li { border-bottom: 1px solid #4b4a5e; }

.submenu a {
  display: block;
  text-decoration: none;
  color: #d9d9d9;
  padding: 7px;
  padding-left: 42px;
  -webkit-transition: all 0.25s ease;
  -o-transition: all 0.25s ease;
  transition: all 0.25s ease;
}

.submenu a:hover {
  background: #b63b4d;
  color: #FFF;
}
.scroll {
  overflow: auto;
  float: left;
}
.scroll1::-webkit-scrollbar {
  width: 7px;
}
.scroll1::-webkit-scrollbar-track {
  background: #ddd;
}
.scroll1::-webkit-scrollbar-thumb {
  background: #666; 
}
/*----------------------list info -------------------------------*/
.al-img{
	width:100%;
	height: 50%;
}
.al-title{
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
.al-minP{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
	font-weight: bold;
}
.al-maxP{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
	font-weight: bold;
}
.al-buyer{
	vertical-align:middle;
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
	font-weight: bold;
}
.al-period{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
}
.al-seller{
	padding-left:2px;
	line-height:1.4;
	width:100%;
	height: 6%;
	font-size:15px;
}
.pri-seller{
	background-color: #FBF2EA;
}
.nor-seller{
	background-color: #d9f3c1;
}
.al-index{
	display:inline-block;
	width:30%;
	font-size: 12px;
	color: rgb(160,160,160);
	font-weight: bold;
}
.no-pri-item{
	width:1114px;
	height: 370px;
	float :right;
	margin-bottom:20px;
	background-image: url("../resources/auction-img/no-item.jpg");
	background-position:center;
	background-size: 450px 350px;
	background-repeat: no-repeat;
	padding-top:215px;
	text-align: center;
}
.no-nor-item{
	width:1131px;
	height: 370px;
	padding-left:10px;
	margin-left:13.5px;
	margin-bottom: 20px;
	background-image: url("../resources/auction-img/no-item.jpg");
	background-position:center;
	background-size: 450px 350px;
	background-repeat: no-repeat;
	padding-top:215px;
	text-align: center;
	float: right;
}
.al-notice{
	font-weight:bold;
	font-size: 25px;
}
.al-top3-item{
	width:24%;
	height: 300px;
	float: left;
	background-color:;
}
.al-top3-seller{
	width:24%;
	height: 300px;
	float: left;
	margin-left: 14%;
}
.al-top10-search{
	width:24%;
	float: right;
}
.al-w1{
	border: 1px solid #bcbcbc; 
	height: 250px;
	box-shadow: 5px 5px 5px lightgray;
	padding-top: 10px;
}
.al-top3-title{
	width: 155px;
	height:40px;
	padding-top:10px;
	text-align: center;
	box-shadow: 3px 3px 3px lightgray;
	font-weight: bold;
	font-size: 18px;
	text-shadow: 1px 1px 1px rgb(200,200,200);
	margin: 0 auto;
	background-color: #f9f9f9;
	margin-bottom: 15px;
	margin-top: 5px;
	color: black;
}
.al-top10-title{
	width: 155px;
	height:40px;
	padding-top:10px;
	text-align: center;
	box-shadow: 3px 3px 3px lightgray;
	font-weight: bold;
	font-size: 18px;
	text-shadow: 1px 1px 1px rgb(200,200,200);
	margin: 0 auto;
	background-color: #f9f9f9;
	margin-bottom: 15px;
	margin-top: 5px;
	color: black;
}
.al-top3-list{
	height:20%;
	margin-top: 20px;
	width:100%;
	border: 1px solid #bcbcbc;
	text-align: center;
}
.al-top3-rank{
	padding-top:9px;
	float:left;
	height:50px;
	width:27px;
	margin-left: 18px;
	font-size: 25px;
	font-weight: bold;
	
}
.al-top3-img{
	margin-left:2px;
	float:left;
	height:50px;
	width:64px;
}
.al-top3-contents{
	padding-top:13px;
	padding-left:8px;
	padding-right:8px;
	height:50px;
	width:130px;
	overflow:hidden; 
	text-overflow:ellipsis; 
	white-space:nowrap;
	box-shadow: 3px 3px 3px lightgray;
	border: 1px solid #bcbcbc;
}
.al-mt{
	margin-top: 20px;
}
.al-top10-rank{
	padding-top:4px;
	padding-left:15px;
	padding-right:30px;
	height: 30px;
	width: 100%;
	overflow:hidden; 
	text-overflow:ellipsis; 
	white-space:nowrap;
}
.al-how-view{
	color:black;
	text-shadow:none;
	font-weight:normal;
	font-size:15px;
	float:right;
	width: 80px;
	height:47px;
	padding-top:16px;
}
.al-how-img{
	text-align:center;
	float:right;
	width: 35px;
	padding-top:5px;
}
.al-how-view a{
  color: black;
}
.al-how-view a:hover {
  color: orange;
  font-weight: bold;
}
.al-how-view a:active {
  color: orange;
  font-weight: bold;
}
.hide{
	display: none;
}
.al-list-wrap{
	padding-top:9px;
	width:1114px;
	height:100px;
	border-bottom: 1px solid #bcbcbc;
	float: right;
	margin-bottom: 20px;
}
.al-list-img{
	float:left;
	width: 150px;
	height:90%;
}
.al-list-title{
	float:left;
	height: 90%;
	width: 280px;
	margin-left:25px;
	overflow:hidden; 
	text-overflow:ellipsis; 
	white-space:nowrap;

}
.al-list-minP{
	float:left;
	height: 90%;
	width: 80px;
	margin-left:25px;
	padding-top: 25px;
	text-align: center;
}
.al-list-maxP{
	float:left;
	height: 90%;
	width: 80px;
	margin-left:25px;
	text-align: center;
}
.al-list-buyer{
	float:left;
	height: 90%;
	width: 140px;
	margin-left:25px;
	text-align: center;
}
.al-list-period{
	float:left;
	height: 90%;
	width: 140px;
	margin-left:25px;
	text-align: center;
}
.al-list-seller{
	float:left;
	height: 90%;
	width: 80px;
	margin-left:25px;
	text-align: center;
}
.al-list-wrap-index{
	width:1114px;
	height:25px;
	border-bottom: 1px solid #bcbcbc;
	float: right;
}
.al-list-img-index{
	float:left;
	width: 150px;
	height:90%;
}
.al-list-title-index{
	float:left;
	height: 90%;
	width: 280px;
	margin-left:25px;
}
.al-list-minP-index{
	float:left;
	height: 90%;
	width: 80px;
	margin-left:25px;
}
.al-list-maxP-index{
	float:left;
	height: 90%;
	width: 80px;
	margin-left:25px;
}
.al-list-buyer-index{
	float:left;
	height: 90%;
	width: 140px;
	margin-left:25px;
}
.al-list-period-index{
	float:left;
	height: 90%;
	width: 140px;
	margin-left:25px;
}
.al-list-seller-index{
	float:left;
	height: 90%;
	width: 80px;
	margin-left:25px;
}
.al-font{
	font-size: 15px;
	padding-top: 28px;
}
.al-index-font{
	font-size: 14px;
	text-align: center;
}
.al-remove-bt{
	border: none;
}
.fc1{
	color: gold;
}
.fc2{
	color: silver;
}
.fc3{
	color: #ab8282;
}
.red{
	color: red;
}
.blue{
	color: blue;
}
.green{
	color: green;
	font-weight: bold;
}
.gray{
	color: rgb(140,140,140);
	margin-right: 4.5px;
}
.udl {
	text-decoration: underline;
	font-weight: bold;
}
.udl2 {
	text-decoration: underline;
}
.rank-search{
	cursor: pointer;
}
.font-eft{
	text-shadow: 1px 1px 1px rgb(220,220,220);
	box-shadow: 5px 5px 5px rgb(180,180,180);
	border-left: 1px solid #bcbcbc;
	border-bottom: 1px solid #bcbcbc;
}
.font-eft2{
	text-decoration: underline;
	font-weight: bold;
}
.cpt{
	cursor: pointer;
}
.go-view{
	cursor: pointer;
}
.go-view-change{
	text-decoration: underline;
	font-weight: bold;
}
.clk{
	text-decoration: none;
}
</style>
</head>
<body style="background-image: url('${pageContext.servletContext.contextPath}/resources/auction-img/dot.jpg');">
<%@ include file="../sub/header.jspf"%>
<div class="al-container">
	<div class="al-sideNav scroll scroll1">
		<h2 style="line-height: 0;text-indent: 10px;text-shadow: 1px 1px 1px rgb(190,190,190);cursor: pointer;fon" id="go_ctg2">${ctgName1}</h2>
		<ul id="accordion" class="accordion">
			<c:if test="${ctgNum1==0}">
				<c:forEach begin="7" end="8" step="1" var="j">
					<li style="box-shadow: 2.5px 2.5px 2.5px lightgray;">
				    	<div class="link" style="padding: 0 20;"><i><img alt="" src="../resources/category_icon/ctg${j-6}.png"></i>&nbsp;&nbsp;&nbsp;<span id="al_pnum_${j}">${li[j].name}</span><i class="fa fa-chevron-down"></i></div>
					    <ul class="submenu">
					    	<c:if test="${li[j].name eq '여성의류'}">
						    	<c:forEach begin="39" end="54" step="1" var="k">
								    <li style="background-color:;"><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '남성의류'}">
						    	<c:forEach begin="55" end="67" step="1" var="k">
								    <li><a href="#" class="al-ctg3"  id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
					    </ul>
				 	</li>
				</c:forEach>
			</c:if>
			<c:if test="${ctgNum1==1}">
				<c:forEach begin="9" end="12" step="1" var="j">
					<li style="box-shadow: 1px 1px 1px lightgray;">
				    	<div class="link"><i><img alt="" src="../resources/category_icon/ctg${j-6}.png"></i>&nbsp;&nbsp;&nbsp;<span id="al_pnum_${j}">${li[j].name}</span><i class="fa fa-chevron-down"></i></div>
					    <ul class="submenu">
					    	<c:if test="${li[j].name eq '신발'}">
						    	<c:forEach begin="68" end="83" step="1" var="k">
								    <li><a href="#" class="al-ctg3"  id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '가방'}">
						    	<c:forEach begin="83" end="88" step="1" var="k">
								    <li><a href="#" class="al-ctg3"  id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '쥬얼리'}">
						    	<c:forEach begin="89" end="94" step="1" var="k">
								    <li><a href="#" class="al-ctg3"  id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '아이웨어'}">
						    	<c:forEach begin="95" end="98" step="1" var="k">
								    <li><a href="#" class="al-ctg3"  id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
					    </ul>
				 	</li>
				</c:forEach>
			</c:if>
			<c:if test="${ctgNum1==2}">
				<c:forEach begin="13" end="19" step="1" var="j">
					<li style="box-shadow: 1px 1px 1px lightgray;">
				    	<div class="link"><i><img alt="" src="../resources/category_icon/ctg${j-6}.png"></i>&nbsp;&nbsp;&nbsp;<span id="al_pnum_${j}">${li[j].name}</span><i class="fa fa-chevron-down"></i></div>
					    <ul class="submenu">
					    	<c:if test="${li[j].name eq '휘트니스'}">
						    	<c:forEach begin="99" end="101" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '골프'}">
						    	<c:forEach begin="102" end="110" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '등산/아웃도어'}">
						    	<c:forEach begin="111" end="118" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '캠핑'}">
						    	<c:forEach begin="119" end="124" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '낚시'}">
						    	<c:forEach begin="125" end="131" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '자전거'}">
						    	<c:forEach begin="132" end="133" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '자동차용품'}">
						    	<c:forEach begin="134" end="135" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
					    </ul>
				 	</li>
				</c:forEach>
			</c:if>
			<c:if test="${ctgNum1==3}">
				<c:forEach begin="20" end="23" step="1" var="j">
					<li style="box-shadow: 1px 1px 1px lightgray;">
				    	<div class="link"><i><img alt="" src="../resources/category_icon/ctg${j-6}.png"></i>&nbsp;&nbsp;&nbsp;<span id="al_pnum_${j}">${li[j].name}</span><i class="fa fa-chevron-down"></i></div>
					    <ul class="submenu">
					    	<c:if test="${li[j].name eq '출산/유아용품'}">
						    	<c:forEach begin="136" end="143" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '유아동의류'}">
						    	<c:forEach begin="144" end="147" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '유아동잡화'}">
						    	<c:forEach begin="148" end="156" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '장난감'}">
						    	<c:forEach begin="157" end="158" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
					    </ul>
				 	</li>
				</c:forEach>
			</c:if>
			<c:if test="${ctgNum1==4}">
				<c:forEach begin="24" end="26" step="1" var="j">
					<li style="box-shadow: 1px 1px 1px lightgray;">
				    	<div class="link"><i><img alt="" src="../resources/category_icon/ctg${j-6}.png"></i>&nbsp;&nbsp;&nbsp;<span id="al_pnum_${j}">${li[j].name}</span><i class="fa fa-chevron-down"></i></div>
					    <ul class="submenu">
					    	<c:if test="${li[j].name eq '가구'}">
						    	<c:forEach begin="159" end="170" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '생활'}">
						    	<c:forEach begin="171" end="174" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '커튼'}">
						    	<c:forEach begin="175" end="176" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
					    </ul>
				 	</li>
				</c:forEach>
			</c:if>
			<c:if test="${ctgNum1==5}">
				<c:forEach begin="27" end="37" step="1" var="j">
					<li style="box-shadow: 1px 1px 1px lightgray;">
				    	<div class="link"><i><img alt="" src="../resources/category_icon/ctg${j-6}.png"></i>&nbsp;&nbsp;&nbsp;<span id="al_pnum_${j}">${li[j].name}</span><i class="fa fa-chevron-down"></i></div>
					    <ul class="submenu">
					    	<c:if test="${li[j].name eq '대형가전'}">
						    	<c:forEach begin="177" end="181" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '주방가전'}">
						    	<c:forEach begin="182" end="195" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '계절가전'}">
						    	<c:forEach begin="196" end="200" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '생활가전'}">
						    	<c:forEach begin="201" end="203" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '카메라'}">
						    	<c:forEach begin="204" end="211" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '게임'}">
						    	<c:forEach begin="212" end="215" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '휴대폰'}">
						    	<c:forEach begin="216" end="222" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '태블릿'}">
						    	<c:forEach begin="223" end="229" step="1" var="k">
								    <li><a href="#" class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '음향기기'}">
						    	<c:forEach begin="230" end="237" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '노트북/PC'}">
						    	<c:forEach begin="238" end="240" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
							<c:if test="${li[j].name eq '모니터/프린터'}">
						    	<c:forEach begin="241" end="247" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
					    </ul>
				 	</li>
				</c:forEach>
			</c:if>
			<c:if test="${ctgNum1==6}">
				<c:forEach begin="38" end="38" step="1" var="j">
					<li style="box-shadow: 1px 1px 1px lightgray;">
				    	<div class="link"><i><img alt="" src="../resources/category_icon/ctg${j-6}.png"></i>&nbsp;&nbsp;&nbsp;<span id="al_pnum_${j}">${li[j].name}</span><i class="fa fa-chevron-down"></i></div>
					    <ul class="submenu">
					    	<c:if test="${li[j].name eq '도서'}">
						    	<c:forEach begin="248" end="249" step="1" var="k">
								    <li><a href="#"  class="al-ctg3" id="al_pnum_${j}_${k}">${li[k].name}</a></li>
							    </c:forEach>
							</c:if>
					    </ul>
				 	</li>
				</c:forEach>
			</c:if>
		</ul>
		<fieldset class="al-search">
			<legend>Search</legend>
			<div style="text-align: center;">
			<input type="text" id="al_search" style="width: 220px; height: 25px;">
			<select id="al_kind" style="width: 100px; height: 25px; margin-top: 10px;">
				<option value="titleContents">제목+내용</option>
				<option value="id">아이디</option>
			</select>
			
			<input type="button" value="검색" id="aSBtn" style="margin-left: 72px;height: 25px;">
			</div>
		</fieldset>
		<div class="al-callCenter">call-center</div>
	</div>
	<div class="al-pri">
		<div class="al-top3-item">
			<div class="al-top3-title">TOP3 인기물품</div>
			<c:if test="${likeTop3.size() eq 0 }">
			<div class="al-w1">
				<c:forEach begin="0" end="2" step="1" var="i">
				<div class="top3-hover">
				<div class="al-top3-rank al-mt fc${i+1}">${i+1}.</div>
				<div class="al-top3-img al-mt"><img alt="" src='../resources/auction-img/no.png'width="100%" height="100%"></div>
				<div class="al-top3-contents al-mt back${i+1}"></div>
				</div>
				</c:forEach>
			</div>
			</c:if>
			<c:if test="${likeTop3.size() eq 1 }">
			<div class="al-w1">
			<c:forEach begin="0" end="${likeTop3.size()-1 }" step="1" var="i">
				<input type="hidden" class="likeTop3_aucNum" id="likeTop3_aucNum_${likeTop3[i].num}" value="${likeTop3[i].num}">
				<div class="al-top3-rank al-mt fc${i+1}">${i+1}.</div>
				<div class="al-top3-img al-mt" id="likeTop3_img_${i}"></div>
				<div class="al-top3-contents al-mt back${i+1} go-view" id="go_view_${likeTop3[i].num}">${likeTop3[i].title}</div>
			</c:forEach>
				<div class="al-top3-rank al-mt fc2">2.</div>
				<div class="al-top3-img al-mt"><img alt="" src='../resources/auction-img/no.png'width="100%" height="100%"></div>
				<div class="al-top3-contents al-mt">test</div>
				<div class="al-top3-rank al-mt fc3">3.</div>
				<div class="al-top3-img al-mt"><img alt="" src='../resources/auction-img/no.png'width="100%" height="100%"></div>
				<div class="al-top3-contents al-mt">test</div>
			</div>
			</c:if>
			<c:if test="${likeTop3.size() eq 2 }">
			<div class="al-w1">
			<c:forEach begin="0" end="${likeTop3.size()-1 }" step="1" var="i">
				<input type="hidden" class="likeTop3_aucNum" id="likeTop3_aucNum_${likeTop3[i].num}" value="${likeTop3[i].num}">
				<div class="al-top3-rank al-mt fc${i}">${i+1}.</div>
				<div class="al-top3-img al-mt" id="likeTop3_img_${i}"></div>
				<div class="al-top3-contents al-mt back${i+1} go-view" id="go_view_${likeTop3[i].num}">${likeTop3[i].title}</div>
			</c:forEach>
				<div class="al-top3-rank al-mt fc3">3.</div>
				<div class="al-top3-img al-mt"><img alt="" src='../resources/auction-img/no.png'width="100%" height="100%"></div>
				<div class="al-top3-contents al-mt">test</div>
			</div>
			</c:if>
			<c:if test="${likeTop3.size() eq 3 }">
			<div class="al-w1">
			<c:forEach begin="0" end="${likeTop3.size()-1 }" step="1" var="i">
				<input type="hidden" class="likeTop3_aucNum" id="likeTop3_aucNum_${likeTop3[i].num}" value="${likeTop3[i].num}">
				<div class="al-top3-rank al-mt fc${i+1}">${i+1}.</div>
				<div class="al-top3-img al-mt" id="likeTop3_img_${i}"></div>
				<div class="al-top3-contents al-mt back${i+1} go-view" id="go_view_${likeTop3[i].num}">${likeTop3[i].title}</div>
			</c:forEach>
			</div>
			</c:if>
		</div>
		
		
		
		<div class="al-top3-seller">
			<div class="al-top3-title">TOP3 판매자</div>
			<c:if test="${likeTop3.size() eq 0 }">
			<div class="al-w1">
				<c:forEach begin="0" end="2" step="1" var="i">
				<div class="al-top3-rank al-mt fc${i+1}">${i+1}.</div>
				<div class="al-top3-img al-mt"><img alt="" src='../resources/auction-img/no.png'width="100%" height="100%"></div>
				<div class="al-top3-contents al-mt back${i+1}"></div>
				</c:forEach>
			</div>
			</c:if>
			<c:if test="${likeTop3.size() eq 1 }">
			<div class="al-w1">
			<c:forEach begin="0" end="${likeTop3.size()-1 }" step="1" var="i">
				<input type="hidden" class="likeTop3_aucNum" id="likeTop3_aucNum_${likeTop3[i].num}" value="${likeTop3[i].num}">
				<div class="al-top3-rank al-mt fc${i+1}">${i+1}.</div>
				<div class="al-top3-img al-mt" id="likeTop3_img_${i}"></div>
				<div class="al-top3-contents al-mt back${i+1}">${likeTop3[i].title}</div>
			</c:forEach>
				<div class="al-top3-rank al-mt fc2">2.</div>
				<div class="al-top3-img al-mt"><img alt="" src='../resources/auction-img/no.png'width="100%" height="100%"></div>
				<div class="al-top3-contents al-mt">test</div>
				<div class="al-top3-rank al-mt fc3">3.</div>
				<div class="al-top3-img al-mt"><img alt="" src='../resources/auction-img/no.png'width="100%" height="100%"></div>
				<div class="al-top3-contents al-mt">test</div>
			</div>
			</c:if>
			<c:if test="${likeTop3.size() eq 2 }">
			<div class="al-w1">
			<c:forEach begin="0" end="${likeTop3.size()-1 }" step="1" var="i">
				<input type="hidden" class="likeTop3_aucNum" id="likeTop3_aucNum_${likeTop3[i].num}" value="${likeTop3[i].num}">
				<div class="al-top3-rank al-mt fc${i}">${i+1}.</div>
				<div class="al-top3-img al-mt" id="likeTop3_img_${i}"></div>
				<div class="al-top3-contents al-mt back${i+1}">${likeTop3[i].title}</div>
			</c:forEach>
				<div class="al-top3-contents al-mt">test</div>
				<div class="al-top3-rank al-mt fc3">3</div>
				<div class="al-top3-img al-mt"></div>
				<div class="al-top3-contents al-mt">test</div>
			</div>
			</c:if>
			<c:if test="${likeTop3.size() eq 3 }">
			<div class="al-w1">
			<c:forEach begin="0" end="${likeTop3.size()-1 }" step="1" var="i">
				<input type="hidden" class="likeTop3_aucNum" id="likeTop3_aucNum_${likeTop3[i].num}" value="${likeTop3[i].num}">
				<div class="al-top3-rank al-mt fc${i+1}">${i+1}.</div>
				<div class="al-top3-img al-mt" id="likeTop3_img_${i}"></div>
				<div class="al-top3-contents al-mt back${i+1}">${likeTop3[i].title}</div>
			</c:forEach>
			</div>
			</c:if>
		</div>
		<div class="al-top10-search">
			<div class="al-top10-title">TOP10 검색어</div>
			<div style="border:  1px solid #bcbcbc;box-shadow: 5px 5px 5px lightgray;padding-bottom: 3px;">
			<c:forEach begin="0" end="9" step="1" var="i">
				<div class="al-top10-rank"><span style="display: inline-block; width: 30px; font-weight: bold;color: rgba(56, 56, 56, 0.8);">${i+1}.</span>
					<a id="rank_search_${i}" class="rank-search" style="color: black;">${searchTop10[i].search}</a>
					<span id="rank_move_${i}" style="float: right;font-size:14px">${rankMove[i]}</span>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<div class="al-priTitle">
		프리미엄 등록 물품
		<div class="al-how-view">
			<a href="#" id="al-list-view">리스트형</a>
		</div>
		<div class="al-how-img">
			<img alt="" src="../resources/auction-img/list.png">
		</div>
		<div class="al-how-view">
			<a href="#" id="al-album-view">앨범형</a>
		</div>
		<div class="al-how-img">
			<img alt="" src="../resources/auction-img/album.png">
		</div>
	</div>
	<div>
		<c:if test="${pri_aucList.size() eq 0}">
			<div class="no-pri-item">
				<span class="al-notice">등록된 게시글이 없습니다.</span>
			</div>
		</c:if>
		<c:if test="${pri_aucList.size() ne 0}">
			<div id="al_pri_wrap_album">
			<div class="al-subcon">
			<c:forEach begin="0" end="${pri_aucList.size()-1}" step="1" var="i">
				<div class="al-nor${i+1} clk go-view" id="go_view_${pri_aucList[i].num}">
					<input type="hidden" class="pri_aucNum" id="pri_aucNum_${pri_aucList[i].num}" value="${pri_aucList[i].num}">
					<div class="al-img" id="al_pri_img_${i}"></div>
					<div class="al-title">${pri_aucList[i].title}</div>
					<div class="al-minP"><span class="al-index">최소 입찰가</span>${pri_aucList[i].min_price}</div>
					<div class="al-maxP"><span class="al-index">즉시 낙찰가</span>${pri_aucList[i].max_price}</div>
					<div class="al-buyer"><span class="al-index">현재 입찰가</span>${pri_aucList[i].buyer}<c:if test="${pri_aucList[i].buyer eq '' || pri_aucList[i].buyer eq null  }">&nbsp;</c:if> </div>
					<div class="al-period"><span class="al-index">경매 기간</span>${pri_aucList[i].period}</div>
					<div class="al-seller pri-seller"><span class="al-index">판매자</span>${pri_aucList[i].m_id}</div>
				</div>
			</c:forEach>
			</div>
			</div>
			<div id="al_pri_wrap_list">
				<div class="al-list-wrap-index">
					<div class="al-list-img-index al-index-font"></div>
					<div class="al-list-title-index al-index-font">제목</div>
					<div class="al-list-minP-index al-index-font">최소 입찰가</div>
					<div class="al-list-maxP-index al-index-font">즉시 낙찰가</div>
					<div class="al-list-buyer-index al-index-font">현재 입찰가</div>
					<div class="al-list-period-index al-index-font">경매기간</div>
					<div class="al-list-seller-index al-index-font">판매자</div>
				</div>
			<c:forEach begin="0" end="${pri_aucList.size()-1}" step="1" var="i">
				<div class="al-list-wrap go-view" id="go_view_${pri_aucList[i].num}">
					<input type="hidden" class="pri_aucNum_list" id="pri_aucNum_list_${pri_aucList[i].num}" value="${pri_aucList[i].num}">
					<div class="al-list-img cpt" id="al_pri_img_list_${i}"></div>
					<div class="al-list-title al-font"><span class="cpt">${pri_aucList[i].title}</span></div>
					<div class="al-list-minP al-font">${pri_aucList[i].min_price}</div>
					<div class="al-list-maxP al-font">${pri_aucList[i].max_price}</div>
					<div class="al-list-buyer al-font">${pri_aucList[i].buyer}<c:if test="${pri_aucList[i].buyer eq '' || pri_aucList[i].buyer eq null  }">&nbsp;</c:if></div>
					<div class="al-list-period al-font">${pri_aucList[i].period}</div>
					<div class="al-list-seller al-font">${pri_aucList[i].m_id}</div>
				</div>
			</c:forEach>
			</div>
		</c:if>
	</div>
	<div class="al-pri-paging" id="al-p1">
		<c:if test="${pri_aucList.size() ne 0}">
			<c:if test="${pri_curPage ne 1}"><a href="#" class="al-pri-firstPage">[처음]</a></c:if>
			<c:if test="${pri_pageResult.curBlock>1}"><a href="#" class="al-pri-prePage">[이전]</a></c:if>
			<c:forEach begin="${pri_pageResult.startNum}" end="${pri_pageResult.lastNum}" step="1" var="i">
				<c:if test="${pri_curPage eq i }">
					<a href="#" class="al-pri-page" style="font-weight: bold;">${i}</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${pri_curPage ne i }">
					<a href="#" class="al-pri-page">${i}</a>&nbsp;&nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pri_pageResult.curBlock < pri_pageResult.totalBlock}"><a href="#" class="al-pri-nextPage">[다음]</a></c:if>
			<c:if test="${pri_curPage!=pri_pageResult.totalPage}"><a href="#" class="al-pri-lastPage">[마지막]</a></c:if>
		</c:if>
	</div>
	<div class="al-subcontainer">
		<div class="al-norTitle">일반 등록 물품</div>
		<c:if test="${aucList.size() eq 0}">
			<div class="no-nor-item">
				<span class="al-notice">등록된 게시글이 없습니다.</span>
			</div>
		</c:if>
		<c:if test="${aucList.size() ne 0}">
			<div id="al_nor_wrap_album">
			<c:forEach begin="0" end="${aucList.size()-1}" step="1" var="i">
				<c:if test="${i%4 eq 0}">
					<div class="al-nor5 clk go-view" id="go_view_${aucList[i].num}">
						<input type="hidden" class="nor_aucNum" id="nor_aucNum_${aucList[i].num}" value="${aucList[i].num}">
						<div class="al-img" id="al_nor_img_${i}"></div>
						<div class="al-title">${aucList[i].title}</div>
						<div class="al-minP"><span class="al-index">최소 입찰가</span>${aucList[i].min_price}</div>
						<div class="al-maxP"><span class="al-index">즉시 입찰가</span>${aucList[i].max_price}</div>
						<div class="al-buyer"><span class="al-index">현재 입찰가</span>${aucList[i].buyer}<c:if test="${aucList[i].buyer eq '' || aucList[i].buyer eq null  }">&nbsp;</c:if></div>
						<div class="al-period"><span class="al-index">경매 기간</span>${aucList[i].period}</div>
						<div class="al-seller nor-seller"><span class="al-index">판매자</span>${aucList[i].m_id}</div>
						</div>
				</c:if>
				<c:if test="${i%4 ne 0}">
					<div class="al-nor6 clk go-view" id="go_view_${aucList[i].num}">
						<input type="hidden" class="nor_aucNum" id="nor_aucNum_${aucList[i].num}" value="${aucList[i].num}">
						<div class="al-img" id="al_nor_img_${i}"></div>
						<div class="al-title">${aucList[i].title}</div>
						<div class="al-minP"><span class="al-index">최소 입찰가</span>${aucList[i].min_price}</div>
						<div class="al-maxP"><span class="al-index">즉시 입찰가</span>${aucList[i].max_price}</div>
						<div class="al-buyer"><span class="al-index">현재 입찰가</span>${aucList[i].buyer}<c:if test="${aucList[i].buyer eq '' || aucList[i].buyer eq null  }">&nbsp;</c:if></div>
						<div class="al-period"><span class="al-index">경매 기간</span>${aucList[i].period}</div>
						<div class="al-seller nor-seller"><span class="al-index">판매자</span>${aucList[i].m_id}</div>
					</div>
				</c:if>
			</c:forEach>
			</div>
			<div id="al_nor_wrap_list">
				<div class="al-list-wrap-index">
					<div class="al-list-img-index al-index-font"></div>
					<div class="al-list-title-index al-index-font">제목</div>
					<div class="al-list-minP-index al-index-font">최소 입찰가</div>
					<div class="al-list-maxP-index al-index-font">즉시 낙찰가</div>
					<div class="al-list-buyer-index al-index-font">현재 입찰가</div>
					<div class="al-list-period-index al-index-font">경매기간</div>
					<div class="al-list-seller-index al-index-font">판매자</div>
				</div>
			<c:forEach begin="0" end="${aucList.size()-1}" step="1" var="i">
				<div class="al-list-wrap go-view" id="go_view_${aucList[i].num}">
					<input type="hidden" class="nor_aucNum_list" id="nor_aucNum_list_${aucList[i].num}" value="${aucList[i].num}">
					<div class="al-list-img cpt" id="al_nor_img_list_${i}"></div>
					<div class="al-list-title al-font"><span class="cpt">${aucList[i].title}</span></div>
					<div class="al-list-minP al-font">${aucList[i].min_price}</div>
					<div class="al-list-maxP al-font">${aucList[i].max_price}</div>
					<div class="al-list-buyer al-font">${aucList[i].buyer}<c:if test="${aucList[i].buyer eq '' || aucList[i].buyer eq null  }">&nbsp;</c:if></div>
					<div class="al-list-period al-font">${aucList[i].period}</div>
					<div class="al-list-seller al-font">${aucList[i].m_id}</div>
				</div>
			</c:forEach>
			</div>
		</c:if>
		
		<div class="al-nor-paging" id="al-p2">
			<c:if test="${aucList.size() ne 0}">
				<c:if test="${curPage ne 1}"><a href="#" class="al-nor-firstPage">[처음]</a></c:if>
				<c:if test="${pageResult.curBlock>1}"><a href="#" class="al-nor-prePage">[이전]</a></c:if>
				<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" step="1" var="i">
					<c:if test="${curPage eq i }">
						<a href="#" class="al-nor-page" style="font-weight: bold;">${i}</a>&nbsp;&nbsp;
					</c:if>
					<c:if test="${curPage ne i }">
						<a href="#" class="al-nor-page">${i}</a>&nbsp;&nbsp;
					</c:if>
				</c:forEach>
				<c:if test="${pageResult.curBlock < pageResult.totalBlock}"><a href="#" class="al-nor-nextPage">[다음]</a></c:if>
				<c:if test="${curPage!=pageResult.totalPage}"><a href="#" class="al-nor-lastPage">[마지막]</a></c:if>
			</c:if>
		</div> 
	</div>
	
	<div class="al-footer"></div>
</div>
<%@ include file="../sub/footer.jspf"%>
</body>
</html>