<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var cate = $(".categorydrop_box").children("span");
		$(cate).on("click",function(){
			var id = $(this).attr("id");
			var name =$(this).text();
			id = id.split("_");
			var cate_num = $.makeArray($(".cate_line").map(function(){
				var cate = $(this).attr("id");
				cate = cate.split("_");
				return cate[1];
			}));
			var cate_name = $.makeArray($(".cate_line").map(function(){
				return $(this).text();
			}));
			if(id[2]==1){
				cate_num = id[1];
				cate_name = name;
			}else if(id[2]==2){
				cate_num = cate_num[0]+'_'+id[1];
				cate_name = cate_name[0]+","+name;
			}else{
				cate_num = cate_num[0]+'_'+cate_num[1]+"_"+id[1];
				cate_name = cate_name[0]+","+cate_name[1]+","+name;
			}
			
			formMaker(cate_name,cate_num);
			
		});
		
		function formMaker(name, num){
			var form = document.createElement("form");
			form.setAttribute("method","post");
			form.setAttribute("action","../auctionList");
			
			var curPage = document.createElement("input");
			curPage.setAttribute("type","hidden");
			curPage.setAttribute("name","curPage");
			curPage.setAttribute("value",1);
			
			var perPage = document.createElement("input");
			perPage.setAttribute("type","hidden");
			perPage.setAttribute("name","perPage");
			perPage.setAttribute("value",8);
			
			var pri_curPage = document.createElement("input");
			pri_curPage.setAttribute("type","hidden");
			pri_curPage.setAttribute("name","pri_curPage");
			pri_curPage.setAttribute("value",1);
			
			var category = document.createElement("input");
			category.setAttribute("type","hidden");
			category.setAttribute("name","category");
			category.setAttribute("value",name);
			
			var kind = document.createElement("input");
			kind.setAttribute("type","hidden");
			kind.setAttribute("name","kind");
			kind.setAttribute("value","titleContents");
			
			var search = document.createElement("input");
			search.setAttribute("type","hidden");
			search.setAttribute("name","search");
			search.setAttribute("value","");

			var ctgNum = document.createElement("input");
			ctgNum.setAttribute("type","hidden");
			ctgNum.setAttribute("name","ctgNum");
			ctgNum.setAttribute("value",num);

			var view_kind = document.createElement("input");
			view_kind.setAttribute("type","hidden");
			view_kind.setAttribute("name","view_kind");
			view_kind.setAttribute("value","album");
			
			var isSearch = document.createElement("input");
			isSearch.setAttribute("type","hidden");
			isSearch.setAttribute("name","isSearch");
			isSearch.setAttribute("value","n");
			
			document.body.appendChild(form);
			form.appendChild(curPage);
			form.appendChild(perPage);
			form.appendChild(pri_curPage);
			form.appendChild(category);
			form.appendChild(kind);
			form.appendChild(search);
			form.appendChild(ctgNum);
			form.appendChild(view_kind);
			form.appendChild(isSearch);
			form.submit();
		}
	});
</script>
<style type="text/css">
.categorydrop_box {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;

}
.category_btn{
	float: left;
	margin-left: 15px;	
}

.categorydrop_box span {
    color: black;
    padding: 10px 12px;
    text-decoration: none;
    display: block;
    font-size: 0.8em;
    cursor: pointer;
}

.cate_1:hover .cate1 {
    display: block;
}
.cate_2:hover .cate2 {
    display: block;
}
.cate_3:hover .cate3 {
    display: block;
}
.auctionView_cate_auctionView_cate_dropbtn:hover .auctionView_cate_dropbtn {
    background-color: #3e8e41;
}
.auctionView_cate_dropbtn {
    background-color: #e91e63;
    color: white;
    padding: 5px;
    border: none;
    cursor: pointer;
}
</style>
</head>
<body>
<c:forEach var="i" end="${cateList.size() }" begin="1" step="1">
<div class="cate_${i } category_btn">
  <button class="auctionView_cate_dropbtn">${cateTitle[i-1] }</button>
  <div class="categorydrop_box cate${i }">
  <c:forEach items="${cateList[i-1] }" var="c1">
  	<c:if test="${c1.name eq cateTitle[i-1] }">
	  	<span id="cate_${c1.pNum}_${i}" class="cate_line" style="color: red;">${c1.name }</span>
  	</c:if>
  	<c:if test="${c1.name ne cateTitle[i-1] }">
	  	<span id="cate_${c1.pNum}_${i}">${c1.name }</span>
  	</c:if>
  </c:forEach>
  </div>
</div>
</c:forEach>
</body>
</html>