<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="container boardClassMain">
	<h4>FAQ  자주 묻는 질문</h4>
	<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
		<thead>
			<tr>
				<th>조회수</th>
				<th>제목</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="fvo" items="${requestScope.faqListVO.faqList}">
			<tr>
				<td>${fvo.faqHits}</td>
				<td><a href="${pageContext.request.contextPath}/faqDetail.do?faqNo=${fvo.faqNo}">${fvo.faqTitle}</a></td>
				<td>${fvo.faqPostedTime}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

<div class="boardBottomDiv" style="width: 50%">
<div class="pagingInfo" id="pagingLocation">
	<c:set var="pagingBean" value="${requestScope.faqListVO.pagingBean}"></c:set>
		<ul class="pagination">
		<c:if test="${pagingBean.previousPageGroup}">
		<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pagingBean.nowPage!=i}">
					<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">
			<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div><!-- pagingInfo -->
</div><!-- boardBottomDiv -->
</div><!-- container boardClassMain -->