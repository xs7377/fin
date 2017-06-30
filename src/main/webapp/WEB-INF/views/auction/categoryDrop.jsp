<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.drop_box {
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

.drop_box a {
    color: black;
    padding: 10px 12px;
    text-decoration: none;
    display: block;
    font-size: 0.8em;
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
.dropbtn:hover .dropbtn {
    background-color: #3e8e41;
}
.dropbtn {
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
  <button class="dropbtn">${cateTitle[i-1] }</button>
  <div class="drop_box cate${i }">
  <c:forEach items="${cateList[i-1] }" var="c1">
  	<c:if test="${c1.name eq cateTitle[i-1] }">
	  	<a href="${c1.num }" style="color: red;">${c1.name }</a>
  	</c:if>
  	<c:if test="${c1.name ne cateTitle[i-1] }">
	  	<a href="${c1.num }">${c1.name }</a>
  	</c:if>
  </c:forEach>
  </div>
</div>
</c:forEach>
</body>
</html>