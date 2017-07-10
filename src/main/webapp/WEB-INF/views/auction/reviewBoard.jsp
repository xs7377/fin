<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<table>
		<thead>
			<tr>
				<td>TI</td>
				<td>Contents</td>
				<td>DAY</td>
				<td>SCORE</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="l">
				<tr id="review_${l.num }">
					<td>${l.title }</td>
					<td>${l.contents }</td>
					<td>${l.reg_date }</td>
					<td class="score_wrap" id="s${l.num }_${l.score}">${l.score }</td>
					<c:if test="${l.p_id eq member.id }">
						<td id="reply_${l.num }">답글</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>
</body>
</html>