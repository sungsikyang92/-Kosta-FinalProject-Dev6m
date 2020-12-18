<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 공지사항 게시판 목록 jsp -->
<div class="container boardClassMain">
	<h4 style="display: inline-flex;">공지사항</h4>
	<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>아이디</td>
			<td>작성일자</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${requestScope.noticeList.list}" var="noticeList">
		<tr>
			<td>${noticeList.noticeNo}</td>
			<td>
				<!-- 공지사항 자세히 보기 링크 페이지 넘버를 함께 넘겨 목록으로 돌아가거나
				삭제 후 해당 게시물이 위치하던 페이지로 돌아갈 수 있도록 한다.-->
				<a href="${pageContext.request.contextPath}/noticeDetail.do?noticeNo=${noticeList.noticeNo}
				&pageNo=${requestScope.noticeList.pagingBean.nowPage}">${noticeList.noticeTitle}</a>
			</td>
			<td>${noticeList.memberVO.id}</td>
			<td>${noticeList.noticePostedTime}</td>
			<td>${noticeList.noticeHits}</td>
		</tr>
		</c:forEach>
	</table>
<div class="boardBottomDiv" style="width: 50%">
<div class="pagingInfo" id="pagingLocation">
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
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">
			<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div><!-- pagingInfo -->
</div><!-- boardBottomDiv -->
</div><!-- container boardClassMain -->