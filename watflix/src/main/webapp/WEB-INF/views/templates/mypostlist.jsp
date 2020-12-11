<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- tiles framework 선언부 --%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- title -->
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<!-- Bootstrap 4.4.1 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<!-- Flickity 2.2.1 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/flickity.css">
<!-- JQuery UI -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<!-- Main CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- FAVICONS -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/media/images/netflix_icon.png">
<link rel="shortcut icon" sizes="16x16"
	href="${pageContext.request.contextPath}/resources/media/favicon/favicon-16x16.png">
<link rel="shortcut icon" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/media/favicon/favicon-32x32.png">


</head>

<body>
   
	<!-- Tiles header 영역 -->
	<tiles:insertAttribute name="header" />
	<!-- 평점 -->
	<tiles:insertAttribute name="main" />
	<!-- 리뷰 -->
	<tiles:insertAttribute name="main2" />
	<!-- 신고(리뷰, 평점) -->
	<tiles:insertAttribute name="main3" />
	<!-- Tiles footer 영역 -->
	<tiles:insertAttribute name="footer" />


	
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- JQuery UI -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"
		defer></script>
	<!-- Pooper JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"
		defer></script>
	<!-- Bootstrap 4.4.1 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
		defer></script>
	<!-- Flickity 2.2.1 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/flickity.min.js"
		defer></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"
		defer></script>

</body>

</html>
