<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.review_wrap{
	width: 100%;
	height: auto;
	overflow: hidden;
	min-height: 400px;
}
.review_reply{
	margin-left: 25px;
}
.media{
	margin-left: 25px;
}
.media-left{
	float: left;
	margin-right: 10px;
}

.media-heading{
	font-size: 0.9em;
	color: gray;
	font-weight: normal;
	margin-top: 5px;
	margin-bottom: 5px;
}

.review_line{
	border: none;
	border-bottom: 1px solid silver;
}

</style>
</head>
<body>
<div class="review_wrap">
<div>판매자 후기</div>
<c:forEach items="${list }" var="l">
      <div class="media">
        <div class="media-left">
          <img src="img_avatar2.png" class="media-object" style="width:45px">
        </div>
        <div class="media-body">
          <h4 class="media-heading">${l.m_id } <small><i>${l.reg_date }</i></small><span>${l.score }</span></h4>
          <p>${l.title } - ${l.contents }
          <c:if test="${l.p_id eq member.id }">
          	<span class="review_reply">답글달기</span>
          </c:if>
          </p>
    </div>
  </div>
  <hr class="review_line">
</c:forEach>
</div>
</body>
</html>