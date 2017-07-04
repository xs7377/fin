<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="${pageContext.servletContext.contextPath}/resources/jquery-side-icon-dropdown-menu/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/jquery-side-icon-dropdown-menu/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/jquery-side-icon-dropdown-menu/js/google-maps.js"></script>
<script>$(document).ready(function(){$(".vertical-nav").verticalnav({speed: 200,align: "left"});});</script>
<title>Insert title here</title>
<style type="text/css">
.sli li{
	line-height: 0;
}
.dropdown:hover .dropdown-content {
    display:block;
    width: 50px;
    height: 20px;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
</style>
</head>
<script type="text/javascript">
$(function(){
	$(".link_ctg1").on("click",function(){
		var str=$(this).attr("id");
		str=str.split("_");
		var ctgNum=str[1];
		var name1="pnum_"+str[1];
		name1=$("#"+name1).text();
		var search_ctg=name1;
		$("#cate").val(
			search_ctg		
		);
		sendCtg(search_ctg, ctgNum);
	});
	$(".link_ctg2").on("click",function(){
		var str=$(this).attr("id");
		str=str.split("_");
		var ctgNum=str[1]+"_"+str[2];
		var name1="pnum_"+str[1];
		var name2=name1+"_"+str[2];
		name1=$("#"+name1).text();
		name2=$("#"+name2).text();
		var search_ctg=name1+","+name2;
		sendCtg(search_ctg, ctgNum);
	});
	$(".link_ctg3").on("click",function(){
		var str=$(this).attr("id");
		str=str.split("_");
		var ctgNum=str[1]+"_"+str[2]+"_"+str[3];
		var name1="pnum_"+str[1];
		var name2=name1+"_"+str[2];
		var name3=name2+"_"+str[3];
		name1=$("#"+name1).text();
		name2=$("#"+name2).text();
		name3=$("#"+name3).text();
		var search_ctg=name1+","+name2+","+name3;
		sendCtg(search_ctg, ctgNum);
	});
});

function sendCtg(ctg, ctgNum){
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
	e3.name="category";
	e4.name="kind";
	e5.name="search";
	e6.name="ctgNum";
	e7.name="pri_curPage";
	e8.name="view_kind";
	e9.name="isSearch";
	
	e1.value=1;
	e2.value=8;
	e3.value=ctg;
	e4.value="titleContents";
	e5.value="";
	e6.value=ctgNum;
	e7.value=1;
	e8.value="album";
	e9.value="n";
	
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


<body style="background-color: white">
<div class="dropdown" style="width: 50px;height: 20px;">
  <button class="dropbtn">Dropdown</button>
  <div class="dropdown-content">
    
	<div class="kePublic">
	<div class="content">
		<ul class="vertical-nav white red" style="width: 232px">
			<c:forEach begin="0" end="6" step="1" var="i">
				<li><a href="#" class="link_ctg1" id="pnum_${i}"><i class="${icon[i]}" ></i>${li[i].name}</a>
				<c:if test="${li[i].name eq '패션'}">
					<ul class="sli"> 
						<c:forEach begin="7" end="8" step="1" var="j">
							<li><a href="#" class="link_ctg2" id="pnum_${i}_${j}">${li[j].name }</a>
								<c:if test="${li[j].name eq '여성의류'}">
									<ul>
										<c:forEach begin="39" end="54" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '남성의류' }">
									<ul>
										<c:forEach begin="55" end="67" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							
							</li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${li[i].name eq '잡화'}">
					<ul class="sli">
						<c:forEach begin="9" end="12" step="1" var="j">
							<li><a href="#" class="link_ctg2" id="pnum_${i}_${j}">${li[j].name}</a>
								<c:if test="${li[j].name eq '신발' }">
									<ul>
										<c:forEach begin="68" end="83" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								
								<c:if test="${li[j].name eq '가방' }">
									<ul>
										<c:forEach begin="84" end="88" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '쥬얼리' }">
									<ul>
										<c:forEach begin="89" end="94" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '아이웨어' }">
									<ul>
										<c:forEach begin="95" end="98" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${li[i].name eq '스포츠/레저/자동차'}">
					<ul class="sli">
						<c:forEach begin="13" end="19" step="1" var="j">
							<li><a href="#" class="link_ctg2" id="pnum_${i}_${j}">${li[j].name }</a>
								<c:if test="${li[j].name eq '휘트니스' }">
									<ul>
										<c:forEach begin="99" end="101" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '골프' }">
									<ul>
										<c:forEach begin="102" end="110" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '등산/아웃도어' }">
									<ul>
										<c:forEach begin="111" end="118" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '캠핑' }">
									<ul>
										<c:forEach begin="119" end="124" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '낚시' }">
									<ul>
										<c:forEach begin="125" end="131" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '자전거' }">
									<ul>
										<c:forEach begin="132" end="133" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '자동차용품' }">
									<ul>
										<c:forEach begin="134" end="135" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</c:if>
				
				<c:if test="${li[i].name eq '유아'}">
					<ul class="sli">
						<c:forEach begin="20" end="23" step="1" var="j">
							<li><a href="#" class="link_ctg2" id="pnum_${i}_${j}">${li[j].name }</a>
								<c:if test="${li[j].name eq '출산/유아용품' }">
									<ul>
										<c:forEach begin="136" end="143" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '유아동의류' }">
									<ul>
										<c:forEach begin="144" end="147" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '유아동잡화' }">
									<ul>
										<c:forEach begin="148" end="156" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '장난감' }">
									<ul>
										<c:forEach begin="157" end="158" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${li[i].name eq '가구/생활/건강'}">
					<ul class="sli">
						<c:forEach begin="24" end="26" step="1" var="j">
							<li><a href="#" class="link_ctg2" id="pnum_${i}_${j}">${li[j].name }</a>
								<c:if test="${li[j].name eq '가구' }">
									<ul>
										<c:forEach begin="159" end="170" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '생활' }">
									<ul>
										<c:forEach begin="171" end="174" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '커튼' }">
									<ul>
										<c:forEach begin="175" end="176" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${li[i].name eq '디지털/가전/컴퓨터'}">
					<ul class="sli">
						<c:forEach begin="27" end="37" step="1" var="j">
							<li><a href="#" class="link_ctg2" id="pnum_${i}_${j}">${li[j].name }</a>
								<c:if test="${li[j].name eq '대형가전' }">
									<ul>
										<c:forEach begin="177" end="181" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '주방가전' }">
									<ul>
										<c:forEach begin="182" end="195" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '계절가전' }">
									<ul>
										<c:forEach begin="196" end="200" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '생활가전' }">
									<ul>
										<c:forEach begin="201" end="203" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '카메라' }">
									<ul>
										<c:forEach begin="204" end="211" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '게임' }">
									<ul>
										<c:forEach begin="212" end="215" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '휴대폰' }">
									<ul>
										<c:forEach begin="216" end="222" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '태블릿' }">
									<ul>
										<c:forEach begin="223" end="229" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '음향기기' }">
									<ul>
										<c:forEach begin="230" end="237" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '노트북/PC' }">
									<ul>
										<c:forEach begin="238" end="240" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${li[j].name eq '모니터/프린터' }">
									<ul>
										<c:forEach begin="241" end="247" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${li[i].name eq '도서'}">
					<ul class="sli">
						<c:forEach begin="38" end="38" step="1" var="j">
							<li><a href="#" class="link_ctg2" id="pnum_${i}_${j}">${li[j].name }</a>
								<c:if test="${li[j].name eq '도서' }">
									<ul>
										<c:forEach begin="248" end="249" step="1" var="k">
											<li><a href="#" class="link_ctg3" id="pnum_${i}_${j}_${k}">${li[k].name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="clear"></div>
	</div>
  </div>
</div>

</body>
</html>