<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- commentsList DIV Start -->
<div class="tableMargin" id="commentsList">
<div class="container-lg" style="margin-top: 100px">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#openCommentsWriteFormButton").click(function(){
				var popupWidth = 500; // 팝업창 가로크기
				var popupHeight = 600; // 팝업창 세로크기
				
				// window.screen.width로 현재 윈도우창의 가로크기를 가져온다.
				// widdow.screen.height로 현재 윈도우창의 세로크기를 가져온다.
				//아래 공식을 적용하여 팝업창을 현재 화면의 중간에 띄운다.
				var popupX = (window.screen.width / 2) - (popupWidth / 2);
				var popupY = (window.screen.height / 2) - (popupHeight / 2);
								
				window.open("${pageContext.request.contextPath}/commentsWriteForm.do?contentsNo=${requestScope.contentsNo}", "평점입력",
						"width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);
			});
			$(".starPointImg").each(function(){
				var starPoint = $(this).html();
				$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
			})
		});	
		
		/* function setStarImg(){
			alert($(".starPointImg").length);
			alert($(".starPointImg").eq('3').html());
			
		} */
		function commentsDeleteConfirm(){
			return confirm('삭제하시겠습니까?');
		}		
	</script>
	<h4 style="display: inline-flex;">평점</h4>
	<sec:authorize access="hasRole('ROLE_MEMBER')" >
	<button type="button" id="openCommentsWriteFormButton" style="width: 80px;">평점쓰기</button>
	</sec:authorize> 
	<%-- <sec:authentication property="principal.id" var="userId"/> --%>
	<%-- <sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/> --%>
	
	<table class="table table-borderde table-hober boardlist">
		<c:forEach items="${requestScope.commentsListByContentsNo.list}" var="commentsListByContentsNo">
		<tr>
			<td class="starPointImg">${commentsListByContentsNo.commentsStars}</td>
			<td>${commentsListByContentsNo.commentsStars}</td>
			<td>
				${commentsListByContentsNo.comments}<br>
				${commentsListByContentsNo.memberVO.id }
				${commentsListByContentsNo.commentsPostedTime}
				<a href="#">신고</a>
				<%-- <c:set var="writerId" value="${commentsListByContentsNo.memberVO.id }"/> --%>
				<%-- <c:if test="${writerId == userId || isAdmin == 'true'}"> --%>
	 			<form action="${pageContext.request.contextPath}/commentsDelete.do" method="post" onsubmit="return commentsDeleteConfirm()" style="display: inline-flex;">
					<sec:csrfInput/>
					<input type="hidden" name="contentsNo" value="${requestScope.contentsNo}">
					<input type="hidden" name="commentsDelete" value="${commentsListByContentsNo.commentsNo}">
					<input type="hidden" name="pageNo" value="${requestScope.commentsListByContentsNo.pagingBean.nowPage}">
					<input type="submit" value="삭제">
				</form>
			<%-- </c:if> --%>
			</td>
			
		</tr>
		</c:forEach>
	</table>
	
	 
	<div class="pagingInfo">
		<c:set var="pagingBean" value="${requestScope.commentsListByContentsNo.pagingBean}"/>
		<!-- justify-content-center로 페이징을 화면 가운데 위치시킨다.(BootStrap) -->
		<ul class="pagination justify-content-center">
			<c:if test="${pagingBean.previousPageGroup}">
				<li class="page-item"><a href="${pageContext.request.contextPath}/contentsDetail.do?commentsPageNo=${pagingBean.startPageOfPageGroup-1}&contentsNo=${requestScope.contentsNo}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pagingBean.nowPage!=i}">
						<li class="page-item"><a href="${pageContext.request.contextPath}/contentsDetail.do?commentsPageNo=${i}&contentsNo=${requestScope.contentsNo}">${i}</a></li>
					</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingBean.nextPageGroup}">
				<li class="page-item"><a href="${pageContext.request.contextPath}/contentsDetail.do?commentsPageNo=${pagingBean.endPageOfPageGroup+1}&contentsNo=${requestScope.contentsNo}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>
</div>	<!-- commentsList DIV End -->
