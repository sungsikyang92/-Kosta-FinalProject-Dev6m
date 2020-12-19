<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="tableMargin">
	<div class="container-lg boardClassMain">
	<h2>FAQ 자주 묻는 질문</h2>
<form>
<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
	<thead>
		<tr>
			<th>NO</th>
			<th>조회수</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="fvo" items="${requestScope.lvo.faqList}">
			<tr>
				<td>${fvo.faqNo}</td>
				<td>${fvo.faqHits}</td>
				<td><a href="${pageContext.request.contextPath}/faqDetail.do?faqNo=${fvo.faqNo}">${fvo.faqTitle}</a></td>
				<td>${fvo.memberVO.id}</td>
				<td>${fvo.faqPostedTime}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</form>
<div class="faqWriteBtn">
<a href="${pageContext.request.contextPath}/faqWriteForm.do"><input type="button" value="FAQ 작성" ></a>
</div>

<div class="boardBottomDiv" style="width: 50%;"> 
	<div class="pagingInfo" id="pagingLocation">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<!-- <div class="pageNoBtn"> -->
	<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${i}">${i}</a></li> 
	<!-- </div> -->
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>	
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div> 	
</div>
</div>
</div>