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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>commentList</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#openCommentsWriteFormButton").click(function(){
				alert('1');
				var popupWidth = 500; // 팝업창 가로크기
				var popupHeight = 600; // 팝업창 세로크기
				
				// window.screen.width로 현재 윈도우창의 가로크기를 가져온다.
				// widdow.screen.height로 현재 윈도우창의 세로크기를 가져온다.
				//아래 공식을 적용하여 팝업창을 현재 화면의 중간에 띄운다.
				var popupX = (window.screen.width / 2) - (popupWidth / 2);
				var popupY = (window.screen.height / 2) - (popupHeight / 2);
								
				window.open("${pageContext.request.contextPath}/commentsWriteForm.do?contentsNo=${requestScope.contentsNo}", "평점입력",
						"width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);
			})
		})
	</script>
	평점  
	<button type="button" id="openCommentsWriteFormButton">평점쓰기</button>
	${requestScope.contentsNo}
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