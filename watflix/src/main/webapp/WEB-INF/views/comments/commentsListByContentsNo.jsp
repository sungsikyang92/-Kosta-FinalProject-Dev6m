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
<title>commentList</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#commentsWriteForm").submit(function(){
				alert("작성하시겠습니까?")
			})
		})
	</script>
	평점  
	<form action="commentsWrite.do" id="commentsWriteForm" method="post">
	<sec:csrfInput/>
	<table>
		<tr>			
			<td>별점</td><td><input type="number" name="commentsStars" min="1" max="10" required="required"></td>
		</tr>
		<tr>
			<td>한줄평</td><td><textarea cols="90" rows="5" name="commentsContents" placeholder="한줄평을 입력해주세요!" required="required"></textarea></td>
			<td><input type="submit" value="작성"></td>
		</tr>
	</table>	
	</form>
	<table class="table table-borderde table-hober boardlist">
		<c:forEach items="${requestScope.commentsListByContentsNo.list}" var="commentsListByContentsNo">
		<tr>
			<td>
				별점 : ${commentsListByContentsNo.commentsStars}
			</td>
			<td>
				별점 점수 : ${commentsListByContentsNo.commentsStars}
			</td>
			<td>
				comments : ${commentsListByContentsNo.comments}
			</td>
		</tr>
		<tr>
			<td>
				아이디 : ${commentsListByContentsNo.memberVO.id }
			</td>
			<td>
				작성 일시 : ${commentsListByContentsNo.commentsPostedTime}
			</td>
			<td>
				<a href="#">신고링크</a>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="pagingInfo">
		<c:set var="pagingBean" value="${requestScope.commentsListByContentsNo.pagingBean}"/>
		<ul class="pagination">
			<c:if test="${pagingBean.previousPageGroup}">
				<li><a href="${pageContext.request.contextPath}/getCommentsListByContentsNo.do?pageNo=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pagingBean.nowPage!=i}">
						<li><a href="${pageContext.request.contextPath}/getCommentsListByContentsNo.do?pageNo=${i}">${i}</a></li>
					</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
				</c:choose>
				&nbsp;
			</c:forEach>
			<c:if test="${pagingBean.nextPageGroup}">
				<li><a href="${pageContext.request.contextPath}/getCommentsListByContentsNo.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>