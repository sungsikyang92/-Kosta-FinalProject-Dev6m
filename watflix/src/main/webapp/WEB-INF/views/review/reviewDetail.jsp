<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviewdetail</title>
<!-- JQuery에용 ㅎㅎ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<h3> <a class="nav-link navbar-nav-item" href="${pageContext.request.contextPath}/reviewList.do">리뷰리스트로</a>
</h3>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewDelete").submit(function(){
			return confirm("삭제하시겠습니까?(아직미완성, 버튼이랑 confirm만 만들어짐)");
		});//reviewDelete
		$("#reviewUpdateForm").submit(function(){
			return confirm("수정하시겠습니까?");
		});
	});//ready
</script>
<table class="table">
	<caption>리뷰상세보기</caption>
	<c:set var="reviewDetail" value="${requestScope.rdvo}"></c:set>
	<thead>
		<tr>
			<th class="reviewTitle">${reviewDetail.reviewTitle}</th>
			<th class="reviewHits">조회${reviewDetail.reviewHits}</th>
			<th class="reviewLikes">추천${reviewDetail.reviewLikes}</th>
			<th class="reportBtn"><a href="#">신고</a></th>
		</tr>
		<tr>
			<th colspan="3" class="MemberId">${reviewDetail.memberVO.id}의 모든리뷰보기(모든리뷰보기만드냐?)</th>
			<th class="reviewPostedTime">${reviewDetail.reviewPostedTime}</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="contentsTitle">${reviewDetail.contentsVO.contentsTitle}에 대한 리뷰</td>
		</tr>
		<tr>
			<td colspan="4" class="reviewContents">${reviewDetail.reviewContents}</td>
		</tr>
	</tbody>
</table>
<!-- 삭제 아직 미완성 버튼이랑 confirm만 만들어짐 -->
<button form="reviewDelete" type="submit">삭제</button>
<button form="reviewUpdateForm" type="submit">수정</button>
<form action="reviewDelete.do" id="reviewDelete">
<input type="hidden" name="reviewNo" value="${reviewDetail.reviewNo}">
</form>
<form action="reviewUpdateForm.do" id="reviewUpdateForm">
<input type="hidden" name="reviewNo" value="${reviewDetail.reviewNo}">
</form>
</body>
</html>