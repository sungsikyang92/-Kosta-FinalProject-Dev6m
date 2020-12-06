<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#noticeWriteButton").click(function(){
			location.href="noticeWriteForm.do";
		})
	})
</script>
<title>noticeListAdmin</title>
</head>
<body>
<div class="cotainer-fluid">
	<%-- <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
	<button type="button" id="noticeWriteButton">글쓰기</button>
	<%-- </sec:authorize> --%>
	<table class="table table-bordered  table-hover boardlist">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>아이디</td>
			<td>작성일자</td>
			<td>조회수</td>
			<td></td>
		</tr>
		<c:forEach items="${requestScope.noticeList.list}" var="noticeList">
		<tr>
			<td>${noticeList.noticeNo}</td>
			<td>
				<a href="${pageContext.request.contextPath}/noticeDetail.do?noticeNo=${noticeList.noticeNo}">
					${noticeList.noticeTitle}
				</a>
			</td>
			<td>${noticeList.memberVO.id}</td>
			<td>${noticeList.noticePostedTime}</td>
			<td>${noticeList.noticeHits}</td>
			<td><input type="checkbox" value="${noticeList.noticeNo}" name="deleteCheckbox[]"></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5"></td>
			<td><button id="deletePostByCheckboxbutton">삭제</button>
		</tr>
	</table>
<div class="pagingInfo">
	<c:set var="pagingBean" value="${requestScope.noticeList.pagingBean}"></c:set>
		<ul class="pagination">
		<c:if test="${pagingBean.previousPageGroup}">
		<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pagingBean.nowPage!=i}">
					<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
			&nbsp;
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">
			<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div><!-- pagingInfo -->
</div> <!-- container-fluid -->
</body>
</html>