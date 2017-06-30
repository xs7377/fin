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

<div class="slideshow-container">

<c:forEach var="i" begin="1" end="${img.size() }" step="1">

<div class="mySlides fade">
  <img src="${pageContext.servletContext.contextPath}/resources/upload/${img[i-1].fName }" style="width:100%; height: 505px;">
</div>

</c:forEach>

<c:if test="${img.size()>1 }">
<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>
</c:if>
</div>
<br>

<div style="text-align:center">
<c:if test="${img.size() > 1 }">
<c:forEach var="i" begin="1" end="${img.size() }" step="1">
  <span onclick="currentSlide(${i})">
  	<img src="${pageContext.servletContext.contextPath}/resources/upload/${img[i-1].fName }" style="width:10%; height: 10%;">
  </span> 
</c:forEach>
</c:if>
</div>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
}
</script>


</body>
</html>