<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewList</title>
</head>
<body>
<h3> <a class="nav-link navbar-nav-item" href="${pageContext.request.contextPath}/home.do">홈으로</a>
</h3>
<table class="table">
	<caption>리뷰목록</caption>
	<thead>
		<tr>
			<th class="reviewNo">NO</th>
			<th class="reviewTitle">제목</th>
			<th class="reviewWriter">작성자</th>
			<th class="contentsNo">컨텐츠NO</th>
			<th class="reviewDate">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="rvo" items="${requestScope.lvo.reviewList}">
			<tr>
				<td>${rvo.reviewNo}</td>					<!-- 리뷰번호 불러오기 -->	
				<td><a href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${rvo.reviewNo}">${rvo.reviewTitle}</a></td>					<!-- 리뷰제목 불러오기 -->
				<td>${rvo.memberVO.id}</td>					<!-- 리뷰작성자 불러오기 -->
				<td>${rvo.contentsVO.contentsNo}</td>		<!-- 리뷰컨텐츠번호 불러오기 -->
				<td>${rvo.reviewPostedTime}</td>			<!-- 리뷰작성일 불러오기 -->
			</tr>	
		</c:forEach>
	</tbody>
</table><br><br>
<div class="pagingInfo">
	<c:set var="rpb" value="${requestScope.lvo.pagingBean}"/>
	<ul class="pagination">
		<c:if test="${rpb.previousPageGroup}">		<!-- 이전 페이지으로 넘어갈 만큼 충분한 게시글이있으면 '<<' 페이지 넘기기 버튼이 생성된다. -->
		<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${rpb.startPageOfPageGroup-1}">&laquo;</a></li>	<!-- $laquo는 페이징에 나타나는'<<'왼쪽페이지 버튼이다. -->
		</c:if>
		<c:forEach var="i" begin="${rpb.startPageOfPageGroup}" end="${rpb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${rpb.nowPage != i}">
					<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
			$nbsp;
		</c:forEach>
		<c:if test="${rpb.nextPageGroup}">			<!-- 다음 페이지로 넘어갈 만큼 충분한 게시글이 있으면 '>>' 페이지 넘기기 버튼이 생성된다. -->
			<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${rpb.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div>
<a class="nav-link navbar-nav-item" href="${pageContext.request.contextPath}/reviewWriteForm.do?contentsNo=${requestScope.lvo.reviewList[0].contentsVO.contentsNo}">
Go to ReviewWriteForm!!
</a>
</body>
</html>