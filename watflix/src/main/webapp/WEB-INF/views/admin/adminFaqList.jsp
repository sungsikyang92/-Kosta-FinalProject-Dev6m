<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="tableMargin">
	<div class="container-lg boardClassMainFaQ">
		<h4 style="display: inline-flex;">FAQ 자주 묻는 질문</h4>
		<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
			<thead>
				<tr>
					<th class="th_titleFaQ">제목</th>
					<th class="th_hitsFaQ">조회수</th>
					<th class="th_dateFaQ">공지시간</th>
					<th class="th_authorFaQ">작성자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="fvo" items="${requestScope.faqListVO.faqList}">
				<tr>
					<td class="td_titleFaQ"><a href="${pageContext.request.contextPath}/faqDetailNoHitsForAdmin.do?faqNo=${fvo.faqNo}" style="color:black">${fvo.faqTitle}</a></td>
					<td class="td_hitsFaQ">${fvo.faqHits}</td>
					<td class="td_dateFaQ">${fvo.faqPostedTime}</td>
					<td class="th_authorFaQ">${fvo.memberVO.id}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			 <button type="button" style="width:80px; float:right;" onclick="location.href = '${pageContext.request.contextPath}/faqWriteForm.do'">글쓰기</button>
		</sec:authorize>
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
</div><!-- tableMargin -->