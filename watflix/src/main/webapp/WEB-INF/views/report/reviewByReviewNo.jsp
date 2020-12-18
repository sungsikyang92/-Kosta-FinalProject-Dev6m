<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 4.4.1 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<!-- Main CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-lg margin-top margin-bottom boardClassMain" style="margin-top: 10px;top: 5pt;margin-bottom: 20px;">
  <h2>리뷰상세보기</h2>           
  <table class="table table-bordered" style="border-radius: 1.5px;">
	<c:set var="reviewDetail" value="${requestScope.rdvo}"></c:set>
		<tr>
			<th>${reviewDetail.reviewTitle}</th>
			<th>조회${reviewDetail.reviewHits}</th>
			<th>
				<a href="#">
				<c:choose>
					<c:when test="${reviewDetail.reviewLikeStatus == 1}">
						<img id="ReviewLike" class="ReviewLike" src="/watflix/resources/media/icons/RedHeart.png" width=30px height=30px>
					</c:when>
					<c:otherwise>
						<img id="ReviewLike" class="ReviewLike" src="/watflix/resources/media/icons/HeartLine.png" width=30px height=30px>
					</c:otherwise>
				</c:choose>
				
				</a>
				Likes <span id="LikesCount">${reviewDetail.reviewLikes}</span>	
			</th>
			<th class="reviewPostedTime">${reviewDetail.reviewPostedTime}</th>
		</tr>
		<tr class="boardDetailTr">
			<td>내용</td>
			<td colspan="3" class="reviewContents"><pre style="white-space:pre-wrap;">${reviewDetail.reviewContents}</pre></td>
		</tr>
  </table>
</div>
</body>
</html>