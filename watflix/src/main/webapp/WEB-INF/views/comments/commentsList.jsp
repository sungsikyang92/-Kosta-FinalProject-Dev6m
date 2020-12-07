<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#commentsDeleteButton").click(function(){
			alert('1');
		})
	})
</script>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<table class="table table-hover">
		<c:forEach items="${requestScope.commentsList.list}" var="commentsList">
		<tr>
			<td rowspan="2">
				별점 : ${commentsList.commentsStars}
			</td>
			<td rowspan="2">
				별점 점수 : ${commentsList.commentsStars}
			</td>
			<td colspan="3">
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
			<td>
				<form action="${pageContext.request.contextPath}/commentsDelete.do" method="post" id="commentsDeleteForm">
					<input type="hidden" name="commentsDelete" value="${commentsList.commentsNo}">
					<input type="submit" name="commentsDeleteButton" value="삭제">
				</form>
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
</sec:authorize>
</div>