<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function(){
		// 게시물 전체 선택 (삭제) 
		$("#checkAll").click(function(){
			if($(this).is(":checked")){
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
		// 일괄 삭제 (선택된 글이 없으면 alert을 호출한다.)
		$("#deleteNoticeByCheckboxForm").submit(function(){
			var deleteCount = $("input[name='deleteCheckbox']:checked").length;
			if(deleteCount == 0){
				alert("삭제할 글을 선택해주세요.");
				return false;
			} else {
				return confirm("삭제하시겠습니까?");
			}					
		})
		$(".starPointImg").each(function(){
				var starPoint = $(this).html();
				$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
		})
	})
	// delete confirm
	function commentsDeleteConfirm(){
		return confirm('삭제하시겠습니까?');
	}
	
</script>
<div class="container boardClassMain">
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<%-- <sec:authentication property="principal.id" var="userId"/> --%>
	<%-- <sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/> --%>
	
	<table class="table table-borderde table-hober boardlist">
		<c:forEach items="${requestScope.commentsList.list}" var="commentsList">
		<tr>
			<td class="starPointImg">${commentsList.commentsStars}</td>
			<td>${commentsList.commentsStars}</td>
			<td>
				${commentsList.comments}<br>
				${commentsList.memberVO.id }
				${commentsList.commentsPostedTime}
				<!-- 삭제버튼 (작성자와 관리자에게만 노출된다.) -->
				<%-- <c:set var="writerId" value="${commentsList.memberVO.id }"/> --%>
				<%-- <c:if test="${writerId == userId || isAdmin == 'true'}"> --%>
	 			<form action="${pageContext.request.contextPath}/commentsDelete.do" method="post" onsubmit="return commentsDeleteConfirm()" style="display: inline-flex;">
					<sec:csrfInput/>
					<input type="hidden" name="contentsNo" value="${requestScope.contentsNo}">
					<input type="hidden" name="commentsDelete" value="${commentsList.commentsNo}">
					<input type="hidden" name="pageNo" value="${requestScope.commentsList.pagingBean.nowPage}">
					<input type="submit" value="삭제">
				</form>
				<%-- </c:if> --%>
			</td>
		</tr>
		</c:forEach>
	</table>
	<!--
	전체게시물조회 메인화면에서 페이징과 버튼을 사용하지 않기 위해 사용한다.
	tiles를 통해서 불러오는 리스트의 경우 forNotUsePagingAndBtn의 값은 true
	-->
	<c:if test="${requestScope.forNotUsePagingAndBtn != true}">
<div class="boardBottomDiv">
	<div class="pagingInfo" id="pagingLocation">
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
	</div>
</c:if>
</sec:authorize>
</div>