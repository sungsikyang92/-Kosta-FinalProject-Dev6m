<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewList</title>
</head>
<body>
똘이아범 ㅎㅇ?
<table>
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
			${rvo.reviewNo}
			<tr>
				<td>${rvo.reviewNo}</td>					<!-- 리뷰번호 불러오기 -->	
				<td>${rvo.reviewTitle}</td>					<!-- 리뷰제목 불러오기 -->
				<td>${rvo.memberVO.id}</td>					<!-- 리뷰작성자 불러오기 -->
				<td>${rvo.contentsVO.contentsNo}</td>		<!-- 리뷰컨텐츠번호 불러오기 -->
				<td>${rvo.reviewPostedTime}</td>			<!-- 리뷰작성일 불러오기 -->
			</tr>	
		</c:forEach>
	</tbody>
</table>
</body>
</html>