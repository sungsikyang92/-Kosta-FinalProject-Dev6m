<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(doucment).ready(function(){
		$('#commentsWriteForm').submit(function(){
			return confirm("작성하시겠습니까?");
		})
	})
</script>
<title>commentList</title>
</head>
<body>
	<table class="table table-borderde table-hober boardlist">
		<c:forEach items="${requestScope.commentsList.list}" var="commentsList">
		<tr>
			<td>
				별점 : ${commentsList.commentsStars}
			</td>
			<td>
				별점 점수 : ${commentsList.commentsStars}
			</td>
			<td>
				comments : ${commentsList.comments}
			</td>
		</tr>
		<tr>
			<td>
				아이디 : ${commentsList.memberVO.id }
			</td>
			<td>
				작성 일시 : ${commentsList.commentsPostedTime}
			</td>
			<td>
				<a href="#">신고링크</a>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="pagingInfo">
		<c:set var="pagingBean" value="${requestScope.commentsList.pagingBean}"/>
		<ul class="pagination">
			<c:if test="${pagingBean.previousPageGroup}">
				<li><a href="${pageContext.request.contextPath}/getCommentsList.do?pageNo=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pagingBean.nowPage!=i}">
						<li><a href="${pageContext.request.contextPath}/getCommentsList.do?pageNo=${i}">${i}</a></li>
					</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
				</c:choose>
				&nbsp;
			</c:forEach>
			<c:if test="${pagingBean.nextPageGroup}">
				<li><a href="${pageContext.request.contextPath}/getCommentsList.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>